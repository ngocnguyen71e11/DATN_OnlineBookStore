using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblDanhgium
{
    public int PkIDanhgiaId { get; set; }

    public int FkICtdonhangId { get; set; }

    public double FXephang { get; set; }

    public string? SMota { get; set; }

    public DateTime? DThoigiantao { get; set; }

    public virtual TblCtdonhang FkICtdonhang { get; set; } = null!;
}
