using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPI.Models;

namespace NetCoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KategoriController : ControllerBase
    {
        [HttpGet]
        public IActionResult KategoriList()
        {
            return Ok(kategoriler);
        }

        private static List<Kategori> kategoriler = new List<Kategori>
        {
            new Kategori { KategoriID = 1, KategoriAd = "Elektronik" },
            new Kategori { KategoriID = 2, KategoriAd = "Giyim" },
            new Kategori { KategoriID = 3, KategoriAd = "Ev Eşyaları" }
        };
    }
}
