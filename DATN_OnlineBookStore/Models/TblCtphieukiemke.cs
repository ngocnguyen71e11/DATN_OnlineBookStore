using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtphieukiemke
{
    public int PkICtkiemkeId { get; set; }

    public int FkIPhieukiemke { get; set; }

    public int FkISanphamId { get; set; }

    public double? FGiavon { get; set; }

    public int? ITonkho { get; set; }

    public int? ISoluongthucte { get; set; }

    public virtual TblPhieukiemke FkIPhieukiemkeNavigation { get; set; } = null!;

    public virtual TblSanpham FkISanpham { get; set; } = null!;
}
