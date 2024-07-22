using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCttrangthaidonhang
{
    public int PkITrangthaidonhangId { get; set; }

    public string STentrangthai { get; set; } = null!;

    public virtual ICollection<TblDonhang> TblDonhangs { get; } = new List<TblDonhang>();
}
