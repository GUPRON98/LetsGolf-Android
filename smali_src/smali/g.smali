.class final Lg;
.super Ljava/lang/Object;


# static fields
.field private static c:I


# instance fields
.field a:I

.field a:La;

.field a:Lc;

.field b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x3

    sput v0, Lg;->c:I

    return-void
.end method

.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method constructor <init>(Lc;IILg;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p2, 0x0

    iput p2, p0, Lg;->a:I

    iput-object p1, p0, Lg;->a:Lc;

    iget-object p1, p0, Lg;->a:Lc;

    if-eqz p1, :cond_0

    new-instance p1, La;

    iget-object p3, p0, Lg;->a:Lc;

    invoke-direct {p1, p3, p2, p2}, La;-><init>(Lc;II)V

    iput-object p1, p0, Lg;->a:La;

    :cond_0
    return-void
.end method


# virtual methods
.method final a()I
    .locals 1

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0}, La;->a()I

    move-result v0

    return v0
.end method

.method final a()V
    .locals 1

    iget v0, p0, Lg;->a:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lg;->a:I

    return-void
.end method

.method final a(I)V
    .locals 2

    iget-object v0, p0, Lg;->a:La;

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, La;->b(II)V

    return-void
.end method

.method final a(II)V
    .locals 1

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0, p1, p2}, La;->b(II)V

    return-void
.end method

.method final a(Lc;I)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p0, p1, p2, v0}, Lg;->a(Lc;II)V

    return-void
.end method

.method final a(Lc;II)V
    .locals 1

    iput-object p1, p0, Lg;->a:Lc;

    iget-object p1, p0, Lg;->a:Lc;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lg;->a:La;

    if-nez p1, :cond_0

    new-instance p1, La;

    invoke-direct {p1}, La;-><init>()V

    iput-object p1, p0, Lg;->a:La;

    :cond_0
    iget-object p1, p0, Lg;->a:La;

    iget-object v0, p0, Lg;->a:Lc;

    invoke-virtual {p1, v0}, La;->a(Lc;)V

    :cond_1
    invoke-virtual {p0, p2, p3}, Lg;->a(II)V

    return-void
.end method

.method final a()Z
    .locals 1

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0}, La;->a()Z

    move-result v0

    return v0
.end method

.method final b()I
    .locals 1

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0}, La;->b()I

    move-result v0

    return v0
.end method

.method final b()V
    .locals 1

    iget v0, p0, Lg;->a:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Lg;->a:I

    return-void
.end method

.method final b(I)V
    .locals 1

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0, p1}, La;->a(I)I

    return-void
.end method

.method final b(II)V
    .locals 1

    iget-object v0, p0, Lg;->a:La;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0, p1, p2}, La;->a(II)V

    :cond_0
    return-void
.end method

.method final c()V
    .locals 4

    iget-object v0, p0, Lg;->a:La;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lg;->a:La;

    iget v1, v0, La;->a:I

    sget v2, Lg;->c:I

    and-int/2addr v1, v2

    iput v1, v0, La;->a:I

    iget-object v0, p0, Lg;->a:La;

    iget v1, v0, La;->a:I

    iget v2, p0, Lg;->a:I

    sget v3, Lg;->c:I

    and-int/2addr v2, v3

    or-int/2addr v1, v2

    iput v1, v0, La;->a:I

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0}, La;->a()Lc;

    move-result-object v0

    iget v1, p0, Lg;->b:I

    invoke-virtual {v0, v1}, Lc;->d(I)V

    iget-object v0, p0, Lg;->a:La;

    invoke-virtual {v0}, La;->a()V

    return-void
.end method

.method final c(I)V
    .locals 0

    iput p1, p0, Lg;->a:I

    return-void
.end method

.method final d()V
    .locals 2

    iget-object v0, p0, Lg;->a:La;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lg;->a:La;

    sget v1, Lh;->a:I

    invoke-virtual {v0, v1}, La;->a(I)V

    return-void
.end method
