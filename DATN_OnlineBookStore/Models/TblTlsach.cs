using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblTlsach
{
    public int PkITlsachId { get; set; }

    public int FkIDanhmuc { get; set; }

    public string STenTlsach { get; set; } = null!;

    public virtual TblDanhmuc FkIDanhmucNavigation { get; set; } = null!;

    public virtual ICollection<TblCtsach> TblCtsaches { get; } = new List<TblCtsach>();
}
