using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using static NuGet.Packaging.PackagingConstants;

namespace DATN_OnlineBookStore.Controllers
{
    public class AdminController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        // GET: AdminController
        public ActionResult Index()
        {
            List<TblTaikhoan> tblTaikhoans = db.TblTaikhoans.ToList();
            return View(tblTaikhoans);
        }

        // GET: AdminController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: AdminController/Create
        public ActionResult Create()
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
        public ActionResult AddTaikhoan(TblTaikhoan taikhoan)
        {
            if (taikhoan.PkITaikhoanId != null)
            {
                db.TblTaikhoans.Add(taikhoan);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // POST: AdminController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: AdminController/Edit/5
        public ActionResult EditTaikhoan(int id)
        {
            List<string> lstQuyen = db.TblPhanquyens.Select(p => p.STenquyen).ToList();
            int i = 0;
            List<SelectListItem> selectListItems = lstQuyen
           .Select(item => new SelectListItem
           {
               Text = item,
               Value = (i++).ToString(),
           }).ToList();
            TblTaikhoan itemEdit= db.TblTaikhoans.Where(p => p.PkITaikhoanId == id).FirstOrDefault();
            ViewBag.FkIQuyenId = selectListItems;
            if (id != 0)
            {

            }
            return View("EditTaikhoan",itemEdit);
        }

        // POST: AdminController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit( TblTaikhoan collection)
        {
            //TblTaikhoan AccountUpdate= new TblTaikhoan();
            //AccountUpdate = (TblTaikhoan)collection;
            db.Update(collection);
            db.SaveChanges();
            return RedirectToAction("Index");
            //try
            //{
            //    return RedirectToAction(nameof(Index));
            //}
            //catch
            //{
            //    return View();
            //}
        }

        // GET: AdminController/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: AdminController/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id, IFormCollection collection)
        {
            try
            {
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Order()
        {
            var orders = db.TblDonhangs
                .Include(o => o.TblCtdonhangs)
                    .ThenInclude(d => d.FkISanpham)
                .ToList();
            ViewBag.Orders = orders;
            return View();
        }
        public ActionResult OrderDetail(int ordID)
        {
            var orderDetails = db.TblDonhangs
                .Where(o => o.PkIDonhangId == ordID)
                .Include(o => o.TblCtdonhangs)
                    .ThenInclude(d => d.FkISanpham)
                .Include(o => o.FkSKh)
                    .ThenInclude(kh => kh.TblDiachiKhs)
                .FirstOrDefault();
            return View(orderDetails);
        }
        [HttpPost]
        public JsonResult UpdateOrderStatus(int ordID)
        {
            var order = db.TblDonhangs
                .FirstOrDefault(o => o.PkIDonhangId == ordID);

            if (order != null && order.FkITrangthai == 1)
            {
                order.FkITrangthai = 2;
                db.SaveChanges();

                return Json(new { success = true, status = "Đã xử lý" });
            }

            return Json(new { success = false, status = "Lỗi cập nhật trạng thái" });
        }
        public ActionResult ListProduct()
        {
            List<TblSanpham> tblSanphams = db.TblSanphams.ToList();
            return View(tblSanphams);
        }

        public IActionResult NewProduct()
        {
            ViewBag.category = db.TblTheloais.ToList();
            return View();
        }

        [HttpGet]
        public IActionResult GetTinhs()
        {
            var tinhs = db.TblTheloais.OrderBy(t => t.STentheloai).ToList();
            return Json(tinhs);
        }
        [HttpPost]
        public async Task<IActionResult> NewProduct(IFormCollection form)
        {
            if (!int.TryParse(form["cate"], out int maTheLoai) ||
                !int.TryParse(form["danhm"], out int maDanhMuc) ||
                !int.TryParse(form["ITonkho"], out int soLuongTonKho) ||
                !double.TryParse(form["FTrongluong"], out double trongLuong) ||
                !double.TryParse(form["FGiaban"], out double giaBan) ||
                !double.TryParse(form["FGiavon"], out double giaVon) ||
                !int.TryParse(form["IsTrangthai"], out int trangThai))
            {
                ModelState.AddModelError("InvalidInput", "Nhập liệu không hợp lệ cho một hoặc nhiều trường.");
                return View("NewProduct"); 
            }

            TblSanpham sanPhamMoi = new TblSanpham
            {
                FkITheloaiId = maTheLoai,
                STensanpham = form["STensanpham"],
                SMavach = form["SMavach"],
                SHinhanh = form["SHinhanh"],
                SMota = form["SMota"],
                ITonkho = soLuongTonKho,
                FTrongluong = trongLuong,
                FGiaban = giaBan,
                FGiavon = giaVon,
                IsTrangthai = trangThai == 1
            };
            db.TblSanphams.Add(sanPhamMoi);
            db.SaveChanges();
            if (maDanhMuc == 1) 
            {
                TblCtsach newCtsach = new TblCtsach
                {
                    FkISanphamId = sanPhamMoi.PkISanphamId,
                    STacgia = form["author"],
                    SNhaxuatban = form["publisher"],
                    SNgonngu = form["language"],
                    SNguoidich = form["translator"],
                    Isbn = form["isbn"],
                    ISotrang = int.Parse(form["pageCount"])
                };
                db.TblCtsaches.Add(newCtsach);
                db.SaveChanges();
            }
            else if (maDanhMuc == 2) 
            {
                TblCtvanphongpham newCtvanphongpham = new TblCtvanphongpham
                {
                    FkISanphamId = sanPhamMoi.PkISanphamId,
                    SXuatxu = form["origin"],
                    SThuonghieu = form["brand"],
                    SMausac = form["color"],
                    SChatlieu = form["material"],
                    SKichthuoc = form["size"]
                };
                db.TblCtvanphongphams.Add(newCtvanphongpham);
                db.SaveChanges();
            }

            try
            {
                await db.SaveChangesAsync();
                return RedirectToAction("Index"); 
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("DatabaseError", "Lỗi xảy ra khi thêm sản phẩm: " + ex.Message);
                return View("NewProduct"); 
            }
        }
        [HttpGet]
        public IActionResult EditProduct(int id)
        {
            var product = db.TblSanphams.FirstOrDefault(p => p.PkISanphamId == id);
            if (product == null)
            {
                return NotFound();
            }

            var categories = db.TblTheloais.ToList();
            ViewBag.Categories = categories;

            var theloai = db.TblTheloais.FirstOrDefault(t => t.PkITheloaiId == product.FkITheloaiId);
            if (theloai != null)
            {
                ViewBag.DanhmucId = theloai.FkIDanhmucId;

                if (theloai.FkIDanhmucId == 1)
                {
                    var bookDetails = db.TblCtsaches.FirstOrDefault(b => b.FkISanphamId == id);
                    ViewBag.BookDetails = bookDetails;
                }
                else if (theloai.FkIDanhmucId == 2)
                {
                    var officeDetails = db.TblCtvanphongphams.FirstOrDefault(o => o.FkISanphamId == id);
                    ViewBag.OfficeDetails = officeDetails;
                }
            }
            else
            {
                ViewBag.DanhmucId = null;
                ViewBag.BookDetails = null;
                ViewBag.OfficeDetails = null;
            }
            return View(product);
        }
        [HttpPost]
        public async Task<IActionResult> EditProduct(int id, IFormCollection form)
        {
            var product = db.TblSanphams.FirstOrDefault(p => p.PkISanphamId == id);
            if (product == null)
            {
                return NotFound();
            }

            // Phân tích và xác nhận các trường nhập liệu
            int maTheLoai = product.FkITheloaiId;
            if (int.TryParse(form["cate"], out int tempMaTheLoai))
            {
                maTheLoai = tempMaTheLoai;
            }

            // Lấy giá trị DanhmucId từ bảng Theloai
            var theloai = db.TblTheloais.FirstOrDefault(t => t.PkITheloaiId == maTheLoai);
            int maDanhMuc = theloai != null ? theloai.FkIDanhmucId : 0;

            int soLuongTonKho = product.ITonkho; 
            if (int.TryParse(form["ITonkho"], out int tempSoLuongTonKho))
            {
                soLuongTonKho = tempSoLuongTonKho;
            }

            double trongLuong = product.FTrongluong ?? 0.0;
            if (double.TryParse(form["FTrongluong"], out double tempTrongLuong))
            {
                trongLuong = tempTrongLuong;
            }

            double giaBan = product.FGiaban; 
            if (double.TryParse(form["FGiaban"], out double tempGiaBan))
            {
                giaBan = tempGiaBan;
            }

            double giaVon = product.FGiavon; 
            if (double.TryParse(form["FGiavon"], out double tempGiaVon))
            {
                giaVon = tempGiaVon;
            }

            bool trangThai = product.IsTrangthai ?? false;
            if (int.TryParse(form["IsTrangthai"], out int tempTrangThai))
            {
                trangThai = tempTrangThai == 1;
            }
            product.FkITheloaiId = maTheLoai;
            product.STensanpham = string.IsNullOrWhiteSpace(form["STensanpham"]) ? product.STensanpham : form["STensanpham"];
            product.SMavach = string.IsNullOrWhiteSpace(form["SMavach"]) ? product.SMavach : form["SMavach"];
            product.SHinhanh = string.IsNullOrWhiteSpace(form["SHinhanh"]) ? product.SHinhanh : form["SHinhanh"];
            product.SMota = string.IsNullOrWhiteSpace(form["SMota"]) ? product.SMota : form["SMota"];
            product.ITonkho = soLuongTonKho;
            product.FTrongluong = trongLuong;
            product.FGiaban = giaBan;
            product.FGiavon = giaVon;
            product.IsTrangthai = trangThai;

            if (maDanhMuc == 1) 
            {
                var bookDetails = db.TblCtsaches.FirstOrDefault(b => b.FkISanphamId == id);
                if (bookDetails != null)
                {
                    bookDetails.STacgia = string.IsNullOrWhiteSpace(form["author"]) ? bookDetails.STacgia : form["author"];
                    bookDetails.SNhaxuatban = string.IsNullOrWhiteSpace(form["publisher"]) ? bookDetails.SNhaxuatban : form["publisher"];
                    bookDetails.SNgonngu = string.IsNullOrWhiteSpace(form["language"]) ? bookDetails.SNgonngu : form["language"];
                    bookDetails.SNguoidich = string.IsNullOrWhiteSpace(form["translator"]) ? bookDetails.SNguoidich : form["translator"];
                    bookDetails.Isbn = string.IsNullOrWhiteSpace(form["isbn"]) ? bookDetails.Isbn : form["isbn"];
                    if (int.TryParse(form["pageCount"], out int tempPageCount))
                    {
                        bookDetails.ISotrang = tempPageCount;
                    }
                }
            }
            else if (maDanhMuc == 2) 
            {
                var officeDetails = db.TblCtvanphongphams.FirstOrDefault(o => o.FkISanphamId == id);
                if (officeDetails != null)
                {
                    officeDetails.SXuatxu = string.IsNullOrWhiteSpace(form["origin"]) ? officeDetails.SXuatxu : form["origin"];
                    officeDetails.SThuonghieu = string.IsNullOrWhiteSpace(form["brand"]) ? officeDetails.SThuonghieu : form["brand"];
                    officeDetails.SMausac = string.IsNullOrWhiteSpace(form["color"]) ? officeDetails.SMausac : form["color"];
                    officeDetails.SChatlieu = string.IsNullOrWhiteSpace(form["material"]) ? officeDetails.SChatlieu : form["material"];
                    officeDetails.SKichthuoc = string.IsNullOrWhiteSpace(form["size"]) ? officeDetails.SKichthuoc : form["size"];
                }
            }

            try
            {
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("DatabaseError", "Lỗi xảy ra khi cập nhật sản phẩm: " + ex.Message);
                return View(product);
            }
        }

        public IActionResult DeleteProduct(int id)
        {
            var productItem = db.TblSanphams.FirstOrDefault(c => c.PkISanphamId == id);
            if (productItem != null)
            {
                var relatedBookDetails = db.TblCtsaches.Where(c => c.FkISanphamId == id).ToList();
                db.TblCtsaches.RemoveRange(relatedBookDetails);
                db.TblSanphams.Remove(productItem);
                db.SaveChanges();
                return View(ListProduct);
            }
            return Json(new { success = false, message = "." });
        }
        public IActionResult ListSupplier()
        {
            List<TblNhacungcap> tblNhacungcaps = db.TblNhacungcaps.ToList();
            return View(tblNhacungcaps);
        }
        public IActionResult NewSupplier()
        {
            return View();
        }
        [HttpPost]
        public IActionResult NewSupplier(IFormCollection form)
        {
            TblNhacungcap tblNhacungcap = new TblNhacungcap()
            {
                STenNcc = form["STenNcc"],
                SSdt = form["SSdt"],
                SEmail = form["SEmail"],
                SMasothue = form["SMasothue"]
            };
            db.TblNhacungcaps.Add(tblNhacungcap);
            db.SaveChanges();
            return View("ListSupplier");
        }
        public IActionResult EditSupplier(int nccID)
        {
            var ncc = db.TblNhacungcaps.FirstOrDefault(p => p.PkINccid == nccID);
            return View(ncc);
        }
        [HttpPost]
        public async Task<IActionResult> EditSupplier(int id, IFormCollection form)
        {
            var ncc = db.TblNhacungcaps.FirstOrDefault(p => p.PkINccid == id);
            if (ncc != null)
            {
                ncc.STenNcc = string.IsNullOrWhiteSpace(form["STenNcc"]) ? ncc.STenNcc : form["STenNcc"];
                ncc.SSdt = string.IsNullOrWhiteSpace(form["SSdt"]) ? ncc.SSdt : form["SSdt"];
                ncc.SEmail = string.IsNullOrWhiteSpace(form["SEmail"]) ? ncc.SEmail : form["SEmail"];
                ncc.SMasothue = string.IsNullOrWhiteSpace(form["SMasothue"]) ? ncc.SMasothue : form["SMasothue"];
            }
            await db.SaveChangesAsync();
            return RedirectToAction("ListSupplier");
        }
    }
}

            

