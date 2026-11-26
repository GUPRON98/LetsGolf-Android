.class final Lf;
.super Ljava/lang/Object;


# instance fields
.field public a:I

.field public a:Z

.field public b:I

.field public c:I

.field public d:I

.field public e:I


# direct methods
.method constructor <init>(IIIII)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lf;->a:I

    iput p2, p0, Lf;->b:I

    iput p4, p0, Lf;->c:I

    iput p3, p0, Lf;->d:I

    iput p5, p0, Lf;->e:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lf;->a:Z

    return-void
.end method

.method constructor <init>(IIIIIZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lf;->a:I

    iput p2, p0, Lf;->b:I

    iput p4, p0, Lf;->c:I

    iput p3, p0, Lf;->d:I

    iput p5, p0, Lf;->e:I

    iput-boolean p6, p0, Lf;->a:Z

    return-void
.end method


# virtual methods
.method public final a(II)Z
    .locals 2

    iget v0, p0, Lf;->a:I

    if-le p1, v0, :cond_0

    iget v0, p0, Lf;->a:I

    iget v1, p0, Lf;->d:I

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_0

    iget p1, p0, Lf;->b:I

    if-le p2, p1, :cond_0

    iget p1, p0, Lf;->b:I

    iget v0, p0, Lf;->c:I

    add-int/2addr p1, v0

    if-ge p2, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
