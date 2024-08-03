using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;

namespace DATN_OnlineBookStore.Controllers
{
    public class SupplierController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public IActionResult viewSupplierList()
        {
            List<TblNhacungcap> tblNhacungcaps = db.TblNhacungcaps.ToList();
            return View(tblNhacungcaps);
        }
        public IActionResult addSupplier()
        {
            return View();
        }
        [HttpPost]
        public IActionResult addSupplier(IFormCollection form)
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
        public IActionResult updateSupplierInfo(int supplierID)
        {
            var ncc = db.TblNhacungcaps.FirstOrDefault(p => p.PkINccid == supplierID);
            return View(ncc);
        }
        [HttpPost]
        public async Task<IActionResult> updateSupplierInfo(int id, IFormCollection form)
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
            return RedirectToAction("viewSupplierList");
        }
    }
}
