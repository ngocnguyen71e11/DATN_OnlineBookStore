namespace DATN_OnlineBookStore.Models
{
    public class AddressViewModel
    {
        public int FkITaikhoanId { get; set; }
        public int PkSKhid { get; set; }
        public string Address { get; set; }
        public int FkITinhId { get; set; }
        public int FkIHuyenId { get; set; }
        public int FkIXaId { get; set; }
    }
}
