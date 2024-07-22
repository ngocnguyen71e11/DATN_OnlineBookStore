using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblHuyen
{
    public int PkIHuyenId { get; set; }

    public int FkITinhId { get; set; }

    public string STenhuyen { get; set; } = null!;

    public virtual TblTinh FkITinh { get; set; } = null!;

    public virtual ICollection<TblXa> TblXas { get; } = new List<TblXa>();
}
