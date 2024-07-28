//using DATN_OnlineBookStore.Models;
//using Microsoft.AspNetCore.Http;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.Rendering;
//using Microsoft.EntityFrameworkCore;
//using static NuGet.Packaging.PackagingConstants;

//namespace DATN_OnlineBookStore.Controllers
//{
//    public class AdminController : Controller
//    {
//        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
//        // GET: AdminController
//        public ActionResult Index()
//        {
//            List<TblTaikhoan> tblTaikhoans = db.TblTaikhoans.ToList();
//            return View(tblTaikhoans);
//        }

//        // GET: AdminController/Details/5
//        public ActionResult Details(int id)
//        {
//            return View();
//        }

//        // GET: AdminController/Create
//        public ActionResult Create()
//        {
//            List<string> lstQuyen = db.TblPhanquyens.Select(p => p.STenquyen).ToList();
//            int i = 0;
//            List<SelectListItem> selectListItems = lstQuyen
//           .Select(item => new SelectListItem
//           {
//               Text = item,
//               Value = (i++).ToString(),
//           }).ToList();
//            ViewBag.FkIQuyenId = selectListItems;
//            return View("Create");
//        }
//        [HttpPost]
//        public ActionResult AddTaikhoan(TblTaikhoan taikhoan)
//        {
//            if (taikhoan.PkITaikhoanId != null)
//            {
//                db.TblTaikhoans.Add(taikhoan);
//                db.SaveChanges();
//            }
//            return RedirectToAction("Index");
//        }

//        // POST: AdminController/Create
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Create(IFormCollection collection)
//        {
//            try
//            {
//                return RedirectToAction(nameof(Index));
//            }
//            catch
//            {
//                return View();
//            }
//        }

//        // GET: AdminController/Edit/5
//        public ActionResult EditTaikhoan(int id)
//        {
//            List<string> lstQuyen = db.TblPhanquyens.Select(p => p.STenquyen).ToList();
//            int i = 0;
//            List<SelectListItem> selectListItems = lstQuyen
//           .Select(item => new SelectListItem
//           {
//               Text = item,
//               Value = (i++).ToString(),
//           }).ToList();
//            TblTaikhoan itemEdit= db.TblTaikhoans.Where(p => p.PkITaikhoanId == id).FirstOrDefault();
//            ViewBag.FkIQuyenId = selectListItems;
//            if (id != 0)
//            {

//            }
//            return View("EditTaikhoan",itemEdit);
//        }

//        // POST: AdminController/Edit/5
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Edit( TblTaikhoan collection)
//        {
//            //TblTaikhoan AccountUpdate= new TblTaikhoan();
//            //AccountUpdate = (TblTaikhoan)collection;
//            db.Update(collection);
//            db.SaveChanges();
//            return RedirectToAction("Index");
//            //try
//            //{
//            //    return RedirectToAction(nameof(Index));
//            //}
//            //catch
//            //{
//            //    return View();
//            //}
//        }

//        // GET: AdminController/Delete/5
//        public ActionResult Delete(int id)
//        {
//            return View();
//        }

//        // POST: AdminController/Delete/5
//        [HttpPost]
//        [ValidateAntiForgeryToken]
//        public ActionResult Delete(int id, IFormCollection collection)
//        {
//            try
//            {
//                return RedirectToAction(nameof(Index));
//            }
//            catch
//            {
//                return View();
//            }
//        }
//        public IActionResult ListSupplier()
//        {
//            List<TblNhacungcap> tblNhacungcaps = db.TblNhacungcaps.ToList();
//            return View(tblNhacungcaps);
//        }
//        public IActionResult NewSupplier()
//        {
//            return View();
//        }
//        [HttpPost]
//        public IActionResult NewSupplier(IFormCollection form)
//        {
//            TblNhacungcap tblNhacungcap = new TblNhacungcap()
//            {
//                STenNcc = form["STenNcc"],
//                SSdt = form["SSdt"],
//                SEmail = form["SEmail"],
//                SMasothue = form["SMasothue"]
//            };
//            db.TblNhacungcaps.Add(tblNhacungcap);
//            db.SaveChanges();
//            return View("ListSupplier");
//        }
//        public IActionResult EditSupplier(int nccID)
//        {
//            var ncc = db.TblNhacungcaps.FirstOrDefault(p => p.PkINccid == nccID);
//            return View(ncc);
//        }
//        [HttpPost]
//        public async Task<IActionResult> EditSupplier(int id, IFormCollection form)
//        {
//            var ncc = db.TblNhacungcaps.FirstOrDefault(p => p.PkINccid == id);
//            if (ncc != null)
//            {
//                ncc.STenNcc = string.IsNullOrWhiteSpace(form["STenNcc"]) ? ncc.STenNcc : form["STenNcc"];
//                ncc.SSdt = string.IsNullOrWhiteSpace(form["SSdt"]) ? ncc.SSdt : form["SSdt"];
//                ncc.SEmail = string.IsNullOrWhiteSpace(form["SEmail"]) ? ncc.SEmail : form["SEmail"];
//                ncc.SMasothue = string.IsNullOrWhiteSpace(form["SMasothue"]) ? ncc.SMasothue : form["SMasothue"];
//            }
//            await db.SaveChangesAsync();
//            return RedirectToAction("ListSupplier");
//        }
//    }
//}

            

