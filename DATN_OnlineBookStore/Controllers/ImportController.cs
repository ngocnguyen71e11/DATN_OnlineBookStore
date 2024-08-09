using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;
using System.IO;
using System;
using Microsoft.CodeAnalysis;
using System.Runtime.CompilerServices;


namespace DATN_OnlineBookStore.Controllers
{
    public class ImportController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public async Task<IActionResult> viewImportList()
        {
            var orders = await db.TblPhieunhaphangs
                .Include(p => p.FkSNcc)
                .Select(p => new
                {
                    PhieuNhapHangId = p.PkIPhieunhaphangId,
                    NgayTao = p.DThoigiantao,
                    TenNhaCungCap = p.FkSNcc.STenNcc,
                    TongTien = p.TblCtphieunhaphangs.Sum(ct => ct.FGianhap * ct.ISoluong - ct.FChietkhau)
                })
                .ToListAsync();

            return View(orders);
        }
        public IActionResult ImportImportFile()
        {
            ViewBag.Suppliers = db.TblNhacungcaps.Select(s => new { s.PkINccid, s.STenNcc }).ToList();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> ImportImportFile(IFormFile file, string supplier, double invoiceDiscount, string notes)
        {
            if (file == null || file.Length == 0)
            {
                TempData["Error"] = "File is required.";
                ViewBag.Suppliers = db.TblNhacungcaps.Select(s => new { s.PkINccid, s.STenNcc }).ToList();
                return View("ImportImportFile");
            }

            var data = new List<Tuple<int, double, int, double>>();
            try
            {
                using (var stream = new MemoryStream())
                {
                    await file.CopyToAsync(stream);
                    using (var package = new ExcelPackage(stream))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0];
                        int rowCount = worksheet.Dimension.Rows;
                        for (int row = 2; row <= rowCount; row++)
                        {
                            var productId = Convert.ToInt32(worksheet.Cells[row, 1].Value);
                            var price = Convert.ToDouble(worksheet.Cells[row, 2].Value);
                            var quantity = Convert.ToInt32(worksheet.Cells[row, 3].Value);
                            var discount = Convert.ToDouble(worksheet.Cells[row, 4].Value);
                            data.Add(new Tuple<int, double, int, double>(productId, price, quantity, discount));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Lỗi khi xử lý tệp: {ex.Message}";
                ViewBag.Suppliers = db.TblNhacungcaps.Select(s => new { s.PkINccid, s.STenNcc }).ToList();
                return View("ImportImportFile");
            }

            try
            {
                var productIds = data.Select(d => d.Item1).ToList();
                var existingProducts = db.TblSanphams.Where(p => productIds.Contains(p.PkISanphamId)).Select(p => p.PkISanphamId).ToList();

                if (existingProducts.Count != productIds.Count)
                {
                    var missingProductIds = productIds.Except(existingProducts).ToList();
                    TempData["Error"] = "Các mã sản phẩm sau không tồn tại trong cơ sở dữ liệu: " + string.Join(", ", missingProductIds);
                    ViewBag.Suppliers = db.TblNhacungcaps.Select(s => new { s.PkINccid, s.STenNcc }).ToList();
                    return View("ImportImportFile");
                }

                int maxPhieuNhapHangId = db.TblPhieunhaphangs.Max(p => (int?)p.PkIPhieunhaphangId) ?? 0;
                int newPhieuNhapHangId = maxPhieuNhapHangId + 1;

                var purchaseOrder = new TblPhieunhaphang
                {
                    PkIPhieunhaphangId = newPhieuNhapHangId,
                    FkSNccid = int.Parse(supplier),
                    FChietkhau = invoiceDiscount,
                    DThoigiantao = DateTime.Now,
                    SGhichu = notes
                };

                db.TblPhieunhaphangs.Add(purchaseOrder);
                await db.SaveChangesAsync();

                int maxChiTietPhieuNhapHangId = db.TblCtphieunhaphangs.Max(p => (int?)p.PkICtphieunhapId) ?? 0;
                int newChiTietPhieuNhapHangId = maxChiTietPhieuNhapHangId + 1;
                foreach (var item in data)
                {
                    var orderDetail = new TblCtphieunhaphang
                    {
                        PkICtphieunhapId = newChiTietPhieuNhapHangId++,
                        FkIPhieunhaphangId = newPhieuNhapHangId,
                        FkISanphamId = item.Item1,
                        FGianhap = item.Item2,
                        ISoluong = item.Item3,
                        FChietkhau = item.Item4
                    };
                    db.TblCtphieunhaphangs.Add(orderDetail);
                }

                await db.SaveChangesAsync();

                foreach (var item in data)
                {
                    var sanpham = db.TblSanphams.FirstOrDefault(p => p.PkISanphamId == item.Item1);
                    if (sanpham != null)
                    {
                        sanpham.ITonkho += item.Item3;
                        sanpham.FGiavon = item.Item2;
                    }
                }

                await db.SaveChangesAsync();

                TempData["Success"] = "Dữ liệu đã được lưu thành công.";
                return RedirectToAction("viewImportList");
            }
            catch (Exception ex)
            {
                TempData["Error"] = "Lỗi khi lưu dữ liệu: " + ex.Message;
                ViewBag.Suppliers = db.TblNhacungcaps.Select(s => new { s.PkINccid, s.STenNcc }).ToList();
                return View("ImportImportFile");
            }
        }

        public async Task<IActionResult> viewImportReports(int id)
        {
            var order = await db.TblPhieunhaphangs
                .Include(p => p.FkSNcc)
                .Include(p => p.TblCtphieunhaphangs)
                .ThenInclude(ct => ct.FkISanpham)
                .FirstOrDefaultAsync(p => p.PkIPhieunhaphangId == id);

            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }
    }
}
