package javax.microedition.lcdui;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import java.io.InputStream;
import java.io.IOException;

public class Image {
    private Bitmap bitmap;
    private Graphics graphics;

    public Image(Bitmap b) {
        this.bitmap = b;
    }

    public static Image createImage(int width, int height) {
        Bitmap b = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        return new Image(b);
    }

    public static Image createImage(String name) throws IOException {
        InputStream is = ResourceLoader.open(name);
        if (is == null) throw new IOException("Resource not found: " + name);
        try {
            return createImage(is);
        } finally {
            is.close();
        }
    }

    public static Image createImage(InputStream is) throws IOException {
        if (is == null) throw new IOException("InputStream is null");
        Bitmap b = BitmapFactory.decodeStream(is);
        if (b == null) throw new IOException("Failed to decode image from stream");
        return new Image(b);
    }

    public static Image createImage(byte[] imageData, int imageOffset, int imageLength) {
        Bitmap b = BitmapFactory.decodeByteArray(imageData, imageOffset, imageLength);
        return new Image(b);
    }

    public static Image createImage(Image src) {
        if (src == null || src.getBitmap() == null) return null;
        return new Image(Bitmap.createBitmap(src.getBitmap()));
    }

    public static Image createImage(Image src, int x, int y, int width, int height, int transform) {
        if (src == null || src.getBitmap() == null || width <= 0 || height <= 0) {
            throw new IllegalArgumentException("Invalid source image or dimensions");
        }
        int outW = width;
        int outH = height;
        if (transform == 4 || transform == 5 || transform == 6 || transform == 7) {
            outW = height;
            outH = width;
        }
        Image out = createImage(outW, outH);
        out.getGraphics().drawRegion(src, x, y, width, height, transform, 0, 0, Graphics.TOP | Graphics.LEFT);
        return out;
    }

    public static Image createRGBImage(int[] rgb, int width, int height, boolean processAlpha) {
        if (rgb == null || width <= 0 || height <= 0) return null;
        if (!processAlpha) {
            int[] opaque = new int[rgb.length];
            for (int i = 0; i < rgb.length; i++) {
                opaque[i] = rgb[i] | 0xFF000000;
            }
            rgb = opaque;
        }
        Bitmap b = Bitmap.createBitmap(rgb, width, height, Bitmap.Config.ARGB_8888);
        return new Image(b);
    }

    public int getWidth() {
        return bitmap != null ? bitmap.getWidth() : 0;
    }

    public int getHeight() {
        return bitmap != null ? bitmap.getHeight() : 0;
    }

    public Bitmap getBitmap() {
        return bitmap;
    }

    public Graphics getGraphics() {
        if (graphics == null) {
            graphics = new Graphics(this.bitmap);
        }
        return graphics;
    }

    public void getRGB(int[] rgbData, int offset, int scanlength, int x, int y, int width, int height) {
        if (bitmap == null || rgbData == null) return;
        try {
            bitmap.getPixels(rgbData, offset, scanlength, x, y, width, height);
        } catch (Throwable t) {
            t.printStackTrace();
        }
    }
}
