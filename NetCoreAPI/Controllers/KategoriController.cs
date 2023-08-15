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

        [HttpGet("{id}")]
        public IActionResult KategoriGet(int id)
        {
            var value = kategoriler.Where(x => x.KategoriID == id).FirstOrDefault();

            if(value == null)
            {
                return BadRequest("Kategori mevcut değil");
            }
            else
            {
                return Ok(value);
            }

        }

        [HttpPut("{id}")]
        public IActionResult KategoriUpdate(int id, [FromBody] Kategori kategori)
        {
            var value = kategoriler.Where(x => x.KategoriID == id).FirstOrDefault();

            value.KategoriAd = kategori.KategoriAd;
            return Ok("Kategori Düzenlendi");
        }

        [HttpDelete("{id}")]
        public IActionResult KategoriDelete(int id)
        {
            var value = kategoriler.Where(x => x.KategoriID == id).FirstOrDefault();

            if(value == null)
            {
                return BadRequest("Kategori bulunamadı");
            }

            kategoriler.Remove(value);
            return Ok("Kategori başarıyla silindi");
            
        }

        private static List<Kategori> kategoriler = new List<Kategori>
        {
            new Kategori { KategoriID = 1, KategoriAd = "Elektronik" },
            new Kategori { KategoriID = 2, KategoriAd = "Giyim" },
            new Kategori { KategoriID = 3, KategoriAd = "Ev Eşyaları" }
        };
    }
}
