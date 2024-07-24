using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtvanphongpham
{
    public int PkICtvanphongphamId { get; set; }

    public int FkISanphamId { get; set; }

    public string? SXuatxu { get; set; }

    public string? SThuonghieu { get; set; }

    public string? SMausac { get; set; }

    public string? SChatlieu { get; set; }

    public string? SKichthuoc { get; set; }

    public virtual TblSanpham FkISanpham { get; set; } = null!;
}
