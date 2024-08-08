using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using X.PagedList;
using X.PagedList.Extensions;
using Newtonsoft.Json;

namespace DATN_OnlineBookStore.Controllers
{
    public class ProductController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        private readonly ILogger<ProductController> _logger;
        private readonly IHttpClientFactory _clientFactory;

        public ProductController(ILogger<ProductController> logger, IHttpClientFactory clientFactory)
        {
            _logger = logger;
            _clientFactory = clientFactory;
        }
        public async Task<IActionResult> viewProduct(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;

            var lstSanpham = await db.TblSanphams
                .AsNoTracking()
                .OrderBy(x => x.STensanpham)
                .ToListAsync();
            var productRatings = lstSanpham.ToDictionary(
                p => p.PkISanphamId,
                p => {
                    var ratings = db.TblDanhgia
                                    .Where(d => d.FkICtdonhangId == p.PkISanphamId)
                                    .Select(d => d.FXephang)
                                    .ToList();

                    return ratings.Any() ? ratings.Average() : 0.0;
                }
            );

            ViewBag.ProductRatings = productRatings;

            var pagedList = new PagedList<TblSanpham>(lstSanpham, pageNumber, pageSize);
            int userId = HttpContext.Session.GetInt32("AccountId") ?? 1;
            //var recommendations = await GetRecommendations(userId, 5);
            //ViewBag.Recommendations = recommendations;

            return View(pagedList);
        }
        public async Task<IActionResult> viewAllProduct(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;

            var lstSanpham = await db.TblSanphams
                .AsNoTracking()
                .OrderBy(x => x.STensanpham)
                .ToListAsync();
            var productRatings = lstSanpham.ToDictionary(
                p => p.PkISanphamId,
                p => {
                    var ratings = db.TblDanhgia
                                    .Where(d => d.FkICtdonhangId == p.PkISanphamId)
                                    .Select(d => d.FXephang)
                                    .ToList();

                    return ratings.Any() ? ratings.Average() : 0.0;
                }
            );

            ViewBag.ProductRatings = productRatings;

            var pagedList = new PagedList<TblSanpham>(lstSanpham, pageNumber, pageSize);
            int userId = HttpContext.Session.GetInt32("AccountId") ?? 1;
            return View(pagedList);
        }
        private async Task<List<TblSanpham>> GetRecommendations(int userId, int nRecommendations)
        {
            var client = _clientFactory.CreateClient();
            var requestUrl = $"http://192.168.0.101:5000/api/recommendation/user/{userId}/recommendations?n={nRecommendations}";
            var response = await client.GetAsync(requestUrl);
            if (response.IsSuccessStatusCode)
            {
                var responseString = await response.Content.ReadAsStringAsync();
                var recommendations = JsonConvert.DeserializeObject<List<Recommendation>>(responseString);
                var productIds = recommendations.Select(r => r.ItemId).ToList();
                return await db.TblSanphams.Where(p => productIds.Contains(p.PkISanphamId)).ToListAsync();
            }
            return new List<TblSanpham>();
        }

        private class Recommendation
        {
            public int ItemId { get; set; }
            public float PredictedRating { get; set; }
        }   
        [HttpGet("Search")]
        public IActionResult searchProducts(string query, int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;

            if (string.IsNullOrEmpty(query))
            {
                var products = db.TblSanphams
                    .OrderBy(p => p.STensanpham)
                    .ToPagedList(pageNumber, pageSize);
                return View(products);
            }

            var productsWithQuery = db.TblSanphams
                .Where(p => p.STensanpham.ToLower().Contains(query.ToLower().Trim()))
                .OrderBy(p => p.STensanpham)
                .ToPagedList(pageNumber, pageSize);

            ViewBag.SearchQuery = query;

            return View(productsWithQuery);
        }
        public IActionResult viewProductDetails(int id)
        {
            var product = db.TblSanphams
                .AsNoTracking()
                .Include(p => p.FkITheloai)
                .ThenInclude(t => t.FkIDanhmuc)
                .FirstOrDefault(p => p.PkISanphamId == id);

            if (product == null)
            {
                return NotFound("Không tìm thấy sản phẩm");
            }

            var danhmucId = product.FkITheloai.FkIDanhmuc.PkIDanhmucId;
            ViewBag.DanhmucId = danhmucId;

            if (danhmucId == 1)
            {
                var bookDetails = db.TblCtsaches
                    .AsNoTracking()
                    .FirstOrDefault(b => b.FkISanphamId == product.PkISanphamId);

                if (bookDetails != null)
                {
                    ViewBag.BookDetails = bookDetails;
                }
                else
                {
                    Console.WriteLine("Không tìm thấy chi tiết sách cho sản phẩm này.");
                }
            }
            else if (danhmucId == 2)
            {
                var officeSupplyDetails = db.TblCtvanphongphams
                    .AsNoTracking()
                    .FirstOrDefault(o => o.FkISanphamId == product.PkISanphamId);

                if (officeSupplyDetails != null)
                {
                    ViewBag.OfficeSupplyDetails = officeSupplyDetails;
                }
                else
                {
                    Console.WriteLine("Không tìm thấy chi tiết văn phòng phẩm cho sản phẩm này.");
                }
            }
            var orderDetails = db.TblCtdonhangs.Where(od => od.FkISanphamId == product.PkISanphamId).ToList();
            var reviews = db.TblDanhgia
                .Where(r => orderDetails.Select(od => od.PkICtdonhangId).Contains(r.FkICtdonhangId))
                .Select(r => new ReviewViewModel
                {
                    ReviewId = r.PkIDanhgiaId,
                    Rating = r.FXephang,
                    Description = r.SMota,
                    CreatedAt = r.DThoigiantao
                })
                .ToList();

            ViewBag.Reviews = reviews;

            return View(product);
        }
        public ActionResult viewProductList()
        {
            List<TblSanpham> tblSanphams = db.TblSanphams.ToList();
            return View(tblSanphams);
        }
        public IActionResult addProduct()
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
        public async Task<IActionResult> addProduct(IFormCollection form)
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
                return RedirectToAction("viewProductList");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("DatabaseError", "Lỗi xảy ra khi thêm sản phẩm: " + ex.Message);
                return View("NewProduct");
            }
        }
        [HttpGet]
        public IActionResult updateProduct(int id)
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
        public async Task<IActionResult> updateProduct(int id, IFormCollection form)
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
                return RedirectToAction("viewProductList");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("DatabaseError", "Lỗi xảy ra khi cập nhật sản phẩm: " + ex.Message);
                return View(product);
            }
        }
        public IActionResult hideProduct(int id)
        {
            return View();
        }
        public IActionResult filterProductsByType()
        {
            return View();
        }
        public IActionResult filterProductsByCategory() {
            return View();
        }
        public IActionResult filterProductBySatust()
        {
            return View();
        }
        public IActionResult viewCategory()
        {
            return View();
        }
        public IActionResult addProductCategory()
        {
            return View();
        }
        public IActionResult updateProductCategory(int categoryId)
        {
            return View();
        }
        public IActionResult getProductReviews(int productId)
        {
            try
            {
                var product = db.TblSanphams.FirstOrDefault(p => p.PkISanphamId == productId);
                if (product == null)
                {
                    return Json(new { success = false, message = "Product not found." });
                }
                var orderDetails = db.TblCtdonhangs.Where(od => od.FkISanphamId == productId).ToList();
                var reviews = db.TblDanhgia
                    .Where(r => orderDetails.Select(od => od.PkICtdonhangId).Contains(r.FkICtdonhangId))
                    .Select(r => new ReviewViewModel
                    {
                        ReviewId = r.PkIDanhgiaId,
                        Rating = r.FXephang,
                        Description = r.SMota,
                        UserName = db.TblDonhangs.Where(dh => dh.TblCtdonhangs.Any(ct => ct.PkICtdonhangId == r.FkICtdonhangId))
                                                 .Select(dh => dh.FkSKh.STen).FirstOrDefault(), // Lấy tên khách hàng từ TblKhachhang thông qua TblDonhang
                        CreatedAt = r.DThoigiantao
                    })
                    .ToList();
                var viewModel = new ProductReviewViewModel
                {
                    ProductId = product.PkISanphamId,
                    ProductName = product.STensanpham,
                    Reviews = reviews
                };

                return Json(new { success = true, data = viewModel });
            }
            catch (Exception ex)
            {
                return Json(new { success = false, message = "An error occurred while fetching product reviews." });
            }
        }

    }
}
