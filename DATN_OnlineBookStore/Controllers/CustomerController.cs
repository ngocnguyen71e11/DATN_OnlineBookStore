using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace DATN_OnlineBookStore.Controllers
{
    public class CustomerController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public async Task<IActionResult> CustomerView()
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Account");             }

            var customer = await db.TblKhachhangs
                .FirstOrDefaultAsync(kh => kh.FkITaikhoanId == taikhoanId.Value);
            return View(customer);
        }
        [HttpPost]
        public async Task<IActionResult> CustomerView(TblKhachhang model)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Account");
            }
            model.FkITaikhoanId = taikhoanId.Value;

            if (string.IsNullOrEmpty(model.PkSKhid))
                {
                    model.PkSKhid = Guid.NewGuid().ToString();
                    db.TblKhachhangs.Add(model);
                }
                else
                {
                    var existingCustomer = await db.TblKhachhangs
                        .FirstOrDefaultAsync(c => c.PkSKhid == model.PkSKhid);

                    if (existingCustomer != null)
                    {
                        existingCustomer.SHo = model.SHo;
                        existingCustomer.STen = model.STen;
                        existingCustomer.SSdt = model.SSdt;
                        existingCustomer.DNgaysinh = model.DNgaysinh;
                        existingCustomer.SNghenghiep = model.SNghenghiep;

                        db.TblKhachhangs.Update(existingCustomer);
                    }
                    else
                    {
                        ModelState.AddModelError("", "Không tìm thấy khách hàng với ID đã cho.");
                        return View(model);
                    }
                }
                await db.SaveChangesAsync();
                return RedirectToAction("CustomerView");
        }

    }
}
