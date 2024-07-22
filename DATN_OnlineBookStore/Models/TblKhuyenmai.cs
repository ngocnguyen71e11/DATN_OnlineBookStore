using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblKhuyenmai
{
    public int PkIKhuyenmaiId { get; set; }

    public DateTime DThoigianbatdau { get; set; }

    public DateTime DThoigianketthuc { get; set; }

    public bool? IsTrangthai { get; set; }

    public virtual ICollection<TblCtkhuyenmai> TblCtkhuyenmais { get; } = new List<TblCtkhuyenmai>();
}
