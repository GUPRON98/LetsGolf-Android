package javax.microedition.lcdui;

import android.content.Context;
import android.util.Log;
import java.io.InputStream;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;

public class ResourceLoader {
    private static final String TAG = "ResourceLoader";
    public static Context appContext;

    public static InputStream open(String path) {
        if (path == null) return null;
        if (path.startsWith("/")) {
            path = path.substring(1);
        }
        InputStream is = null;
        if (appContext != null) {
            try {
                is = appContext.getAssets().open(path);
            } catch (IOException ignored) {}
        }
        if (is == null) {
            File f = new File("/data/data/com.termux/files/home/DeathRace-Android/app/src/main/assets/" + path);
            if (f.exists()) {
                try {
                    is = new FileInputStream(f);
                } catch (Exception ignored) {}
            }
        }
        if (is == null) {
            try {
                is = ResourceLoader.class.getClassLoader().getResourceAsStream("assets/" + path);
            } catch (Throwable ignored) {}
        }
        if (is == null) {
            try {
                is = ResourceLoader.class.getClassLoader().getResourceAsStream(path);
            } catch (Throwable ignored) {}
        }
        if (is == null) {
            try {
                is = ResourceLoader.class.getResourceAsStream("/" + path);
            } catch (Throwable ignored) {}
        }
        Log.i(TAG, "open('" + path + "') -> " + (is != null ? "SUCCESS" : "NOT FOUND"));
        return toMemoryStream(is);
    }

    private static InputStream toMemoryStream(InputStream is) {
        if (is == null) return null;
        try {
            java.io.ByteArrayOutputStream baos = new java.io.ByteArrayOutputStream();
            byte[] buf = new byte[4096];
            int n;
            while ((n = is.read(buf)) != -1) {
                baos.write(buf, 0, n);
            }
            return new java.io.ByteArrayInputStream(baos.toByteArray());
        } catch (Exception e) {
            return is;
        } finally {
            try { is.close(); } catch (Exception ignored) {}
        }
    }
}
