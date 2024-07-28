namespace DATN_OnlineBookStore.Models
{
    public class BillModel
    {
        public int PkIDonhangId { get; set; }
        public string FkSKhid { get; set; } = null!;
        public string? STenKH { get; set; }
        public double? FSLsanpham { get; set; }
        public DateTime? DThoigiancapnhat { get; set; }
        public double? FTongtien { get; set; }
    }
}
