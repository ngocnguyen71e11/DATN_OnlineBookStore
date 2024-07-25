namespace DATN_OnlineBookStore.Models
{
    public class CheckoutViewModel
    {
        public IEnumerable<dynamic> SelectedItems { get; set; }
        public double TotalPrice { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Country { get; set; }
        public int City { get; set; }
        public int District { get; set; }
        public int Ward { get; set; }
        public string Address { get; set; }
    }

}
