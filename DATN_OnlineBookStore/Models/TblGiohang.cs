using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblGiohang
{
    public int PkIGiohangId { get; set; }

    public string FkIKhid { get; set; } = null!;

    public virtual TblKhachhang FkIKh { get; set; } = null!;

    public virtual ICollection<TblCtgiohang> TblCtgiohangs { get; } = new List<TblCtgiohang>();
}
