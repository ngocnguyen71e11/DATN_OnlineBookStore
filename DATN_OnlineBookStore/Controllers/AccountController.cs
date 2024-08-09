using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Net;

namespace DATN_OnlineBookStore.Controllers
{
    public class AccountController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        [HttpPost]
        public async Task<IActionResult> Register(string email, string password, string firstName, string lastName, string? phone, DateTime? birthDate, string gender, string job)
        {
            if (ModelState.IsValid)
            {
                bool? genderBool = gender == "1" ? true : (bool?)false;
                var existingUser = await db.TblTaikhoans.FirstOrDefaultAsync(x => x.SEmail == email);
                if (existingUser != null)
                {
                    ModelState.AddModelError("email", "Email đã được sử dụng.");
                    return View();
                }

                int newAccountId;
                var maxId = await db.TblTaikhoans.MaxAsync(x => (int?)x.PkITaikhoanId);
                newAccountId = maxId.HasValue ? maxId.Value + 1 : 1;

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
                    IsGioitinh = genderBool,
                    SNghenghiep = job
                };
                db.TblKhachhangs.Add(newCustomer);
                await db.SaveChangesAsync();

                return RedirectToAction("Login", "Account");
            }
            return View();
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
                if(u.FkIQuyenId==1)
                {
                    HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId);
                    return RedirectToAction("viewOrderList", "Order");
                }
                else if(u.FkIQuyenId==3)
                {
                    HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId);
                    return RedirectToAction("viewProduct", "Product");
                }
                HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId);
                return RedirectToAction("Index", "Home");

            }
                //HttpContext.Session.SetInt32("AccountId", u.PkITaikhoanId);
                //if (u.FkIQuyenId == 3)
                //{
                //    return RedirectToAction("Index", "Home");
                //}
                //else
                //{
                //    return RedirectToAction("Index", "Admin");
                //}
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
        public async Task<IActionResult> updateInfo()
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Account");
            }

            var customer = await db.TblKhachhangs
                .FirstOrDefaultAsync(kh => kh.FkITaikhoanId == taikhoanId.Value);
            return View(customer);
        }
        [HttpPost]
        public async Task<IActionResult> updateInfo(TblKhachhang model)
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
                await db.SaveChangesAsync();
                return RedirectToAction("updateInfo"); // Assuming you have a view to show success
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
                    await db.SaveChangesAsync();
                    return RedirectToAction("updateInfo"); // Assuming you have a view to show success
                }
                else
                {
                    ModelState.AddModelError("", "Không tìm thấy khách hàng với ID đã cho.");
                    return View(model);
                }
            }
        }
        public IActionResult AddOrUpdateAddress(AddressViewModel model)
        {
            if (ModelState.IsValid)
            {
                // Get the customer based on FkITaikhoanId
                var customer = db.TblKhachhangs
                    .FirstOrDefault(kh => kh.FkITaikhoanId == model.FkITaikhoanId);

                if (customer == null)
                {
                    ModelState.AddModelError("", "Customer not found.");
                    return View("UpdateInfo", model);
                }

                // Find or create the address
                var address = db.TblDiachiKhs
                    .FirstOrDefault(a => a.FkSKhid == customer.PkSKhid);

                if (address == null)
                {
                    address = new TblDiachiKh
                    {
                        FkSKhid = customer.PkSKhid
                    };
                    db.TblDiachiKhs.Add(address);
                }

                // Update address details
                address.SDiachicuthe = model.Address;
                address.FkIXaId = model.FkIXaId;
                address.FkIHuyenId = model.FkIHuyenId;
                address.FkITinhId = model.FkITinhId;
                address.IsTrangthai = true;

                db.SaveChanges();

                return RedirectToAction("UpdateInfo");
            }

            return View("UpdateInfo", model);
        }

        public ActionResult Index()
        {
            List<TblTaikhoan> tblTaikhoans = db.TblTaikhoans.ToList();
            return View(tblTaikhoans);
        }
        public ActionResult addEmployeeAccount()
        {
            List<string> lstQuyen = db.TblPhanquyens.Select(p => p.STenquyen).ToList();
            int i = 0;
            List<SelectListItem> selectListItems = lstQuyen
           .Select(item => new SelectListItem
           {
               Text = item,
               Value = (i++).ToString(),
           }).ToList();
            ViewBag.FkIQuyenId = selectListItems;
            return View("Create");
        }
        [HttpPost]
        public ActionResult addEmployeeAccount(TblTaikhoan taikhoan)
        {
            if (taikhoan.PkITaikhoanId != null)
            {
                db.TblTaikhoans.Add(taikhoan);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
        public ActionResult updateEmployeeInfo(int id)
        {
            List<string> lstQuyen = db.TblPhanquyens.Select(p => p.STenquyen).ToList();
            int i = 0;
            List<SelectListItem> selectListItems = lstQuyen
           .Select(item => new SelectListItem
           {
               Text = item,
               Value = (i++).ToString(),
           }).ToList();
            TblTaikhoan itemEdit = db.TblTaikhoans.Where(p => p.PkITaikhoanId == id).FirstOrDefault();
            ViewBag.FkIQuyenId = selectListItems;
            if (id != 0)
            {

            }
            return View("updateEmployeeInfo", itemEdit);
        }
        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            HttpContext.Session.Remove("sEmail");
            return RedirectToAction("Login", "Account");
        }
    }
}
