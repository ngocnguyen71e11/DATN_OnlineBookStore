using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;

namespace DATN_OnlineBookStore.Controllers
{
    public class AccessController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        [HttpGet]
        public IActionResult Login()
        {
            if (HttpContext.Session.GetString("UserName") == null)
            {
                return View();
            }
            else
            {
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpPost]
        public IActionResult Login(TblTaikhoan user)
        {
            var u = db.TblTaikhoans.FirstOrDefault(x => x.SEmail == user.SEmail && x.SMatkhau == user.SMatkhau);
            if (u != null)
            {
                if(u.FkIQuyenId==1)
                {
                    HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId); // Lưu AccountId vào session
                    return RedirectToAction("Index", "Admin");
                }
                else if(u.FkIQuyenId==3)
                {
                    HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId); // Lưu AccountId vào session
                    return RedirectToAction("Index", "Home");
                }
                HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId); // Lưu AccountId vào session
                return RedirectToAction("Index", "Home");

            }
            return View();
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("sEmail");
            return RedirectToAction("Login", "Access");
        }
    }
}
