﻿using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblDiachiKh
{
    public int PkSDiachiKhid { get; set; }

    public string FkSKhid { get; set; } = null!;

    public string? SHo { get; set; }

    public string? STen { get; set; }

    public int? FkIXaId { get; set; }

    public int? FkIHuyenId { get; set; }

    public int? FkITinhId { get; set; }

    public string? SDiachicuthe { get; set; }

    public string SSdt { get; set; } = null!;

    public bool? IsTrangthai { get; set; }

    public virtual TblHuyen? FkIHuyen { get; set; }

    public virtual TblTinh? FkITinh { get; set; }

    public virtual TblXa? FkIXa { get; set; }

    public virtual TblKhachhang FkSKh { get; set; } = null!;

    public virtual ICollection<TblDonhang> TblDonhangs { get; } = new List<TblDonhang>();
}
