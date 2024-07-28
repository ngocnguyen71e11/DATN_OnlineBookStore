using Microsoft.AspNetCore.Mvc;

namespace DATN_OnlineBookStore.Controllers
{
    public class AddressController : Controller
    {
        public IActionResult addShippingAddress()
        {
            return View();
        }
        public IActionResult updateShippingAddress(int addressID) 
        { 
            return View();
        }
        public IActionResult viewAddress()
        {
            return View();
        }
    }
}
