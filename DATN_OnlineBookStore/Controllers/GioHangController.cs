using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;

namespace DATN_OnlineBookStore.Controllers
{
    public class GioHangController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();

        public IActionResult AddToCart(int productId, int quantity = 1)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var user = db.TblKhachhangs.FirstOrDefault(kh => kh.FkITaikhoanId == taikhoanId.Value);
            if (user == null)
            {
                return NotFound("Không tìm thấy thông tin khách hàng.");
            }

            var cart = db.TblGiohangs.FirstOrDefault(g => g.FkIKhid == user.PkSKhid);
            if (cart == null)
            {
                cart = new TblGiohang { FkIKhid = user.PkSKhid };
                db.TblGiohangs.Add(cart);
                db.SaveChanges();
            }

            var product = db.TblSanphams.FirstOrDefault(p => p.PkISanphamId == productId);
            if (product == null)
            {
                return NotFound("Sản phẩm không tồn tại.");
            }

            var cartItem = db.TblCtgiohangs.FirstOrDefault(c => c.FkISanphamId == productId && c.FkIGiohangId == cart.PkIGiohangId);
            if (cartItem == null)
            {
                var newItem = new TblCtgiohang
                {
                    FkISanphamId = productId,
                    FkIGiohangId = cart.PkIGiohangId,
                    ISoluong = quantity
                };
                db.TblCtgiohangs.Add(newItem);
            }
            else
            {
                cartItem.ISoluong += quantity;
            }

            db.SaveChanges();
            var cartProducts = db.TblCtgiohangs
                .Where(c => c.FkIGiohangId == cart.PkIGiohangId)
                .Select(c => Tuple.Create(
                    c.FkISanpham.STensanpham,       // Tên sản phẩm
                    (int?)c.ISoluong,               // Số lượng (có thể null)
                    c.FkISanpham.FGiaban,           // Giá bán
                    (double?)(c.ISoluong * c.FkISanpham.FGiaban),  // Tổng giá (có thể null)
                    c.PkICtgiohangId                // ID của sản phẩm trong giỏ hàng
                ))
                .ToList();

            return View("Cart", cartProducts);
        }

        [HttpPost]
        public IActionResult UpdateCartItem(int cartItemId, int newQuantity)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var cartItem = db.TblCtgiohangs.FirstOrDefault(c => c.PkICtgiohangId == cartItemId);
            if (cartItem != null)
            {
                cartItem.ISoluong = newQuantity; // Đảm bảo cập nhật số lượng chính xác
                db.SaveChanges();
                return Json(new { success = true, updatedQuantity = newQuantity });
            }

            return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng." });
        }
        [HttpPost]
        public IActionResult RemoveFromCart(int cartItemId)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var cartItem = db.TblCtgiohangs.FirstOrDefault(c => c.PkICtgiohangId == cartItemId);
            if (cartItem != null)
            {
                db.TblCtgiohangs.Remove(cartItem);
                db.SaveChanges();
                return Json(new { success = true });
            }

            return Json(new { success = false, message = "Không tìm thấy sản phẩm trong giỏ hàng." });
        }
        [HttpPost]
        public IActionResult Checkout(List<int> selectedItems)
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var user = db.TblKhachhangs.FirstOrDefault(kh => kh.FkITaikhoanId == taikhoanId.Value);
            if (user == null)
            {
                return NotFound("Không tìm thấy thông tin khách hàng.");
            }

            var cart = db.TblGiohangs.FirstOrDefault(g => g.FkIKhid == user.PkSKhid);
            if (cart == null)
            {
                return NotFound("Giỏ hàng không tồn tại.");
            }

            var selectedCartItems = db.TblCtgiohangs
                .Where(c => selectedItems.Contains(c.PkICtgiohangId) && c.FkIGiohangId == cart.PkIGiohangId)
                .Select(c => new
                {
                    c.FkISanpham.STensanpham,
                    c.ISoluong,
                    c.FkISanpham.FGiaban,
                    ThanhTien = c.ISoluong * c.FkISanpham.FGiaban,
                    c.FkISanphamId 
                })
                .ToList();

            var totalPrice = selectedCartItems.Sum(c => (c.ThanhTien ?? 0));

            var model = new CheckoutViewModel
            {
                SelectedItems = selectedCartItems,
                TotalPrice = totalPrice
            };

            ViewBag.Tinhs = db.TblTinhs.ToList();

            return View("payment", model);
        }

        public IActionResult ViewCart()
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var user = db.TblKhachhangs.FirstOrDefault(kh => kh.FkITaikhoanId == taikhoanId.Value);
            if (user == null)
            {
                return NotFound("Không tìm thấy thông tin khách hàng.");
            }

            var cart = db.TblGiohangs.FirstOrDefault(g => g.FkIKhid == user.PkSKhid);
            if (cart == null)
            {
                return View("Cart", new List<Tuple<string, int?, double, double?, int>>());
            }

            var cartProducts = db.TblCtgiohangs
                .Where(c => c.FkIGiohangId == cart.PkIGiohangId)
                .Select(c => Tuple.Create(
                    c.FkISanpham.STensanpham,      
                    c.ISoluong,                     
                    (double?)(c.ISoluong * c.FkISanpham.FGiaban),  
                    c.PkICtgiohangId                
                ))
                .ToList();

            return View("Cart", cartProducts);
        }

        [HttpGet]
        public IActionResult GetTinhs()
        {
            var tinhs = db.TblTinhs.OrderBy(t => t.STentinh).ToList();
            return Json(tinhs);
        }
        [HttpGet("api/huyens/{tinhId}")]
        public IActionResult GetHuyens(int tinhId)
        {
            var huyens = db.TblHuyens.Where(h => h.FkITinhId == tinhId).ToList();
            return Json(huyens);
        }
        [HttpGet("api/wards/{huyenId}")]
        public IActionResult GetWards(int huyenId)
        {
            var wards = db.TblXas.Where(x => x.FkIHuyenId == huyenId).ToList();
            return Json(wards);
        }

        [HttpPost]
        public async Task<IActionResult> ProcessCheckout(IFormCollection form)
        {
            if (!int.TryParse(form["ward"], out int ward))
            {
                return BadRequest("Invalid ward input");
            }

            string address = form["address"];
            string phone = form["phone"];
            string firstname = form["FirstName"];
            string lastname = form["LastName"];

            string[] productIdStrings = form["productIds"].ToString().Split(',');
            int[] productIds = productIdStrings.Select(id => int.Parse(id)).ToArray();
            string[] quantityStrings = form["quantities"].ToString().Split(',');
            int[] quantities = quantityStrings.Select(qty => int.Parse(qty)).ToArray();

            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            if (productIds.Length == 0 || quantities.Length == 0)
            {
                return BadRequest("Không có sản phẩm nào trong giỏ hàng.");
            }

            var xaInfo = await db.TblXas
            .Include(x => x.FkIHuyen)
                .ThenInclude(h => h.FkITinh)
            .FirstOrDefaultAsync(x => x.PkIXaId == ward);
            int huyenId = xaInfo.FkIHuyen.PkIHuyenId;
            int tinhId = xaInfo.FkIHuyen.FkITinh.PkITinhId;
            using (var transaction = await db.Database.BeginTransactionAsync())
            {
                try
                {
                    var khachHang = await db.TblKhachhangs.FirstOrDefaultAsync(kh => kh.FkITaikhoanId == taikhoanId.Value);
                    if (khachHang == null)
                    {
                        return NotFound("Không tìm thấy thông tin khách hàng.");
                    }
                    var cart = await db.TblGiohangs.FirstOrDefaultAsync(g => g.FkIKhid == khachHang.PkSKhid);
                    if (cart == null)
                    {
                        return NotFound("Giỏ hàng không tồn tại.");
                    }
                    var diaChi = await db.TblDiachiKhs.FirstOrDefaultAsync(dc => dc.FkSKhid == khachHang.PkSKhid && dc.FkIXaId == ward && dc.SDiachicuthe == address);
                    if (diaChi == null)
                    {
                        diaChi = new TblDiachiKh
                        {
                            FkSKhid = khachHang.PkSKhid,
                            FkIXaId = ward,
                            FkIHuyenId = huyenId,
                            FkITinhId = tinhId,
                            SDiachicuthe = address,
                            SHo = firstname,
                            STen = lastname,
                            SSdt = phone,
                            IsTrangthai = true
                        };
                        db.TblDiachiKhs.Add(diaChi);
                        await db.SaveChangesAsync();
                    }

                    var donHangMoi = new TblDonhang
                    {
                        FkSKhid = khachHang.PkSKhid,
                        FkSDiachiKhid = diaChi.PkSDiachiKhid,
                        FkITrangthai = 1,
                        DThoigianmua = DateTime.Now,
                        FTongtien = 0, 
                    };
                    db.TblDonhangs.Add(donHangMoi);
                    await db.SaveChangesAsync();

                    double totalAmount = 0;
                    var chiTietDonHangList = new List<TblCtdonhang>();

                    for (int i = 0; i < productIds.Length; i++)
                    {
                        var product = await db.TblSanphams.FirstOrDefaultAsync(p => p.PkISanphamId == productIds[i]);
                        if (product == null)
                        {
                            return NotFound($"Không tìm thấy sản phẩm với ID: {productIds[i]}");
                        }

                        var chiTietDonHang = new TblCtdonhang
                        {
                            FkIDonhangId = donHangMoi.PkIDonhangId,
                            FkISanphamId = product.PkISanphamId,
                            ISoluong = quantities[i],
                            FGiaban = product.FGiaban,
                            FKhuyenmai = 0 
                        };
                        chiTietDonHangList.Add(chiTietDonHang);
                        totalAmount += quantities[i] * product.FGiaban;
                    }

                    db.TblCtdonhangs.AddRange(chiTietDonHangList);
                    await db.SaveChangesAsync();

                    donHangMoi.FTongtien = totalAmount;
                    await db.SaveChangesAsync();

                    var cartItemsToRemove = await db.TblCtgiohangs.Where(c => productIds.Contains(c.FkISanphamId) && c.FkIGiohangId == cart.PkIGiohangId).ToListAsync();
                    db.TblCtgiohangs.RemoveRange(cartItemsToRemove);
                    await db.SaveChangesAsync();

                    await transaction.CommitAsync();

                    return RedirectToAction("OrderConfirmation", new { orderId = donHangMoi.PkIDonhangId });
                }
                catch (Exception ex)
                {
                    await transaction.RollbackAsync();
                    Console.WriteLine(ex.Message);
                    return StatusCode(500, "Đã có lỗi xảy ra trong quá trình xử lý đơn hàng.");
                }
            }
        }

        public IActionResult OrderConfirmation()
        {
            var taikhoanId = HttpContext.Session.GetInt32("AccountId");
            if (taikhoanId == null)
            {
                return RedirectToAction("Login", "Access");
            }

            var user = db.TblKhachhangs.FirstOrDefault(kh => kh.FkITaikhoanId == taikhoanId.Value);
            if (user == null)
            {
                return NotFound("Không tìm thấy thông tin khách hàng.");
            }

            var orders = db.TblDonhangs
                .Where(dh => dh.FkSKhid == user.PkSKhid)
                .Select(dh => new OrderViewModel
                {
                    OrderId = dh.PkIDonhangId,
                    OrderDate = dh.DThoigianmua ?? DateTime.Now,
                    TotalPrice = dh.FTongtien ?? 0,
                    Items = dh.TblCtdonhangs.Select(ct => new OrderItemViewModel
                    {
                        ProductName = ct.FkISanpham.STensanpham,
                        Quantity = ct.ISoluong ?? 0,
                        Price = ct.FGiaban ?? 0,
                        Total = (ct.ISoluong ?? 0) * (ct.FGiaban ?? 0),
                        PkICtdonhangId = ct.PkICtdonhangId,
                        IsReviewed = ct.TblDanhgia.Any()
                    }).ToList()
                })
                .ToList();

            return View(orders);
        }


    }
}
