using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblNhanvien
{
    public string PkSNhanvienId { get; set; } = null!;

    public int FkITaikhoanId { get; set; }

    public string SHo { get; set; } = null!;

    public string STen { get; set; } = null!;

    public string? SSdt { get; set; }

    public DateTime? DNgaysinh { get; set; }

    public bool? IsGioitinh { get; set; }

    public bool? IsTrangthai { get; set; }

    public virtual TblTaikhoan FkITaikhoan { get; set; } = null!;
}
