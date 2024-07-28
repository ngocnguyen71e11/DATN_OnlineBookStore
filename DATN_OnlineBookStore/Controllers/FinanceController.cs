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
        public ActionResult viewDailyFinanceReport(IFormCollection collection)
        {
            //var currentTime = DateTime.Now;
                string selectedValue = collection["items"];
                var currentTime = DateTime.Now;


                IQueryable<BillModel> query;

                if (string.IsNullOrEmpty(selectedValue))
                {
                    query = from dh in db.TblDonhangs
                            where dh.FkITrangthai == 2
                            join ct in db.TblCtdonhangs on dh.PkIDonhangId equals ct.FkIDonhangId
                            join kh in db.TblKhachhangs on dh.FkSKhid equals kh.PkSKhid
                            group new { dh, ct, kh } by new
                            {
                                dh.PkIDonhangId,
                                dh.DThoigianmua,
                                dh.FTongtien,
                                kh.SHo,
                                kh.STen,
                                kh.PkSKhid
                            } into g
                            select new BillModel
                            {
                                PkIDonhangId = g.Key.PkIDonhangId,
                                FkSKhid = g.Key.PkSKhid,
                                STenKH = g.Key.SHo + " " + g.Key.STen,
                                DThoigiancapnhat = g.Key.DThoigianmua,
                                FTongtien = g.Sum(x => x.dh.FTongtien ?? 0),
                                FSLsanpham = g.Sum(x => x.ct.ISoluong ?? 0)
                            };
                    return View("View", query.ToList());
                }
                else
                {
                    int days = int.Parse(selectedValue);
                    DateTime thresholdDate = currentTime.AddDays(-days);

                    query = from dh in db.TblDonhangs
                            where dh.FkITrangthai == 2 && dh.DThoigianmua >= thresholdDate
                            join ct in db.TblCtdonhangs on dh.PkIDonhangId equals ct.FkIDonhangId
                            join kh in db.TblKhachhangs on dh.FkSKhid equals kh.PkSKhid
                            group new { dh, ct, kh } by new
                            {
                                dh.PkIDonhangId,
                                dh.DThoigianmua,
                                dh.FTongtien,
                                kh.SHo,
                                kh.STen,
                                kh.PkSKhid
                            } into g
                            select new BillModel
                            {
                                PkIDonhangId = g.Key.PkIDonhangId,
                                FkSKhid = g.Key.PkSKhid,
                                STenKH = g.Key.SHo + " " + g.Key.STen,
                                DThoigiancapnhat = g.Key.DThoigianmua,
                                FTongtien = g.Sum(x => x.dh.FTongtien ?? 0),
                                FSLsanpham = g.Sum(x => x.ct.ISoluong ?? 0)
                            };
                }
                return View("View", query.ToList());

        }

        
    }
}
