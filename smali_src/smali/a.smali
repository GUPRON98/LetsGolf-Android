.class final La;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field private static i:I

.field private static k:I

.field private static final l:I


# instance fields
.field a:I

.field private a:Lc;

.field private a:Z

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:I

.field private j:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x42

    sput v0, La;->i:I

    const/4 v0, -0x1

    sput v0, La;->k:I

    const/4 v0, 0x2

    sput v0, La;->l:I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, La;->b()V

    return-void
.end method

.method constructor <init>(Lc;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, La;->b()V

    iput p2, p0, La;->b:I

    iput p3, p0, La;->c:I

    invoke-virtual {p0, p1}, La;->a(Lc;)V

    return-void
.end method

.method private b()V
    .locals 2

    const/4 v0, 0x0

    iput v0, p0, La;->b:I

    iput v0, p0, La;->c:I

    sget v1, La;->k:I

    iput v1, p0, La;->d:I

    iput v0, p0, La;->e:I

    const/4 v1, 0x0

    iput-object v1, p0, La;->a:Lc;

    iput v0, p0, La;->a:I

    iput v0, p0, La;->f:I

    const/4 v0, 0x1

    iput v0, p0, La;->g:I

    const/4 v1, -0x1

    iput v1, p0, La;->j:I

    iput-boolean v0, p0, La;->a:Z

    iput v1, p0, La;->h:I

    return-void
.end method


# virtual methods
.method final a()I
    .locals 1

    iget v0, p0, La;->d:I

    return v0
.end method

.method final a(I)I
    .locals 2

    iget v0, p0, La;->d:I

    const/4 v1, -0x1

    if-gez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, La;->d:I

    if-ltz v0, :cond_1

    iget-object v0, p0, La;->a:Lc;

    iget v1, p0, La;->d:I

    invoke-virtual {v0, v1}, Lc;->a(I)I

    move-result v1

    :cond_1
    :goto_0
    if-le p1, v1, :cond_2

    sub-int/2addr p1, v1

    goto :goto_0

    :cond_2
    iput p1, p0, La;->e:I

    const/4 v0, 0x0

    iput v0, p0, La;->f:I

    return p1
.end method

.method final a()Lc;
    .locals 1

    iget-object v0, p0, La;->a:Lc;

    return-object v0
.end method

.method final a()V
    .locals 12

    iget v0, p0, La;->d:I

    if-gez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, La;->h:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    const/16 v0, 0xb

    invoke-static {v0}, Lh;->b(I)V

    const/4 v2, 0x1

    iget v3, p0, La;->h:I

    invoke-static {v0, v2, v3}, Lh;->a(III)V

    :cond_1
    iget v0, p0, La;->j:I

    iget-object v2, p0, La;->a:Lc;

    if-eq v0, v1, :cond_2

    invoke-virtual {v2}, Lc;->e()I

    move-result v0

    iget-object v1, p0, La;->a:Lc;

    iget v2, p0, La;->j:I

    invoke-virtual {v1, v2}, Lc;->d(I)V

    iget-object v3, p0, La;->a:Lc;

    sget-object v4, Lh;->a:Ljavax/microedition/lcdui/Graphics;

    iget v5, p0, La;->d:I

    iget v6, p0, La;->e:I

    iget v7, p0, La;->b:I

    iget v8, p0, La;->c:I

    iget v9, p0, La;->a:I

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v3 .. v11}, Lc;->a(Ljavax/microedition/lcdui/Graphics;IIIIIII)V

    iget-object v1, p0, La;->a:Lc;

    invoke-virtual {v1, v0}, Lc;->d(I)V

    goto :goto_0

    :cond_2
    sget-object v3, Lh;->a:Ljavax/microedition/lcdui/Graphics;

    iget v4, p0, La;->d:I

    iget v5, p0, La;->e:I

    iget v6, p0, La;->b:I

    iget v7, p0, La;->c:I

    iget v8, p0, La;->a:I

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v2 .. v10}, Lc;->a(Ljavax/microedition/lcdui/Graphics;IIIIIII)V

    :goto_0
    invoke-static {}, Lh;->g()V

    return-void
.end method

.method final a(I)V
    .locals 4

    iget-boolean v0, p0, La;->a:Z

    if-nez v0, :cond_6

    iget v0, p0, La;->d:I

    if-gez v0, :cond_0

    goto :goto_2

    :cond_0
    iget v0, p0, La;->d:I

    const/4 v1, 0x0

    if-ltz v0, :cond_1

    iget-object v0, p0, La;->a:Lc;

    iget v2, p0, La;->d:I

    iget v3, p0, La;->e:I

    invoke-virtual {v0, v2, v3}, Lc;->a(II)I

    move-result v0

    sget v2, La;->i:I

    mul-int v0, v0, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v2, p0, La;->f:I

    if-lt v2, v0, :cond_5

    iget v2, p0, La;->f:I

    sub-int/2addr v2, v0

    iput v2, p0, La;->f:I

    iget v0, p0, La;->e:I

    iget-object v2, p0, La;->a:Lc;

    iget v3, p0, La;->d:I

    invoke-virtual {v2, v3}, Lc;->a(I)I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ge v0, v2, :cond_2

    iget v0, p0, La;->e:I

    add-int/2addr v0, v3

    iput v0, p0, La;->e:I

    goto :goto_1

    :cond_2
    iget v0, p0, La;->g:I

    if-nez v0, :cond_3

    iput-boolean v3, p0, La;->a:Z

    goto :goto_1

    :cond_3
    iget v0, p0, La;->g:I

    if-lez v0, :cond_4

    iget v0, p0, La;->g:I

    sub-int/2addr v0, v3

    iput v0, p0, La;->g:I

    :cond_4
    iput v1, p0, La;->e:I

    :cond_5
    :goto_1
    iget v0, p0, La;->f:I

    add-int/2addr v0, p1

    iput v0, p0, La;->f:I

    :cond_6
    :goto_2
    return-void
.end method

.method final a(II)V
    .locals 0

    iput p1, p0, La;->b:I

    iput p2, p0, La;->c:I

    return-void
.end method

.method final a(Lc;)V
    .locals 1

    iput-object p1, p0, La;->a:Lc;

    sget p1, La;->k:I

    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, La;->b(II)V

    return-void
.end method

.method final a()Z
    .locals 1

    iget v0, p0, La;->d:I

    if-gez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    iget v0, p0, La;->g:I

    if-gez v0, :cond_1

    const/4 v0, 0x0

    return v0

    :cond_1
    iget-boolean v0, p0, La;->a:Z

    return v0
.end method

.method final b()I
    .locals 1

    iget v0, p0, La;->e:I

    return v0
.end method

.method final b(I)V
    .locals 0

    iput p1, p0, La;->h:I

    return-void
.end method

.method final b(II)V
    .locals 1

    iget-boolean v0, p0, La;->a:Z

    if-nez v0, :cond_0

    iget v0, p0, La;->d:I

    if-eq p1, v0, :cond_1

    :cond_0
    iput p1, p0, La;->d:I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, La;->a(I)I

    add-int/lit8 p2, p2, -0x1

    iput p2, p0, La;->g:I

    iput-boolean p1, p0, La;->a:Z

    :cond_1
    return-void
.end method

.method public final run()V
    .locals 0

    return-void
.end method
