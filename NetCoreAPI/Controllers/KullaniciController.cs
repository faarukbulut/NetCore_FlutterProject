using Microsoft.AspNetCore.Mvc;
using NetCoreAPI.DAL;
using NetCoreAPI.Dtos.KullaniciDtos;
using NetCoreAPI.Models;

namespace NetCoreAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class KullaniciController : ControllerBase
    {
        private readonly IBuildToken _buildToken;

        public KullaniciController(IBuildToken buildToken)
        {
            _buildToken = buildToken;
        }

        [HttpPost]
        public IActionResult Oturum([FromBody] KullaniciLoginDto kullaniciLoginDto)
        {
            var authUser = _kullanici.FirstOrDefault(x => x.KullaniciAdi == kullaniciLoginDto.KullaniciAdi && x.Sifre == kullaniciLoginDto.Sifre);

            if(authUser == null)
            {
                return BadRequest("Kullanıcı adı veya şifre hatalı");
            }

            return Ok(new { Token = _buildToken.GenerateToken(authUser) });
        }



        private static readonly List<Kullanici> _kullanici = new List<Kullanici>
        {
            new Kullanici{KullaniciID = 1, KullaniciAdi="test1", Sifre = "123456", AdSoyad="Faruk Bulut"},
        };


    }
}
