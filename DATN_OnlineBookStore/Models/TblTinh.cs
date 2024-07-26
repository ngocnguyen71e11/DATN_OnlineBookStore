using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblTinh
{
    public int PkITinhId { get; set; }

    public string STentinh { get; set; } = null!;

    public virtual ICollection<TblDiachiKh> TblDiachiKhs { get; } = new List<TblDiachiKh>();

    public virtual ICollection<TblHuyen> TblHuyens { get; } = new List<TblHuyen>();
}
