using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OfficeOpenXml;

namespace DATN_OnlineBookStore.Controllers
{
    public class InventoryController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public async Task<IActionResult> viewInventoryList()
        {
            var inventoryList = await db.TblPhieukiemkes
            .Select(p => new
            {
                MaKiemKe = p.PkIPhieukiemkeId,
                ThoiGian = p.DThoigiantao,
                Ton = p.TblCtphieukiemkes.Sum(ct => ct.ITonkho),
                SoThucTe = p.TblCtphieukiemkes.Sum(ct => ct.ISoluongthucte ?? 0),
                TongGiaTriTon = p.TblCtphieukiemkes.Sum(ct => ct.ITonkho * ct.FGiavon),
                TongGiaTriThucTe = p.TblCtphieukiemkes.Sum(ct => (ct.ISoluongthucte ?? 0) * ct.FGiavon),
                TrongChenhLech = p.TblCtphieukiemkes.Sum(ct => ((ct.ISoluongthucte ?? 0) - ct.ITonkho) * ct.FGiavon)
            }).ToListAsync();

            return View(inventoryList);
        }
        public IActionResult importInventoryFile()
        { 
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> importInventoryFile(IFormFile file, string notes)
        {
            if (file == null || file.Length == 0)
            {
                TempData["Error"] = "Không có tệp nào được chọn.";
                return View();
            }

            if (!file.FileName.EndsWith(".xlsx", StringComparison.OrdinalIgnoreCase))
            {
                TempData["Error"] = "Định dạng tệp không hợp lệ. Vui lòng tải lên tệp Excel.";
                return View();
            }

            try
            {
                using (var stream = new MemoryStream())
                {
                    await file.CopyToAsync(stream);
                    using (var package = new ExcelPackage(stream))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0];
                        int rowCount = worksheet.Dimension.Rows;
                        int maxPhieuKiemKeId = db.TblPhieukiemkes.Max(p => (int?)p.PkIPhieukiemkeId) ?? 0;
                        int newPhieuKiemKeId = maxPhieuKiemKeId + 1;
                        var newInventory = new TblPhieukiemke
                        {
                            PkIPhieukiemkeId = newPhieuKiemKeId,
                            DThoigiantao = DateTime.Now,
                            SGhichu = notes
                        };
                        db.TblPhieukiemkes.Add(newInventory);
                        await db.SaveChangesAsync();

                        for (int row = 2; row <= rowCount; row++)
                        {
                            int productId = Convert.ToInt32(worksheet.Cells[row, 1].Value);
                            int quantity = Convert.ToInt32(worksheet.Cells[row, 2].Value);
                            var product = db.TblSanphams.FirstOrDefault(p => p.PkISanphamId == productId);
                            if (product != null)
                            {
                                int maxChiTietPhieuKiemKeId = db.TblCtphieukiemkes.Max(p => (int?)p.PkICtkiemkeId) ?? 0;
                                int newChiTietPhieuKiemKeId = maxChiTietPhieuKiemKeId + 1;
                                var newInventoryItem = new TblCtphieukiemke
                                {
                                    PkICtkiemkeId = newChiTietPhieuKiemKeId,
                                    FkIPhieukiemke = newInventory.PkIPhieukiemkeId,
                                    FkISanphamId = productId,
                                    ISoluongthucte = quantity,
                                    ITonkho = product.ITonkho,
                                    FGiavon = product.FGiavon
                                };
                                db.TblCtphieukiemkes.Add(newInventoryItem);
                            }
                            else
                            {
                                TempData["Error"] = $"Sản phẩm với ID {productId} không tồn tại.";
                                return View();
                            }
                        }

                        await db.SaveChangesAsync();
                        TempData["Success"] = "Phiếu kiểm kê đã được nhập thành công.";
                        return RedirectToAction("viewInventoryList");
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["Error"] = $"Lỗi khi xử lý tệp: {ex.Message}";
                return View();
            }
        }

        public async Task<IActionResult> viewInventoryReports(int id)
        {
            var invent = await db.TblPhieukiemkes
                .Include(p => p.TblCtphieukiemkes)
                .ThenInclude(ct => ct.FkISanpham)
                .FirstOrDefaultAsync(p => p.PkIPhieukiemkeId == id);

            if (invent == null)
            {
                return NotFound();
            }

            return View(invent);
        }
    }
}
