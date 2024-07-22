using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblTlvanphongpham
{
    public int PkITlvanphongphamId { get; set; }

    public int FkIDanhmucId { get; set; }

    public string STenTlvanphongpham { get; set; } = null!;

    public virtual TblDanhmuc FkIDanhmuc { get; set; } = null!;

    public virtual ICollection<TblCtvanphongpham> TblCtvanphongphams { get; } = new List<TblCtvanphongpham>();
}
