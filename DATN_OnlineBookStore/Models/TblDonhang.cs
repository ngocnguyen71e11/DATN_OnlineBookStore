using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblDonhang
{
    public int PkIDonhangId { get; set; }

    public string FkSKhid { get; set; } = null!;

    public int FkITrangthai { get; set; }

    public int FkSDiachiKhid { get; set; }

    public DateTime? DThoigianmua { get; set; }

    public DateTime? DThoigiancapnhat { get; set; }

    public string? SMavanchuyen { get; set; }

    public double? FPhivanchuyen { get; set; }

    public string? SGhichu { get; set; }

    public int? IDungdiemthuong { get; set; }

    public double? FTongtien { get; set; }

    public virtual TblCttrangthaidonhang FkITrangthaiNavigation { get; set; } = null!;

    public virtual TblDiachiKh FkSDiachiKh { get; set; } = null!;

    public virtual TblKhachhang FkSKh { get; set; } = null!;

    public virtual ICollection<TblCtdonhang> TblCtdonhangs { get; } = new List<TblCtdonhang>();
}
