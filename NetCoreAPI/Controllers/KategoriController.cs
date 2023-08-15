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

        [HttpPost]
        public IActionResult KategoriAdd([FromBody] Kategori kategori)
        {
            if (kategori == null)
            {
                return BadRequest("Kategori boş");
            }

            int kategoriID = kategoriler.Max(x => x.KategoriID) + 1;
            kategori.KategoriID = kategoriID;

            kategoriler.Add(kategori);
            return Ok("Yeni kategori başarıyla eklendi");
        }

        private static List<Kategori> kategoriler = new List<Kategori>
        {
            new Kategori { KategoriID = 1, KategoriAd = "Elektronik" },
            new Kategori { KategoriID = 2, KategoriAd = "Giyim" },
            new Kategori { KategoriID = 3, KategoriAd = "Ev Eşyaları" }
        };
    }
}
