using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblTheloai
{
    public int PkITheloaiId { get; set; }

    public string STentheloai { get; set; } = null!;

    public int FkIDanhmucId { get; set; }

    public virtual TblDanhmuc FkIDanhmuc { get; set; } = null!;

    public virtual ICollection<TblSanpham> TblSanphams { get; } = new List<TblSanpham>();
}
