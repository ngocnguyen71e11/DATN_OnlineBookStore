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
            return RedirectToAction(nameof(viewOrderList)); // Redirect back to the list to see the updated status
        }

        public async Task<IActionResult> viewOrderDetails(int orderID)
        {
            var orderDetails = await db.TblDonhangs
              .Include(dh => dh.FkSKh)  // Load customer details
              .Include(dh => dh.FkSDiachiKh) // Load address details
                  .ThenInclude(addr => addr.FkIXa) // Load details about the 'Xa'
                  .Include(dh => dh.FkSDiachiKh)
                  .ThenInclude(addr => addr.FkIHuyen) // Load details about the 'Huyen'
                  .Include(dh => dh.FkSDiachiKh)
                  .ThenInclude(addr => addr.FkITinh) // Load details about the 'Tinh'
              .Include(dh => dh.TblCtdonhangs) // Include order details
                  .ThenInclude(ct => ct.FkISanpham) // Include product details for each order detail
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
    }
}
