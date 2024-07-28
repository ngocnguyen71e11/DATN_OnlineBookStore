using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace DATN_OnlineBookStore.Controllers
{
    public class EmployeeController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        // GET: StaffController
        public ActionResult Index()
        {
            List<TblNhanvien> tblNhanviens = db.TblNhanviens.ToList();
            return View("Index",tblNhanviens);
        }

        // GET: StaffController/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: StaffController/Create
        public ActionResult Create()
        {
            List<int> lstQuyen = db.TblTaikhoans.Select(p => p.PkITaikhoanId).ToList();
            int i = 0;
            List<SelectListItem> selectListItems = lstQuyen
           .Select(item => new SelectListItem
           {
               Text = item.ToString(),
               Value = (i++).ToString(),
           }).ToList();
            ViewBag.FkITaikhoanId = selectListItems;
            return View();
        }

        // POST: StaffController/Create
        [HttpPost]
        public ActionResult AddNhanvien(TblNhanvien nhanvien)
        {
            if (nhanvien.PkSNhanvienId != null)
            {
                db.TblNhanviens.Add(nhanvien);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        // GET: StaffController/Edit/5
        public ActionResult Edit(string id)
        {
            List<int> lstQuyen = db.TblTaikhoans.Select(p => p.PkITaikhoanId).ToList();
            int i = 0;
            List<SelectListItem> selectListItems = lstQuyen
           .Select(item => new SelectListItem
           {
               Text = item.ToString(),
               Value = (i++).ToString(),
           }).ToList();
            ViewBag.FkITaikhoanId = selectListItems;
            TblNhanvien itemEdit = db.TblNhanviens.Where(p => p.PkSNhanvienId.Equals(id)).FirstOrDefault();
       
            return View("Edit", itemEdit);
        }

        // POST: StaffController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TblNhanvien collection)
        {
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

        // GET: StaffController/Delete/5
        public ActionResult Delete(string id)
        {
            TblNhanvien tblNhanvien= db.TblNhanviens.Where(p=>p.PkSNhanvienId.Equals(id)).FirstOrDefault();
            db.TblNhanviens.Remove(tblNhanvien);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // POST: StaffController/Delete/5
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
