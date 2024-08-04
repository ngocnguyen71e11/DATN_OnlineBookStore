using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DATN_OnlineBookStore.Controllers
{
    public class ReviewController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();

        [HttpGet]
        public IActionResult createReview(int orderItemId)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var orderItem = db.TblCtdonhangs
                .Include(o => o.FkISanpham)
                .Include(o => o.FkIDonhang)  
                .FirstOrDefault(c => c.PkICtdonhangId == orderItemId);
            if (orderItem == null)
            {
                return NotFound("Không tìm thấy sản phẩm trong đơn hàng.");
            }
            if (orderItem.FkIDonhang.FkITrangthai != 2)
            {
                return BadRequest("Sản phẩm này không thể đánh giá vì đơn hàng không đủ điều kiện.");
            }

            ViewBag.OrderItemId = orderItemId;
            ViewBag.ProductName = orderItem.FkISanpham.STensanpham;
            return View("createReview");
        }
        [HttpPost]
        public IActionResult submitProductReview(int orderItemId, double rating, string description)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Account");
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

            return RedirectToAction("viewReviewsList");
        }
        public IActionResult viewReviewsList()
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Account");
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
        public IActionResult FilterReviewByStatus()
        {
            return View();
        }

    }
}
