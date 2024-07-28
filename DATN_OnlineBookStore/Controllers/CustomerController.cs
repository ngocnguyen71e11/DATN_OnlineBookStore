using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace DATN_OnlineBookStore.Controllers
{
    public class CustomerController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        public IActionResult viewCustomerInfo()
        {
            return View();
        }

    }
}
