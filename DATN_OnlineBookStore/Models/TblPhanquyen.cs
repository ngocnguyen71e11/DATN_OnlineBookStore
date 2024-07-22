using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblPhanquyen
{
    public int PkIQuyenId { get; set; }

    public string STenquyen { get; set; } = null!;

    public virtual ICollection<TblTaikhoan> TblTaikhoans { get; } = new List<TblTaikhoan>();
}
