.class final Ld;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static a:I

.field private static a:Ld;

.field private static a:Ljava/lang/Thread;

.field private static a:Ljavax/microedition/media/Player;

.field private static a:[I

.field private static a:[Ljava/lang/String;

.field private static a:[[B

.field private static b:I

.field private static b:[I

.field private static c:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/4 v0, 0x0

    sput-object v0, Ld;->a:[[B

    sput-object v0, Ld;->a:Ljavax/microedition/media/Player;

    const/4 v1, 0x0

    sput v1, Ld;->a:I

    sput-object v0, Ld;->a:[Ljava/lang/String;

    const/4 v0, -0x2

    sput v0, Ld;->c:I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static a()I
    .locals 1

    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    :cond_0
    sget v0, Ld;->c:I

    return v0
.end method

.method static a()V
    .locals 3

    sget v0, Ld;->a:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    sput v1, Ld;->a:I

    :cond_0
    sget-object v0, Ld;->a:[I

    if-eqz v0, :cond_1

    sget-object v0, Ld;->a:[I

    sget v1, Ld;->a:I

    const/4 v2, 0x3

    aput v2, v0, v1

    sget-object v0, Ld;->b:[I

    sget v1, Ld;->a:I

    const/4 v2, -0x1

    aput v2, v0, v1

    :cond_1
    sget v0, Ld;->a:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Ld;->a:I

    return-void
.end method

.method static a(I)V
    .locals 1

    const/16 p0, 0x19

    new-array v0, p0, [Ljava/lang/String;

    sput-object v0, Ld;->a:[Ljava/lang/String;

    new-array p0, p0, [[B

    sput-object p0, Ld;->a:[[B

    const/16 p0, 0x14

    new-array v0, p0, [I

    sput-object v0, Ld;->a:[I

    new-array p0, p0, [I

    sput-object p0, Ld;->b:[I

    new-instance p0, Ld;

    invoke-direct {p0}, Ld;-><init>()V

    sput-object p0, Ld;->a:Ld;

    new-instance p0, Ljava/lang/Thread;

    sget-object v0, Ld;->a:Ld;

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    sput-object p0, Ld;->a:Ljava/lang/Thread;

    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method static a(II)V
    .locals 2

    sget-boolean p1, Lh;->a:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    sget p1, Ld;->a:I

    const/4 v0, 0x2

    if-lt p1, v0, :cond_1

    sput v0, Ld;->a:I

    :cond_1
    sget-object p1, Ld;->a:[I

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    sget-object p1, Ld;->a:[I

    sget v1, Ld;->a:I

    aput v0, p1, v1

    sget-object p1, Ld;->b:[I

    sget v1, Ld;->a:I

    aput p0, p1, v1

    :cond_2
    sget p0, Ld;->a:I

    add-int/2addr p0, v0

    sput p0, Ld;->a:I

    sput v0, Ld;->b:I

    return-void
.end method

.method static a(Ljava/lang/String;)V
    .locals 2

    invoke-static {p0}, Lh;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_0
    const/16 v0, 0x19

    if-ge p0, v0, :cond_0

    sget-object v0, Ld;->a:[[B

    invoke-static {p0}, Lh;->a(I)[B

    move-result-object v1

    aput-object v1, v0, p0

    sget-object v0, Ld;->a:[Ljava/lang/String;

    sget v1, Lh;->b:I

    invoke-static {v1}, Lh;->a(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, p0

    add-int/lit8 p0, p0, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Lh;->f()V

    return-void
.end method

.method static a()Z
    .locals 3

    sget-boolean v0, Lh;->a:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    if-nez v0, :cond_1

    return v1

    :cond_1
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->getState()I

    move-result v0

    const/16 v2, 0x190

    if-eq v0, v2, :cond_2

    return v1

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method private static a(I)Z
    .locals 1

    const/16 v0, 0x15

    if-eq p0, v0, :cond_1

    const/16 v0, 0x14

    if-eq p0, v0, :cond_1

    const/16 v0, 0x11

    if-eq p0, v0, :cond_1

    const/16 v0, 0x12

    if-eq p0, v0, :cond_1

    const/16 v0, 0x13

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method private static b()V
    .locals 1

    :try_start_0
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->stop()V

    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->close()V

    const/4 v0, 0x0

    sput-object v0, Ld;->a:Ljavax/microedition/media/Player;

    const/4 v0, -0x1

    sput v0, Ld;->c:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method private static b(I)V
    .locals 2

    if-gez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    sget-object v0, Ld;->a:[[B

    if-eqz v0, :cond_5

    sget-object v0, Ld;->a:[[B

    aget-object v0, v0, p0

    if-eqz v0, :cond_5

    sget-object v0, Ld;->a:[Ljava/lang/String;

    aget-object v0, v0, p0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    const/16 v1, 0x190

    if-eqz v0, :cond_2

    sget v0, Ld;->c:I

    invoke-static {v0}, Ld;->a(I)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->getState()I

    move-result v0

    if-ne v0, v1, :cond_2

    invoke-static {p0}, Ld;->a(I)Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    if-eqz v0, :cond_3

    sget v0, Ld;->c:I

    if-ne v0, p0, :cond_3

    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->getState()I

    move-result v0

    if-ne v0, v1, :cond_3

    return-void

    :cond_3
    invoke-static {}, Ld;->c()V

    new-instance v0, Ljava/io/ByteArrayInputStream;

    sget-object v1, Ld;->a:[[B

    aget-object v1, v1, p0

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    sget-object v1, Ld;->a:[Ljava/lang/String;

    aget-object v1, v1, p0

    invoke-static {v0, v1}, Ljavax/microedition/media/Manager;->createPlayer(Ljava/io/InputStream;Ljava/lang/String;)Ljavax/microedition/media/Player;

    move-result-object v0

    sput-object v0, Ld;->a:Ljavax/microedition/media/Player;

    if-eqz v0, :cond_4

    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->start()V

    :cond_4
    sput p0, Ld;->c:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_5
    :goto_0
    return-void

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method private static c()V
    .locals 1

    :try_start_0
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->stop()V

    sget-object v0, Ld;->a:Ljavax/microedition/media/Player;

    invoke-interface {v0}, Ljavax/microedition/media/Player;->close()V

    const/4 v0, 0x0

    sput-object v0, Ld;->a:Ljavax/microedition/media/Player;

    const/4 v0, -0x1

    sput v0, Ld;->c:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    :goto_0
    sget-object v0, Ld;->a:Ljava/lang/Thread;

    if-eqz v0, :cond_3

    sget-object v0, Ld;->a:[I

    const/4 v1, 0x0

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-static {}, Ld;->c()V

    goto :goto_1

    :pswitch_1
    invoke-static {}, Ld;->b()V

    goto :goto_1

    :pswitch_2
    sget-object v0, Ld;->b:[I

    aget v0, v0, v1

    invoke-static {v0}, Ld;->b(I)V

    :goto_1
    sget-object v0, Ld;->a:[I

    if-eqz v0, :cond_2

    sget v0, Ld;->a:I

    if-gtz v0, :cond_0

    goto :goto_3

    :cond_0
    const/4 v0, 0x1

    const/4 v2, 0x1

    :goto_2
    sget v3, Ld;->a:I

    const/4 v4, -0x1

    if-ge v2, v3, :cond_1

    sget-object v3, Ld;->a:[I

    add-int/lit8 v5, v2, -0x1

    sget-object v6, Ld;->a:[I

    aget v6, v6, v2

    aput v6, v3, v5

    sget-object v3, Ld;->a:[I

    aput v1, v3, v2

    sget-object v3, Ld;->b:[I

    sget-object v6, Ld;->b:[I

    aget v6, v6, v2

    aput v6, v3, v5

    sget-object v3, Ld;->b:[I

    aput v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_1
    sget v2, Ld;->a:I

    sub-int/2addr v2, v0

    sput v2, Ld;->a:I

    if-nez v2, :cond_2

    sget-object v0, Ld;->a:[I

    aput v1, v0, v1

    sget-object v0, Ld;->b:[I

    aput v4, v0, v1

    :cond_2
    :goto_3
    const-wide/16 v0, 0x32

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0

    :cond_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
