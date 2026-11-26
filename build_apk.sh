#!/data/data/com.termux/files/usr/bin/env bash
set -e

PROJ_DIR="$(cd "$(dirname "$0")" && pwd)"
SDK_JAR="/data/data/com.termux/files/usr/share/android-sdk/android.jar"
BUILD_DIR="$PROJ_DIR/build"
APK_NAME="LetsGolf.apk"
KEYSTORE="$PROJ_DIR/letsgolf.keystore"

echo "=== 1. Clean & Prepare ==="
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR/gen" "$BUILD_DIR/classes" "$BUILD_DIR/dex" "$BUILD_DIR/smali_merged"

echo "=== 2. AAPT Package Resources ==="
aapt package -f -m \
    -J "$BUILD_DIR/gen" \
    -M "$PROJ_DIR/app/src/main/AndroidManifest.xml" \
    -S "$PROJ_DIR/app/src/main/res" \
    -A "$PROJ_DIR/app/src/main/assets" \
    -I "$SDK_JAR" \
    -F "$BUILD_DIR/resources.ap_"

echo "=== 3. Compile Java ==="
JAVA_FILES=$(find "$PROJ_DIR/app/src/main/java" "$BUILD_DIR/gen" -name "*.java")
javac -source 1.8 -target 1.8 -bootclasspath "$SDK_JAR" -classpath "$SDK_JAR" \
    -d "$BUILD_DIR/classes" $JAVA_FILES

echo "=== 4. D8 Java Classes ==="
d8 --min-api 21 --output "$BUILD_DIR/dex" $(find "$BUILD_DIR/classes" -name "*.class")

echo "=== 5. Disassemble & Merge Smali ==="
cd "$BUILD_DIR"
zip -q tmp_shim.apk -j dex/classes.dex
apktool d -f tmp_shim.apk -o shim_smali
rm -f tmp_shim.apk

cp -r "$PROJ_DIR/smali_src/smali/"* "$BUILD_DIR/smali_merged/"
cp -r "$BUILD_DIR/shim_smali/smali/"* "$BUILD_DIR/smali_merged/"

echo "=== 6. Assemble Merged Smali ==="
mkdir -p "$BUILD_DIR/apk_build/smali"
cp -r "$BUILD_DIR/smali_merged/"* "$BUILD_DIR/apk_build/smali/"
printf "version: 2.0.0\napkFileName: patched_game.apk\n" > "$BUILD_DIR/apk_build/apktool.yml"
apktool b "$BUILD_DIR/apk_build" -o "$BUILD_DIR/patched_game.apk"

echo "=== 7. Combine Resources + DEX ==="
unzip -p "$BUILD_DIR/patched_game.apk" classes.dex > "$BUILD_DIR/classes.dex"
cp "$BUILD_DIR/resources.ap_" "$BUILD_DIR/unsigned.apk"
cd "$BUILD_DIR"
aapt add unsigned.apk classes.dex

echo "=== 8. Zipalign & Sign ==="
zipalign -f 4 "$BUILD_DIR/unsigned.apk" "$BUILD_DIR/aligned.apk"
if [ ! -f "$KEYSTORE" ]; then
    keytool -genkey -v -keystore "$KEYSTORE" -alias letsgolf -keyalg RSA -keysize 2048 \
        -validity 10000 -storepass 123456 -keypass 123456 \
        -dname "CN=LetsGolf, OU=Game, O=Gameloft, L=ID, ST=ID, C=ID"
fi
apksigner sign --ks "$KEYSTORE" --ks-pass pass:123456 --out "$PROJ_DIR/$APK_NAME" "$BUILD_DIR/aligned.apk"
cp "$PROJ_DIR/$APK_NAME" "/sdcard/ai/$APK_NAME"

ls -lh "/sdcard/ai/$APK_NAME"
echo "Build selesai!"
