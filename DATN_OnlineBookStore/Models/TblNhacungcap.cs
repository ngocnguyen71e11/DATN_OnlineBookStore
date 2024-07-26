using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblNhacungcap
{
    public int PkINccid { get; set; }

    public string STenNcc { get; set; } = null!;

    public string? SSdt { get; set; }

    public string? SEmail { get; set; }

    public string? SMasothue { get; set; }

    public virtual ICollection<TblPhieunhaphang> TblPhieunhaphangs { get; } = new List<TblPhieunhaphang>();
}
