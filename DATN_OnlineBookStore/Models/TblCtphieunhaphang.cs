using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtphieunhaphang
{
    public int PkICtphieunhapId { get; set; }

    public int FkIPhieunhaphangId { get; set; }

    public int FkISanphamId { get; set; }

    public double FGianhap { get; set; }

    public int ISoluong { get; set; }

    public double? FChietkhau { get; set; }

    public virtual TblPhieunhaphang FkIPhieunhaphang { get; set; } = null!;

    public virtual TblSanpham FkISanpham { get; set; } = null!;
}
