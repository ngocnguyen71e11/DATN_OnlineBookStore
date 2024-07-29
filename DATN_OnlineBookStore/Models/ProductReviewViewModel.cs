namespace DATN_OnlineBookStore.Models
{
    public class ProductReviewViewModel
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public List<ReviewViewModel> Reviews { get; set; }
    }

    public class ReviewViewModel
    {
        public int ReviewId { get; set; }
        public double Rating { get; set; }
        public string? Description { get; set; }
        public DateTime? CreatedAt { get; set; }
        public string? UserName {  get; set; }
    }

}
