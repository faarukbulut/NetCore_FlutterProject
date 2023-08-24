using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPI.DAL.Entity;
using NetCoreAPI.DAL.Repository;
using NetCoreAPI.Dtos.KategoriDtos;

namespace NetCoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class KategoriController : ControllerBase
    {
        private readonly IGenericRepository<Kategori> _kategoriRepository;

        public KategoriController(IGenericRepository<Kategori> kategoriRepository)
        {
            _kategoriRepository = kategoriRepository;
        }

        [HttpGet]
        public IActionResult KategoriList()
        {
            var values = _kategoriRepository.GetAll().Select(kategori => new KategoriListeDto
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

            var yeniKategori = new Kategori
            {
                KategoriAd = kategoriEkleDto.KategoriAd
            };

            _kategoriRepository.Add(yeniKategori);
            return Ok("Yeni kategori başarıyla eklendi");
        }

        [HttpGet("{id}")]
        public IActionResult KategoriGet(int id)
        {
            var kategori = _kategoriRepository.GetById(id);

            if (kategori == null)
            {
                return NotFound("Kategori mevcut değil");
            }

            var kategoriGetDTO = new KategoriAlDto
            {
                KategoriAd = kategori.KategoriAd
            };

            return Ok(kategoriGetDTO);
        }

        [HttpPut("{id}")]
        public IActionResult KategoriUpdate(int id, [FromBody] KategoriGuncelleDto kategoriGuncelleDto)
        {
            var kategori = _kategoriRepository.GetById(id);

            if (kategori == null)
            {
                return NotFound("Kategori mevcut değil");
            }

            kategori.KategoriAd = kategoriGuncelleDto.KategoriAd;
            _kategoriRepository.Update(kategori);

            return Ok("Kategori Düzenlendi");
        }

        [HttpDelete("{id}")]
        public IActionResult KategoriDelete(int id)
        {
            var kategori = _kategoriRepository.GetById(id);

            if (kategori == null)
            {
                return BadRequest("Kategori bulunamadı");
            }

            _kategoriRepository.Delete(kategori);
            return Ok("Kategori başarıyla silindi");
            
        }

    }
}
