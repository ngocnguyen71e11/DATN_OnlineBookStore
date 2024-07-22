using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblPhieunhaphang
{
    public int PkIPhieunhaphangId { get; set; }

    public int FkSNccid { get; set; }

    public double? FChietkhau { get; set; }

    public DateTime DThoigiantao { get; set; }

    public string? SGhichu { get; set; }

    public virtual TblNhacungcap FkSNcc { get; set; } = null!;

    public virtual ICollection<TblCtphieunhaphang> TblCtphieunhaphangs { get; } = new List<TblCtphieunhaphang>();
}
