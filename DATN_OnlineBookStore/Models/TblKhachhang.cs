using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblKhachhang
{
    public string PkSKhid { get; set; } = null!;

    public int FkITaikhoanId { get; set; }

    public string SHo { get; set; } = null!;

    public string STen { get; set; } = null!;

    public string? SSdt { get; set; }

    public int? IDiemthuong { get; set; }

    public DateTime? DNgaysinh { get; set; }

    public bool? IsGioitinh { get; set; }

    public string? SNghenghiep { get; set; }

    public virtual TblTaikhoan FkITaikhoan { get; set; } = null!;

    public virtual ICollection<TblDiachiKh> TblDiachiKhs { get; } = new List<TblDiachiKh>();

    public virtual ICollection<TblDonhang> TblDonhangs { get; } = new List<TblDonhang>();

    public virtual ICollection<TblGiohang> TblGiohangs { get; } = new List<TblGiohang>();
}
