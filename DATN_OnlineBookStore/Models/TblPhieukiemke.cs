using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblPhieukiemke
{
    public int PkIPhieukiemkeId { get; set; }

    public DateTime DThoigiantao { get; set; }

    public string? SGhichu { get; set; }

    public virtual ICollection<TblCtphieukiemke> TblCtphieukiemkes { get; } = new List<TblCtphieukiemke>();
}
