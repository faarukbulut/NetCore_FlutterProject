using Microsoft.AspNetCore.Mvc;
using NetCoreAPI.BL;
using NetCoreAPI.DAL.Entity;
using NetCoreAPI.DAL.Repository;
using NetCoreAPI.Dtos.KullaniciDtos;

namespace NetCoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KullaniciController : ControllerBase
    {
        private readonly IBuildToken _buildToken;
        private readonly IGenericRepository<Kullanici> _kullaniciRepository;

        public KullaniciController(IBuildToken buildToken, IGenericRepository<Kullanici> kullaniciRepository)
        {
            _buildToken = buildToken;
            _kullaniciRepository = kullaniciRepository;
        }

        [HttpPost]
        public IActionResult Oturum([FromBody] KullaniciLoginDto kullaniciLoginDto)
        {
            var authUser = _kullaniciRepository.GetFirstOrDefault(x => x.KullaniciAdi == kullaniciLoginDto.KullaniciAdi && x.Sifre == kullaniciLoginDto.Sifre);

            if (authUser == null)
            {
                return BadRequest("Kullanıcı adı veya şifre hatalı");
            }

            return Ok(new { Token = _buildToken.GenerateToken(authUser) });
        }
    }
}
