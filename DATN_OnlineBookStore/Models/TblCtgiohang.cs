using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtgiohang
{
    public int PkICtgiohangId { get; set; }

    public int FkISanphamId { get; set; }

    public int FkIGiohangId { get; set; }

    public int ISoluong { get; set; }

    public virtual TblGiohang FkIGiohang { get; set; } = null!;

    public virtual TblSanpham FkISanpham { get; set; } = null!;
}
