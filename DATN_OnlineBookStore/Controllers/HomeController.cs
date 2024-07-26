﻿using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using DATN_OnlineBookStore.Models;
using System.Collections.Generic;
using System.Diagnostics;
using System.Net.Http;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System.Linq;
using X.PagedList;
using X.PagedList.Extensions;

namespace DATN_OnlineBookStore.Controllers
{
    public class HomeController : Controller
    {
        DbOnlineBookStoreContext db = new DbOnlineBookStoreContext();
        private readonly ILogger<HomeController> _logger;
        private readonly IHttpClientFactory _clientFactory;

        public HomeController(ILogger<HomeController> logger, IHttpClientFactory clientFactory)
        {
            _logger = logger;
            _clientFactory = clientFactory;
        }

        public async Task<IActionResult> Index(int? page)
        {
            int pageSize = 10;
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var lstsanpham = db.TblSanphams.AsNoTracking().OrderBy(x => x.STensanpham);
            PagedList<TblSanpham> lst = new PagedList<TblSanpham>(lstsanpham, pageNumber, pageSize);

            int userId = HttpContext.Session.GetInt32("AccountId") ?? 1;
            var recommendations = await GetRecommendations(userId, 5); 
            ViewBag.Recommendations = recommendations;

            return View(lst);
        }
        private async Task<List<TblSanpham>> GetRecommendations(int userId, int nRecommendations)
        {
            var client = _clientFactory.CreateClient();
            var requestUrl = $"http://192.168.0.101:5000/api/recommendation/user/{userId}/recommendations?n={nRecommendations}";
            var response = await client.GetAsync(requestUrl);
            if (response.IsSuccessStatusCode)
            {
                var responseString = await response.Content.ReadAsStringAsync();
                var recommendations = JsonConvert.DeserializeObject<List<Recommendation>>(responseString);
                var productIds = recommendations.Select(r => r.ItemId).ToList();
                return await db.TblSanphams.Where(p => productIds.Contains(p.PkISanphamId)).ToListAsync();
            }
            return new List<TblSanpham>();
        }

        private class Recommendation
        {
            public int ItemId { get; set; }
            public float PredictedRating { get; set; }
        }
        [HttpGet("Search")]
        public IActionResult Search(string query, int? page)
        {
            int pageSize = 10;
            int pageNumber = page ?? 1;

            if (string.IsNullOrEmpty(query))
            {
                var products = db.TblSanphams
                    .OrderBy(p => p.STensanpham)
                    .ToPagedList(pageNumber, pageSize);
                return View(products);
            }

            var productsWithQuery = db.TblSanphams
                .Where(p => p.STensanpham.ToLower().Contains(query.ToLower().Trim()))
                .OrderBy(p => p.STensanpham)
                .ToPagedList(pageNumber, pageSize);

            ViewBag.SearchQuery = query;

            return View(productsWithQuery);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult ProductDetails(int id)
        {
            var product = db.TblSanphams
                .AsNoTracking()
                .Include(p => p.FkITheloai)
                .ThenInclude(t => t.FkIDanhmuc)
                .FirstOrDefault(p => p.PkISanphamId == id);

            if (product == null)
            {
                return NotFound("Không tìm thấy sản phẩm");
            }

            var danhmucId = product.FkITheloai.FkIDanhmuc.PkIDanhmucId;
            ViewBag.DanhmucId = danhmucId;

            if (danhmucId == 1)
            {
                var bookDetails = db.TblCtsaches
                    .AsNoTracking()
                    .FirstOrDefault(b => b.FkISanphamId == product.PkISanphamId);

                if (bookDetails != null)
                {
                    ViewBag.BookDetails = bookDetails;
                }
                else
                {
                    Console.WriteLine("Không tìm thấy chi tiết sách cho sản phẩm này.");
                }
            }
            else if (danhmucId == 12)
            {
                var officeSupplyDetails = db.TblCtvanphongphams
                    .AsNoTracking()
                    .FirstOrDefault(o => o.FkISanphamId == product.PkISanphamId);

                if (officeSupplyDetails != null)
                {
                    ViewBag.OfficeSupplyDetails = officeSupplyDetails;
                }
                else
                {
                    Console.WriteLine("Không tìm thấy chi tiết văn phòng phẩm cho sản phẩm này.");
                }
            }
            return View(product);
        }
    }
}
