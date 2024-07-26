using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DATN_OnlineBookStore.Controllers
{
    public class ReviewController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();

        [HttpGet]
        public IActionResult CreateReview(int orderItemId)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var orderItem = db.TblCtdonhangs.Include(o => o.FkISanpham).FirstOrDefault(c => c.PkICtdonhangId == orderItemId);
            if (orderItem == null)
            {
                return NotFound("Không tìm thấy sản phẩm trong đơn hàng.");
            }

            ViewBag.OrderItemId = orderItemId;
            ViewBag.ProductName = orderItem.FkISanpham.STensanpham;
            return View("CreateReview");
        }


        // POST: Tạo đánh giá mới
        [HttpPost]
        public IActionResult SubmitReview(int orderItemId, double rating, string description)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var orderItem = db.TblCtdonhangs.FirstOrDefault(c => c.PkICtdonhangId == orderItemId);
            if (orderItem == null)
            {
                return NotFound("Không tìm thấy sản phẩm trong đơn hàng.");
            }

            var review = new TblDanhgium
            {
                FkICtdonhangId = orderItemId,
                FXephang = rating,
                SMota = description,
                DThoigiantao = DateTime.Now
            };

            db.TblDanhgia.Add(review);
            db.SaveChanges();

            return RedirectToAction("UserReviews");
        }
        // GET: Danh sách đánh giá của người dùng
        public IActionResult UserReviews()
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var user = db.TblKhachhangs.FirstOrDefault(kh => kh.FkITaikhoanId == taikhoanId.Value);
            if (user == null)
            {
                return NotFound("Không tìm thấy thông tin khách hàng.");
            }

            var reviews = db.TblDanhgia
                .Where(r => r.FkICtdonhang.FkIDonhang.FkSKhid == user.PkSKhid)
                .Include(r => r.FkICtdonhang.FkISanpham)
                .Select(r => new
                {
                    ProductName = r.FkICtdonhang.FkISanpham.STensanpham,
                    Rating = r.FXephang,
                    Description = r.SMota,
                    ReviewDate = r.DThoigiantao
                })
                .ToList();

            return View(reviews);
        }

    }
}
