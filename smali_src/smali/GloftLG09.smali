.class public LGloftLG09;
.super Ljavax/microedition/midlet/MIDlet;


# static fields
.field static a:LGloftLG09;

.field private static a:Lh;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljavax/microedition/midlet/MIDlet;-><init>()V

    sput-object p0, LGloftLG09;->a:LGloftLG09;

    sget-object v0, LGloftLG09;->a:Lh;

    if-nez v0, :cond_0

    new-instance v0, Lh;

    invoke-static {p0}, Ljavax/microedition/lcdui/Display;->getDisplay(Ljavax/microedition/midlet/MIDlet;)Ljavax/microedition/lcdui/Display;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lh;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sput-object v0, LGloftLG09;->a:Lh;

    invoke-virtual {v0}, Lh;->e()V

    :cond_0
    invoke-static {}, Lh;->b()V

    return-void
.end method


# virtual methods
.method public destroyApp(Z)V
    .locals 0

    invoke-static {}, Lh;->d()V

    invoke-virtual {p0}, Ljavax/microedition/midlet/MIDlet;->notifyDestroyed()V

    return-void
.end method

.method public pauseApp()V
    .locals 0

    invoke-static {}, Lh;->c()V

    return-void
.end method

.method public startApp()V
    .locals 1

    sget-object v0, LGloftLG09;->a:Lh;

    invoke-virtual {v0}, Lh;->a()V

    return-void
.end method
