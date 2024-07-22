using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblCtdonhang
{
    public int PkICtdonhangId { get; set; }

    public int FkISanphamId { get; set; }

    public int FkIDonhangId { get; set; }

    public int ISoluong { get; set; }

    public double FGiaban { get; set; }

    public double? FKhuyenmai { get; set; }

    public virtual TblDonhang FkIDonhang { get; set; } = null!;

    public virtual TblSanpham FkISanpham { get; set; } = null!;

    public virtual ICollection<TblDanhgium> TblDanhgia { get; } = new List<TblDanhgium>();
}
