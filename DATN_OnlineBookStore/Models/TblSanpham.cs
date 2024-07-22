using System;
using System.Collections.Generic;

namespace DATN_OnlineBookStore.Models;

public partial class TblSanpham
{
    public int PkISanphamId { get; set; }

    public string STensanpham { get; set; } = null!;

    public string? SMavach { get; set; }

    public string? SHinhanh { get; set; }

    public string? SMota { get; set; }

    public int ITonkho { get; set; }

    public double? FTrongluong { get; set; }

    public double FGiaban { get; set; }

    public double? FGiavon { get; set; }

    public bool? IsTrangthai { get; set; }

    public virtual ICollection<TblCtdonhang> TblCtdonhangs { get; } = new List<TblCtdonhang>();

    public virtual ICollection<TblCtgiohang> TblCtgiohangs { get; } = new List<TblCtgiohang>();

    public virtual ICollection<TblCtkhuyenmai> TblCtkhuyenmais { get; } = new List<TblCtkhuyenmai>();

    public virtual ICollection<TblCtphieukiemke> TblCtphieukiemkes { get; } = new List<TblCtphieukiemke>();

    public virtual ICollection<TblCtphieunhaphang> TblCtphieunhaphangs { get; } = new List<TblCtphieunhaphang>();

    public virtual ICollection<TblCtsach> TblCtsaches { get; } = new List<TblCtsach>();

    public virtual ICollection<TblCtvanphongpham> TblCtvanphongphams { get; } = new List<TblCtvanphongpham>();
}
