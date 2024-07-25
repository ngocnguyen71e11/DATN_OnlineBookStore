namespace DATN_OnlineBookStore.Models
{
    public class OrderItemViewModel
    {
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public double Price { get; set; }
        public double Total { get; set; }
        public int PkICtdonhangId { get; set; }
        public bool IsReviewed { get; set; }
    }
}
