using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;

namespace DATN_OnlineBookStore.Controllers
{
    public class OrderController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public IActionResult Index()
        {
            return View();
        }
        public ActionResult viewOrderList()
        {
            var orders = db.TblDonhangs
         .Include(o => o.TblCtdonhangs)
             .ThenInclude(d => d.FkISanpham)
         .OrderBy(o => o.FkITrangthai != 1)  
         .ThenBy(o => o.DThoigianmua)  
         .ToList();

            ViewBag.Orders = orders;
            return View();
        }
        public ActionResult viewOrderDetails(int orderID)
        {
            var orderDetails = db.TblDonhangs
                .Where(o => o.PkIDonhangId == orderID)
                .Include(o => o.TblCtdonhangs)
                    .ThenInclude(d => d.FkISanpham)
                .Include(o => o.FkSKh)
                    .ThenInclude(kh => kh.TblDiachiKhs)
                        .ThenInclude(diachi => diachi.FkITinh)  // Bao gồm thông tin tỉnh
                        .ThenInclude(tinh => tinh.TblHuyens)    // Bao gồm thông tin huyện
                        .ThenInclude(huyen => huyen.TblXas)      // Bao gồm thông tin xã
                .FirstOrDefault();

            if (orderDetails == null)
            {
                return NotFound("Không tìm thấy đơn hàng.");
            }

            return View(orderDetails);
        }
        [HttpPost]
        public JsonResult confirmOrderStatus(int orderID)
        {
            var order = db.TblDonhangs
                .FirstOrDefault(o => o.PkIDonhangId == orderID);

            if (order != null && order.FkITrangthai == 1)
            {
                order.FkITrangthai = 2;
                db.SaveChanges();

                return Json(new { success = true, status = "Đã xử lý" });
            }

            return Json(new { success = false, status = "Lỗi cập nhật trạng thái" });
        }
        public ActionResult searchOrders()
        {
            return View();
        }
    }
}
