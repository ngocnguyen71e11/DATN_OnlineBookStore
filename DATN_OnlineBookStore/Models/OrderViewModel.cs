namespace DATN_OnlineBookStore.Models
{
    public class OrderViewModel
    {
        public int OrderId { get; set; }
        public DateTime OrderDate { get; set; }
        public double TotalPrice { get; set; }
        public List<OrderItemViewModel> Items { get; set; }
    }

}
