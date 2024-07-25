using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblTaikhoan
{
    public int PkITaikhoanId { get; set; }

    public int FkIQuyenId { get; set; }

    public string SEmail { get; set; } = null!;

    public string SMatkhau { get; set; } = null!;

    public virtual TblPhanquyen FkIQuyen { get; set; } = null!;

    public virtual ICollection<TblKhachhang> TblKhachhangs { get; } = new List<TblKhachhang>();

    public virtual ICollection<TblNhanvien> TblNhanviens { get; } = new List<TblNhanvien>();
}
