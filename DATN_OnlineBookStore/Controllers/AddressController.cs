using DATN_OnlineBookStore.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace DATN_OnlineBookStore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AddressController : ControllerBase
    {
        private readonly DbOnlineBookStoreContext _context;

        public AddressController(DbOnlineBookStoreContext context)
        {
            _context = context;
        }

        [HttpGet("tinh")]
        public IActionResult GetTinhs()
        {
            var tinhs = _context.TblTinhs.Select(t => new { t.PkITinhId, t.STentinh }).ToList();
            return Ok(tinhs);
        }

        [HttpGet("huyen/{tinhId}")]
        public IActionResult GetHuyens(int tinhId)
        {
            var huyens = _context.TblHuyens.Where(h => h.FkITinhId == tinhId).Select(h => new { h.PkIHuyenId, h.STenhuyen }).ToList();
            return Ok(huyens);
        }

        [HttpGet("xa/{huyenId}")]
        public IActionResult GetXas(int huyenId)
        {
            var xas = _context.TblXas.Where(x => x.FkIHuyenId == huyenId).Select(x => new { x.PkIXaId, x.STenxa }).ToList();
            return Ok(xas);
        }
    }
}
