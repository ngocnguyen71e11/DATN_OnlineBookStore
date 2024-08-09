using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

namespace DATN_OnlineBookStore.Controllers
{
    public class FinanceController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();

        // GET: FinanceController
        public ActionResult ViewDailyFinanceReport(IFormCollection collection)
        {
            string selectedValue = collection["items"];
            var currentTime = DateTime.Now;

            IQueryable<DailyFinanceReportModel> query;

            if (string.IsNullOrEmpty(selectedValue))
            {
                // Không chọn ngày, tính cho toàn bộ dữ liệu
                query = from dh in db.TblDonhangs
                        where dh.FkITrangthai == 3
                        join ct in db.TblCtdonhangs on dh.PkIDonhangId equals ct.FkIDonhangId
                        join kh in db.TblKhachhangs on dh.FkSKhid equals kh.PkSKhid
                        group new { dh, ct } by new
                        {
                            Date = dh.DThoigianmua.Value.Date // Nhóm theo ngày
                        } into g
                        select new DailyFinanceReportModel
                        {
                            Ngay = g.Key.Date,
                            SoHoaDon = g.Select(x => x.dh.PkIDonhangId).Distinct().Count(),
                            TongTien = g.Sum(x => x.dh.FTongtien ?? 0)
                        };

                var reportData = query.ToList();

                // Tính tổng số hóa đơn và tổng tiền cho tháng hiện tại
                var totalMonthlyData = new DailyFinanceReportModel
                {
                    Ngay = new DateTime(currentTime.Year, currentTime.Month, 1),
                    SoHoaDon = reportData.Sum(x => x.SoHoaDon),
                    TongTien = reportData.Sum(x => x.TongTien)
                };

                ViewBag.TotalMonthlyData = totalMonthlyData;
                return View("viewDailyFinanceReport", reportData);
            }
            else
            {
                // Nếu có chọn ngày, tính theo khoảng thời gian
                int days = int.Parse(selectedValue);
                DateTime thresholdDate = currentTime.AddDays(-days);

                query = from dh in db.TblDonhangs
                        where dh.FkITrangthai == 3 && dh.DThoigianmua >= thresholdDate
                        join ct in db.TblCtdonhangs on dh.PkIDonhangId equals ct.FkIDonhangId
                        join kh in db.TblKhachhangs on dh.FkSKhid equals kh.PkSKhid
                        group new { dh, ct } by new
                        {
                            Date = dh.DThoigianmua.Value.Date // Nhóm theo ngày
                        } into g
                        select new DailyFinanceReportModel
                        {
                            Ngay = g.Key.Date,
                            SoHoaDon = g.Select(x => x.dh.PkIDonhangId).Distinct().Count(),
                            TongTien = g.Sum(x => x.dh.FTongtien ?? 0)
                        };

                var reportData = query.ToList();

                // Tính tổng số hóa đơn và tổng tiền cho khoảng thời gian
                var totalMonthlyData = new DailyFinanceReportModel
                {
                    Ngay = new DateTime(currentTime.Year, currentTime.Month, 1),
                    SoHoaDon = reportData.Sum(x => x.SoHoaDon),
                    TongTien = reportData.Sum(x => x.TongTien)
                };

                ViewBag.TotalMonthlyData = totalMonthlyData;
                return View("viewDailyFinanceReport", reportData);
            }
        }

        public ActionResult ViewMonthlyFinanceReport(string selectedMonth)
        {
            DateTime currentTime = DateTime.Now;
            DateTime startDate;
            DateTime endDate;

            if (string.IsNullOrEmpty(selectedMonth))
            {
                // Nếu không chọn tháng, lấy tháng hiện tại
                startDate = new DateTime(currentTime.Year, currentTime.Month, 1);
                endDate = startDate.AddMonths(1).AddDays(-1);
            }
            else
            {
                // Phân tích tháng được chọn (dưới dạng "yyyy-MM")
                var monthYear = selectedMonth.Split('-');
                int year = int.Parse(monthYear[0]);
                int month = int.Parse(monthYear[1]);

                startDate = new DateTime(year, month, 1);
                endDate = startDate.AddMonths(1).AddDays(-1);
            }

            var query = from dh in db.TblDonhangs
                        where dh.FkITrangthai == 3 && dh.DThoigianmua >= startDate && dh.DThoigianmua <= endDate
                        join ct in db.TblCtdonhangs on dh.PkIDonhangId equals ct.FkIDonhangId
                        group new { dh, ct } by new
                        {
                            Date = dh.DThoigianmua.Value.Date // Nhóm theo ngày
                        } into g
                        select new DailyFinanceReportModel
                        {
                            Ngay = g.Key.Date,
                            SoHoaDon = g.Select(x => x.dh.PkIDonhangId).Distinct().Count(),
                            TongTien = g.Sum(x => x.dh.FTongtien ?? 0)
                        };

            var reportData = query.ToList();

            // Tính tổng số hóa đơn và tổng tiền cho tháng đã chọn
            var totalMonthlyData = new DailyFinanceReportModel
            {
                Ngay = startDate,
                SoHoaDon = reportData.Sum(x => x.SoHoaDon),
                TongTien = reportData.Sum(x => x.TongTien)
            };

            ViewBag.TotalMonthlyData = totalMonthlyData;
            return View("viewMonthlyFinanceReport", reportData);
        }

        public ActionResult viewMonthlySalesReport()
        {
            var report = db.TblCtdonhangs
                .Join(
                    db.TblDonhangs.Where(dh => dh.FkITrangthai == 3),
                    ctdh => ctdh.FkIDonhangId,
                    dh => dh.PkIDonhangId,
                    (ctdh, dh) => new { ctdh, dh }
                )
                .GroupBy(x => new { x.ctdh.FkISanphamId, x.ctdh.FkISanpham.STensanpham })
                .Select(g => new SalesReport
                {
                    MaHang = g.Key.FkISanphamId,
                    TenHang = g.Key.STensanpham,
                    TongSoMatHang = g.Count(),
                    TongSoLuongDaBan = g.Sum(x => x.ctdh.ISoluong ?? 0)
                })
                .ToList();

            return View(report);
        }
        

    }
}
