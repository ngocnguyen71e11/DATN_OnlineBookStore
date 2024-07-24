using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;

namespace DATN_OnlineBookStore.Controllers
{
    public class ReviewController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();

        // GET: Hiển thị form đánh giá
        public ActionResult Create(int ctdonhangId)
        {
            var danhgia = new TblDanhgium
            {
                FkICtdonhangId = ctdonhangId
            };
            return View(danhgia);
        }

        // POST: Tạo đánh giá mới
        public ActionResult UserReviews(string khId)
        {           
            var reviews = db.TblDanhgia.Where(d => d.FkICtdonhang.FkIDonhang.FkSKhid == khId).ToList();
            return View(reviews);
        }

    }
}
