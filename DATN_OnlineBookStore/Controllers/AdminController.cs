using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

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
            return RedirectToAction("Create");
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
            if(id !=0)
            {
               
            }    
            return View();
        }

        // POST: AdminController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, IFormCollection collection)
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
    }
}
