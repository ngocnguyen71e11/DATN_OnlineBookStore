using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblDanhmuc
{
    public int PkIDanhmucId { get; set; }

    public string STendanhmuc { get; set; } = null!;

    public virtual ICollection<TblTheloai> TblTheloais { get; } = new List<TblTheloai>();
}
