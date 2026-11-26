package com.gameloft.letsgolf;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Bundle;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Toast;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import javax.microedition.lcdui.ResourceLoader;
import javax.microedition.midlet.MIDlet;

public class MainActivity extends Activity {
    private static final int GAME_W = 480;
    private static final int GAME_H = 800;
    private static final String PREFS = "letsgolf_prefs";

    private GameView gameView;
    private MIDlet midlet;
    private volatile int displayMode = 0; // 0 = Fullscreen Stretch, 1 = Native Aspect
    private volatile boolean hapticEnabled = true;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
            getWindow().getAttributes().layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES;
        }
        applyImmersiveFullscreen();

        SharedPreferences prefs = getSharedPreferences(PREFS, MODE_PRIVATE);
        displayMode = prefs.getInt("display_mode", 0);
        hapticEnabled = prefs.getBoolean("haptic", true);
        int savedFps = prefs.getInt("target_fps", 25);
        javax.microedition.lcdui.Canvas.setTargetFps(savedFps);

        ResourceLoader.appContext = getApplicationContext();
        System.setProperty("microedition.locale", "en");

        gameView = new GameView(this);
        setContentView(gameView);

        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    Class<?> cls = Class.forName("GloftLG09");
                    midlet = (MIDlet) cls.newInstance();
                    Method startApp = cls.getDeclaredMethod("startApp");
                    startApp.setAccessible(true);
                    startApp.invoke(midlet);
                } catch (Throwable t) {
                    t.printStackTrace();
                }
            }
        }).start();
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (gameView != null) gameView.setRunning(false);
        if (midlet != null) {
            try {
                Method m = midlet.getClass().getDeclaredMethod("pauseApp");
                m.setAccessible(true);
                m.invoke(midlet);
            } catch (Throwable ignored) {}
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (gameView != null) gameView.setRunning(true);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (midlet != null) {
            try { midlet.destroyApp(true); } catch (Throwable ignored) {}
        }
    }

    private void applyImmersiveFullscreen() {
        getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
        );
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) applyImmersiveFullscreen();
    }

    @Override
    public void onBackPressed() {
        showOptionsMenu();
    }

    private Field findField(Class<?> cls, String name, Class<?> type) {
        for (Field f : cls.getDeclaredFields()) {
            if (name.equals(f.getName()) && f.getType() == type) {
                f.setAccessible(true);
                return f;
            }
        }
        return null;
    }

    private void setIntField(Class<?> cls, String name, int val) {
        try {
            Field f = findField(cls, name, int.class);
            if (f != null) f.setInt(null, val);
        } catch (Throwable ignored) {}
    }

    private void setBoolField(Class<?> cls, String name, boolean val) {
        try {
            Field f = findField(cls, name, boolean.class);
            if (f != null) f.setBoolean(null, val);
        } catch (Throwable ignored) {}
    }

    private void showCheatDialog() {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                final String[] items = new String[] {
                        "⛳ Hole In One (Langsung Masuk)",
                        "🦅 Eagle",
                        "🐦 Birdie",
                        "🛠 Toggle Menu Debug Asli"
                };

                new AlertDialog.Builder(MainActivity.this, AlertDialog.THEME_DEVICE_DEFAULT_DARK)
                        .setTitle("⛳ CHEAT LET'S GOLF!")
                        .setItems(items, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                try {
                                    Class<?> hCls = Class.forName("h");
                                    if (which == 0) {
                                        setBoolField(hCls, "x", true);
                                        sendKeyPulse(50);
                                        Toast.makeText(MainActivity.this, "⛳ Hole In One!", Toast.LENGTH_SHORT).show();
                                    } else if (which == 1) {
                                        setBoolField(hCls, "x", true);
                                        sendKeyPulse(51);
                                        Toast.makeText(MainActivity.this, "🦅 Eagle!", Toast.LENGTH_SHORT).show();
                                    } else if (which == 2) {
                                        setBoolField(hCls, "x", true);
                                        sendKeyPulse(52);
                                        Toast.makeText(MainActivity.this, "🐦 Birdie!", Toast.LENGTH_SHORT).show();
                                    } else if (which == 3) {
                                        Field fx = findField(hCls, "x", boolean.class);
                                        boolean cur = fx != null && fx.getBoolean(null);
                                        setBoolField(hCls, "x", !cur);
                                        Toast.makeText(MainActivity.this, "Menu Debug: " + (!cur ? "ON" : "OFF"), Toast.LENGTH_SHORT).show();
                                    }
                                } catch (Throwable t) {
                                    Toast.makeText(MainActivity.this, "Cheat gagal: " + t.getClass().getSimpleName(), Toast.LENGTH_SHORT).show();
                                }
                            }
                        })
                        .setNegativeButton("Tutup", null)
                        .show();
            }
        });
    }

    private void sendKeyPulse(final int keyCode) {
        final javax.microedition.lcdui.Canvas c = javax.microedition.lcdui.Canvas.currentInstance;
        if (c == null) return;
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    c.keyPressed(keyCode);
                    Thread.sleep(70);
                    c.keyReleased(keyCode);
                } catch (Throwable ignored) {}
            }
        }).start();
    }

    private void showOptionsMenu() {
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                String modeLabel = "Mode Layar: " + (displayMode == 0 ? "Layar Penuh (Stretch)" : "Aspek Asli (480x800)");
                String fpsLabel = "Kecepatan FPS: " + javax.microedition.lcdui.Canvas.targetFps + " FPS";
                String hapticLabel = "Getar Tombol: " + (hapticEnabled ? "ON" : "OFF");

                final String[] items = new String[] {
                        modeLabel,
                        fpsLabel,
                        hapticLabel,
                        "Softkey Kiri (LSK)",
                        "Softkey Kanan (RSK)",
                        "Keluar Game"
                };

                new AlertDialog.Builder(MainActivity.this, AlertDialog.THEME_DEVICE_DEFAULT_DARK)
                        .setTitle("⚙ OPSI LET'S GOLF!")
                        .setItems(items, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                if (which == 0) {
                                    displayMode = (displayMode == 0) ? 1 : 0;
                                    getSharedPreferences(PREFS, MODE_PRIVATE).edit()
                                            .putInt("display_mode", displayMode).apply();
                                    if (gameView != null) gameView.forceRelayout();
                                } else if (which == 1) {
                                    int next = javax.microedition.lcdui.Canvas.cycleFps();
                                    getSharedPreferences(PREFS, MODE_PRIVATE).edit()
                                            .putInt("target_fps", next).apply();
                                    Toast.makeText(MainActivity.this, next + " FPS", Toast.LENGTH_SHORT).show();
                                } else if (which == 2) {
                                    hapticEnabled = !hapticEnabled;
                                    getSharedPreferences(PREFS, MODE_PRIVATE).edit()
                                            .putBoolean("haptic", hapticEnabled).apply();
                                } else if (which == 3) {
                                    sendKeyPulse(-6);
                                } else if (which == 4) {
                                    sendKeyPulse(-7);
                                } else if (which == 5) {
                                    finish();
                                }
                            }
                        })
                        .setNegativeButton("Lanjut", null)
                        .show();
            }
        });
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == KeyEvent.KEYCODE_BACK) {
            showOptionsMenu();
            return true;
        }
        int j2meKey = mapAndroidKey(keyCode);
        if (j2meKey != 0) {
            javax.microedition.lcdui.Canvas c = javax.microedition.lcdui.Canvas.currentInstance;
            if (c != null) c.keyPressed(j2meKey);
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        int j2meKey = mapAndroidKey(keyCode);
        if (j2meKey != 0) {
            javax.microedition.lcdui.Canvas c = javax.microedition.lcdui.Canvas.currentInstance;
            if (c != null) c.keyReleased(j2meKey);
            return true;
        }
        return super.onKeyUp(keyCode, event);
    }

    private int mapAndroidKey(int keyCode) {
        switch (keyCode) {
            case KeyEvent.KEYCODE_DPAD_UP:
            case KeyEvent.KEYCODE_W: return -1;
            case KeyEvent.KEYCODE_DPAD_DOWN:
            case KeyEvent.KEYCODE_S: return -2;
            case KeyEvent.KEYCODE_DPAD_LEFT:
            case KeyEvent.KEYCODE_A: return -3;
            case KeyEvent.KEYCODE_DPAD_RIGHT:
            case KeyEvent.KEYCODE_D: return -4;
            case KeyEvent.KEYCODE_DPAD_CENTER:
            case KeyEvent.KEYCODE_ENTER:
            case KeyEvent.KEYCODE_SPACE: return -5;
            case KeyEvent.KEYCODE_MENU: return -6;
            default: return 0;
        }
    }

    private class GameView extends SurfaceView implements SurfaceHolder.Callback, Runnable {
        private Thread renderThread;
        private volatile boolean running = false;
        private boolean surfaceReady = false;

        private final RectF dstRect = new RectF();
        private final RectF cheatRect = new RectF();
        private final RectF opsiRect = new RectF();

        private final Paint bitmapPaint = new Paint(Paint.FILTER_BITMAP_FLAG);
        private final Paint cheatBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint opsiBgPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint btnStrokePaint = new Paint(Paint.ANTI_ALIAS_FLAG);
        private final Paint btnTextPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

        private int activeGamePointerId = -1;
        private int lastW = 0, lastH = 0;

        public GameView(MainActivity context) {
            super(context);
            getHolder().addCallback(this);
            setFocusable(true);
            setFocusableInTouchMode(true);

            btnStrokePaint.setStyle(Paint.Style.STROKE);
            btnStrokePaint.setStrokeWidth(2.4f);
            btnStrokePaint.setColor(Color.rgb(0, 230, 120));

            btnTextPaint.setColor(Color.WHITE);
            btnTextPaint.setTextAlign(Paint.Align.CENTER);
            btnTextPaint.setTypeface(Typeface.create(Typeface.DEFAULT, Typeface.BOLD));
        }

        public void forceRelayout() {
            lastW = 0;
            lastH = 0;
        }

        public void setRunning(boolean r) {
            if (r && !running && surfaceReady) {
                running = true;
                renderThread = new Thread(this);
                renderThread.start();
            } else if (!r) {
                running = false;
            }
        }

        @Override
        public void surfaceCreated(SurfaceHolder holder) {
            surfaceReady = true;
            setRunning(true);
        }

        @Override
        public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
            updateLayout(width, height);
        }

        @Override
        public void surfaceDestroyed(SurfaceHolder holder) {
            surfaceReady = false;
            running = false;
            if (renderThread != null) {
                try { renderThread.join(300); } catch (InterruptedException ignored) {}
            }
        }

        private void updateLayout(int viewW, int viewH) {
            if (viewW <= 0 || viewH <= 0) return;
            if (viewW == lastW && viewH == lastH) return;
            lastW = viewW;
            lastH = viewH;

            if (displayMode == 0) {
                dstRect.set(0, 0, viewW, viewH);
            } else {
                float scale = Math.min((float) viewW / GAME_W, (float) viewH / GAME_H);
                float drawW = GAME_W * scale;
                float drawH = GAME_H * scale;
                float left = (viewW - drawW) / 2f;
                float top = (viewH - drawH) / 2f;
                dstRect.set(left, top, left + drawW, top + drawH);
            }

            float density = getResources().getDisplayMetrics().density;
            float btnW = 90f * density;
            float btnH = 34f * density;
            float margin = 12f * density;

            cheatRect.set(margin, margin, margin + btnW, margin + btnH);
            opsiRect.set(viewW - margin - btnW, margin, viewW - margin, margin + btnH);
            cheatBgPaint.setShader(new LinearGradient(
                    0, margin, 0, margin + btnH,
                    Color.argb(190, 200, 35, 85), Color.argb(190, 95, 10, 40),
                    Shader.TileMode.CLAMP));
            opsiBgPaint.setShader(new LinearGradient(
                    0, margin, 0, margin + btnH,
                    Color.argb(190, 20, 60, 110), Color.argb(190, 10, 25, 50),
                    Shader.TileMode.CLAMP));
            btnTextPaint.setTextSize(12.5f * density);
        }

        @Override
        public void run() {
            while (running && surfaceReady) {
                updateLayout(getWidth(), getHeight());
                Canvas canvas = null;
                try {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        canvas = getHolder().lockHardwareCanvas();
                    } else {
                        canvas = getHolder().lockCanvas();
                    }
                    if (canvas != null) {
                        canvas.drawColor(Color.BLACK);
                        synchronized (javax.microedition.lcdui.Canvas.swapLock) {
                            Bitmap bmp = javax.microedition.lcdui.Canvas.displayBitmap;
                            if (bmp != null && !bmp.isRecycled()) {
                                canvas.drawBitmap(bmp, null, dstRect, bitmapPaint);
                            }
                        }

                        canvas.drawRoundRect(cheatRect, 12f, 12f, cheatBgPaint);
                        canvas.drawRoundRect(cheatRect, 12f, 12f, btnStrokePaint);
                        float textYc = cheatRect.centerY() - (btnTextPaint.descent() + btnTextPaint.ascent()) / 2f;
                        canvas.drawText("⚡ CHEAT", cheatRect.centerX(), textYc, btnTextPaint);

                        canvas.drawRoundRect(opsiRect, 12f, 12f, opsiBgPaint);
                        canvas.drawRoundRect(opsiRect, 12f, 12f, btnStrokePaint);
                        float textY = opsiRect.centerY() - (btnTextPaint.descent() + btnTextPaint.ascent()) / 2f;
                        canvas.drawText("⚙ OPSI", opsiRect.centerX(), textY, btnTextPaint);
                    }
                } catch (Throwable ignored) {
                } finally {
                    if (canvas != null) {
                        try { getHolder().unlockCanvasAndPost(canvas); } catch (Throwable ignored) {}
                    }
                }

                try { Thread.sleep(16); } catch (InterruptedException ignored) {}
            }
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            int action = event.getActionMasked();
            int idx = event.getActionIndex();
            int pid = event.getPointerId(idx);
            float x = event.getX(idx);
            float y = event.getY(idx);

            javax.microedition.lcdui.Canvas j2meCanvas = javax.microedition.lcdui.Canvas.currentInstance;

            if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_POINTER_DOWN) {
                if (cheatRect.contains(x, y)) {
                    if (hapticEnabled) performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                    showCheatDialog();
                    return true;
                }
                if (opsiRect.contains(x, y)) {
                    if (hapticEnabled) performHapticFeedback(HapticFeedbackConstants.VIRTUAL_KEY);
                    showOptionsMenu();
                    return true;
                }

                if (activeGamePointerId == -1) {
                    activeGamePointerId = pid;
                    if (j2meCanvas != null) {
                        j2meCanvas.pointerPressed(mapGameX(x), mapGameY(y));
                    }
                }
                return true;
            } else if (action == MotionEvent.ACTION_MOVE) {
                if (activeGamePointerId != -1) {
                    int pIndex = event.findPointerIndex(activeGamePointerId);
                    if (pIndex >= 0 && j2meCanvas != null) {
                        j2meCanvas.pointerDragged(mapGameX(event.getX(pIndex)), mapGameY(event.getY(pIndex)));
                    }
                }
                return true;
            } else if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_POINTER_UP || action == MotionEvent.ACTION_CANCEL) {
                if (pid == activeGamePointerId) {
                    if (j2meCanvas != null) {
                        j2meCanvas.pointerReleased(mapGameX(x), mapGameY(y));
                    }
                    activeGamePointerId = -1;
                }
                return true;
            }
            return super.onTouchEvent(event);
        }

        private int mapGameX(float screenX) {
            if (dstRect.width() <= 0) return 0;
            int gx = Math.round((screenX - dstRect.left) * GAME_W / dstRect.width());
            return Math.max(0, Math.min(GAME_W - 1, gx));
        }

        private int mapGameY(float screenY) {
            if (dstRect.height() <= 0) return 0;
            int gy = Math.round((screenY - dstRect.top) * GAME_H / dstRect.height());
            return Math.max(0, Math.min(GAME_H - 1, gy));
        }
    }
}
