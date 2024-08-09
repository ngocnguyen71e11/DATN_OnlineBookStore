namespace DATN_OnlineBookStore.Models
{
    public class UserInfo
    {
        public int FkITaikhoanId { get; set; }
        public int PkSKhid { get; set; }
        public string SHo { get; set; }
        public string STen { get; set; }
        public string SSdt { get; set; }
        public DateTime? DNgaysinh { get; set; }
        public string SNghenghiep { get; set; }
        public string Diachi { get; set; }
        public string Thanhpho { get; set; }
        public string QuanHuyen { get; set; }
        public string XaPhuong { get; set; }
    }

}
