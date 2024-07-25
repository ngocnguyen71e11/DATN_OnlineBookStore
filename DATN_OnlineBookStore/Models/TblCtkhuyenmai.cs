using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtkhuyenmai
{
    public int PkICtkhuyenmaiId { get; set; }

    public int FkIKhuyenmaiId { get; set; }

    public int FkISanphamId { get; set; }

    public double FChietkhau { get; set; }

    public virtual TblKhuyenmai FkIKhuyenmai { get; set; } = null!;

    public virtual TblSanpham FkISanpham { get; set; } = null!;
}
