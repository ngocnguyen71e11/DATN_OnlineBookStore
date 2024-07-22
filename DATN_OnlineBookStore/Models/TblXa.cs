using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblXa
{
    public int PkIXaId { get; set; }

    public int FkIHuyenId { get; set; }

    public string STenxa { get; set; } = null!;

    public virtual TblHuyen FkIHuyen { get; set; } = null!;

    public virtual ICollection<TblDiachiKh> TblDiachiKhs { get; } = new List<TblDiachiKh>();

    public virtual ICollection<TblNhacungcap> TblNhacungcaps { get; } = new List<TblNhacungcap>();
}
