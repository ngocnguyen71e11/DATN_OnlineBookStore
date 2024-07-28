using Microsoft.AspNetCore.Mvc;

namespace DATN_OnlineBookStore.Controllers
{
    public class PromotionController : Controller
    {
        public IActionResult createPromotion()
        {
            return View();
        }
        public IActionResult updatePromotion(int promotionID)
        {
            return View();
        }
        public IActionResult stopPromotion(int promotionID)
        {
            return View();
        }
        public IActionResult deletePromotion(int promotionID)
        {
            return View();
        }
        public IActionResult viewPromotionDetails(int promotionID)
        {
            return View();
        }
        public IActionResult viewPromotionList()
        {
            return View();
        }
    }
}
