using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtsach
{
    public int PkICtsachId { get; set; }

    public int FkISanphamId { get; set; }

    public int FkITlsachId { get; set; }

    public string? STacgia { get; set; }

    public string? SNhaxuatban { get; set; }

    public string? SNamxuatban { get; set; }

    public string? SNgonngu { get; set; }

    public string? SNguoidich { get; set; }

    public int? ISotrang { get; set; }

    public virtual TblSanpham FkISanpham { get; set; } = null!;

    public virtual TblTlsach FkITlsach { get; set; } = null!;
}
