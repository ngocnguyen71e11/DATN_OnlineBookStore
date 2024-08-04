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
        public async Task<IActionResult> viewOrderList()
        {
            var donHangs = await db.TblDonhangs
                .Include(dh => dh.FkSKh)
                .ToListAsync();

            return View(donHangs);
        }

        [HttpPost]
        public async Task<IActionResult> ChangeOrderStatus(int orderId, int newStatus)
        {
            var order = await db.TblDonhangs.FindAsync(orderId);
            if (order == null)
            {
                return NotFound();
            }

            order.FkITrangthai = newStatus;
            await db.SaveChangesAsync();
            return RedirectToAction(nameof(viewOrderList)); 
        }

        public async Task<IActionResult> viewOrderDetails(int orderID)
        {
            var orderDetails = await db.TblDonhangs
              .Include(dh => dh.FkSKh)  
              .Include(dh => dh.FkSDiachiKh) 
                  .ThenInclude(addr => addr.FkIXa) 
                  .Include(dh => dh.FkSDiachiKh)
                  .ThenInclude(addr => addr.FkIHuyen) 
                  .Include(dh => dh.FkSDiachiKh)
                  .ThenInclude(addr => addr.FkITinh)
              .Include(dh => dh.TblCtdonhangs)
                  .ThenInclude(ct => ct.FkISanpham)
              .FirstOrDefaultAsync(dh => dh.PkIDonhangId == orderID);

            if (orderDetails == null)
            {
                return NotFound();
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
        public IActionResult CancelOrder(int orderId)
        {
            var order = db.TblDonhangs.Find(orderId);
            if (order == null)
            {
                return NotFound();
            }
            if (DateTime.Now.Subtract(order.DThoigianmua.GetValueOrDefault()).TotalHours > 24)
            {
                return NotFound();
            }
            order.FkITrangthai = 4;
            db.SaveChanges();
            return RedirectToAction("orderConfirmation", "Cart", new { id = orderId });
        }
    }
}
