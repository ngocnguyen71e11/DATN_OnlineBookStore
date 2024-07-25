using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace DATN_OnlineBookStore.Controllers
{
    public class AccessController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public async Task<IActionResult> Register(string email, string password, string firstName, string lastName, string? phone, DateTime? birthDate, string gender)
        {
            if (ModelState.IsValid)
            {
                // Convert gender string to boolean
                bool? genderBool = gender == "1" ? true : (bool?)false;

                // Kiểm tra xem email đã tồn tại chưa
                var existingUser = await db.TblTaikhoans.FirstOrDefaultAsync(x => x.SEmail == email);
                if (existingUser != null)
                {
                    ModelState.AddModelError("", "Email đã được sử dụng.");
                    return View(); // Trả lại trang đăng ký với thông báo lỗi
                }

                // Tạo mã tài khoản nếu chưa có
                int newAccountId;
                var maxId = await db.TblTaikhoans.MaxAsync(x => (int?)x.PkITaikhoanId);
                newAccountId = maxId.HasValue ? maxId.Value + 1 : 1;

                // Tạo tài khoản mới
                var newAccount = new TblTaikhoan
                {
                    PkITaikhoanId = newAccountId,
                    SEmail = email,
                    SMatkhau = password,
                    FkIQuyenId = 3
                };

                db.TblTaikhoans.Add(newAccount);
                await db.SaveChangesAsync();

                var newCustomer = new TblKhachhang
                {
                    PkSKhid = newAccountId.ToString(), 
                    FkITaikhoanId = newAccount.PkITaikhoanId,
                    SHo = firstName,
                    STen = lastName,
                    SSdt = phone,
                    DNgaysinh = birthDate,
                    IsGioitinh = genderBool
                };

                db.TblKhachhangs.Add(newCustomer);
                await db.SaveChangesAsync();

                return RedirectToAction("Login", "Access");
            }

            return View(); // Trả lại trang đăng ký nếu kiểm tra hợp lệ thất bại
        }


        // Hàm tạo mã ngẫu nhiên
        private string GenerateRandomCode(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            var random = new Random();
            var result = new char[length];
            for (int i = 0; i < length; i++)
            {
                result[i] = chars[random.Next(chars.Length)];
            }
            return new string(result);
        }


        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

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
