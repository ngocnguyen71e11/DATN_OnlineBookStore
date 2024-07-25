using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

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
                HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId); // Lưu AccountId vào session
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        [HttpGet]
        public IActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> ChangePassword(ChangePasswordModel model)
        {
            var accountId = HttpContext.Session.GetInt32("AccountId");
            if (accountId == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var user = await db.TblTaikhoans.FindAsync(accountId);
            if (user == null)
            {
                ModelState.AddModelError("", "Không tìm thấy tài khoản.");
                return View(model);
            }
            if (model.OldPassword != user.SMatkhau)
            {
                ModelState.AddModelError("", "Mật khẩu cũ không chính xác.");
                return View(model);
            }
            user.SMatkhau = model.NewPassword;
            if (model.ConfirmPassword != model.NewPassword)
            {
                ModelState.AddModelError("", "Mật mới không khớp.");
                return View(model);
            }
            db.TblTaikhoans.Update(user);
            await db.SaveChangesAsync();
            HttpContext.Session.Clear();
            return RedirectToAction("Login", "Access");
        }


        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("sEmail");
            return RedirectToAction("Login", "Access");
        }
    }
}
