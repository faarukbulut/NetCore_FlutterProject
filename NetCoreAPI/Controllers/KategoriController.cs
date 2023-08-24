using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPI.Dtos.KategoriDtos;
using NetCoreAPI.Models;

namespace NetCoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class KategoriController : ControllerBase
    {
        [HttpGet]
        public IActionResult KategoriList()
        {
            var values = kategoriler.Select(kategori => new KategoriListeDto
            {
                KategoriID = kategori.KategoriID,
                KategoriAd = kategori.KategoriAd
            }).ToList();

            return Ok(values);
        }

        [HttpPost]
        public IActionResult KategoriAdd([FromBody] KategoriEkleDto kategoriEkleDto)
        {
            if (kategoriEkleDto == null)
            {
                return BadRequest("Kategori boş");
            }

            int kategoriID = kategoriler.Max(x => x.KategoriID) + 1;

            var yeniKategori = new Kategori
            {
                KategoriID = kategoriEkleDto.KategoriID,
                KategoriAd = kategoriEkleDto.KategoriAd
            };

            kategoriler.Add(yeniKategori);
            return Ok("Yeni kategori başarıyla eklendi");
        }

        [HttpGet("{id}")]
        public IActionResult KategoriGet(int id)
        {
            var kategori = kategoriler.FirstOrDefault(x => x.KategoriID == id);

            if (kategori == null)
            {
                return NotFound("Kategori mevcut değil");
            }

            var kategoriGetDTO = new KategoriAlDto
            {
                KategoriID = kategori.KategoriID,
                KategoriAd = kategori.KategoriAd
            };

            return Ok(kategoriGetDTO);
        }

        [HttpPut("{id}")]
        public IActionResult KategoriUpdate(int id, [FromBody] KategoriGuncelleDto kategoriGuncelleDto)
        {
            var kategori = kategoriler.FirstOrDefault(x => x.KategoriID == id);

            if (kategori == null)
            {
                return NotFound("Kategori mevcut değil");
            }

            kategori.KategoriID = kategoriGuncelleDto.KategoriID;
            kategori.KategoriAd = kategoriGuncelleDto.KategoriAd;

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
