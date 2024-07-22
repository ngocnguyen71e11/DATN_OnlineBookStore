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

        // Thêm sản phẩm vào giỏ hàng
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
                    c.FkISanpham.STensanpham,
                    c.ISoluong,
                    c.FkISanpham.FGiaban,
                    c.ISoluong * c.FkISanpham.FGiaban,
                    c.PkICtgiohangId
                )).ToList();

            return View("Cart", cartProducts);
        }

        // Xóa sản phẩm khỏi giỏ hàng
        // Cập nhật số lượng sản phẩm trong giỏ hàng
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

        // Xóa sản phẩm khỏi giỏ hàng
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


        // Hiển thị giỏ hàng
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
                return View("Cart", new List<Tuple<string, int, double, double>>());
            }

            var cartProducts = db.TblCtgiohangs
                .Where(c => c.FkIGiohangId == cart.PkIGiohangId)
                .Select(c => Tuple.Create(
                    c.FkISanpham.STensanpham,
                    c.ISoluong,
                    c.FkISanpham.FGiaban,
                    c.ISoluong * c.FkISanpham.FGiaban,
                    c.PkICtgiohangId
                )).ToList();

            return View("Cart", cartProducts);
        }

        // Hiển thị trang thanh toán với các sản phẩm đã chọn
        [HttpPost]
        public IActionResult Checkout(int[] selectedItems)
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

            var selectedCartItems = db.TblCtgiohangs
                .Where(c => selectedItems.Contains(c.PkICtgiohangId))
                .Select(c => Tuple.Create(
                    c.FkISanpham.STensanpham,
                    c.ISoluong,
                    c.FkISanpham.FGiaban,
                    c.ISoluong * c.FkISanpham.FGiaban,
                    c.PkICtgiohangId
                )).ToList();

            double totalPrice = selectedCartItems.Sum(item => item.Item4);
            ViewBag.TotalPrice = totalPrice;

            ViewBag.Addresses = db.TblDiachiKhs.Where(a => a.FkSKhid == user.PkSKhid).ToList();
            ViewBag.PaymentMethods = new List<string> { "COD", "Credit Card", "PayPal" };

            return View("payment", selectedCartItems);
        }

        // Xử lý thanh toán các sản phẩm đã chọn
        [HttpPost]
        // Xử lý thanh toán các sản phẩm đã chọn
        [HttpPost]
        public IActionResult ProcessCheckout(int[] selectedItems, int selectedAddressId, string selectedPaymentMethod)
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

            // Đảm bảo rằng trạng thái đơn hàng tồn tại trong bảng tblCTtrangthaidonhang
            int trangThaiDonHangId = db.TblCttrangthaidonhangs.FirstOrDefault()?.PkITrangthaidonhangId ?? 1;

            // Tạo đơn hàng mới
            var newOrder = new TblDonhang
            {
                FkSKhid = user.PkSKhid,
                DThoigianmua = DateTime.Now,
                FTongtien = 0,
                FkITrangthai = trangThaiDonHangId,
                SGhichu = "Đơn hàng mới",
                FkSDiachiKhid = selectedAddressId
            };
            db.TblDonhangs.Add(newOrder);
            db.SaveChanges();

            var selectedCartItems = db.TblCtgiohangs.Where(c => selectedItems.Contains(c.PkICtgiohangId)).ToList();
            double totalAmount = 0;

            // Tạo chi tiết đơn hàng từ các sản phẩm đã chọn
            foreach (var item in selectedCartItems)
            {
                var orderDetail = new TblCtdonhang
                {
                    FkIDonhangId = newOrder.PkIDonhangId,
                    FkISanphamId = item.FkISanphamId,
                    ISoluong = item.ISoluong,
                    FGiaban = item.FkISanpham.FGiaban,
                    FKhuyenmai = 0
                };
                db.TblCtdonhangs.Add(orderDetail);
                totalAmount += item.ISoluong * item.FkISanpham.FGiaban;
                db.TblCtgiohangs.Remove(item);
            }

            // Cập nhật tổng tiền đơn hàng
            newOrder.FTongtien = totalAmount;
            db.SaveChanges();

            // Có thể gửi email hoặc thông báo ở đây nếu cần thiết

            return RedirectToAction("ViewCart");
        }

    }
}
