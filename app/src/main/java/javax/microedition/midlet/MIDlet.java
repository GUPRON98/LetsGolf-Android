package javax.microedition.midlet;

import java.util.HashMap;

public abstract class MIDlet {
    public static MIDlet instance;
    public static HashMap<String, String> appProperties = new HashMap<>();

    static {
        appProperties.put("MIDlet-1", "Let's Golf!, /icon.png, GloftLG09");
        appProperties.put("MIDlet-Icon", "/icon.png");
        appProperties.put("MIDlet-Name", "Let's Golf!");
        appProperties.put("MIDlet-Vendor", "[ANDREW-LVIV] / Gameloft SA");
        appProperties.put("MIDlet-Version", "1.0.5");
        appProperties.put("Manifest-Version", "1.0");
        appProperties.put("MicroEdition-Configuration", "CLDC-1.1");
        appProperties.put("MicroEdition-Profile", "MIDP-2.0");
        appProperties.put("microedition.locale", "en");
    }

    public MIDlet() {
        instance = this;
    }

    public abstract void startApp() throws MIDletStateChangeException;
    public abstract void pauseApp();
    public abstract void destroyApp(boolean unconditional) throws MIDletStateChangeException;

    public void notifyDestroyed() {}
    public void notifyPaused() {}

    public boolean platformRequest(String url) {
        return false;
    }

    public String getAppProperty(String key) {
        return appProperties.get(key);
    }
}
