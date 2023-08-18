using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using NetCoreAPI.DAL;
using NetCoreAPI.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

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
        public IActionResult Oturum([FromBody] Kullanici kullanici)
        {
            var authUser = _kullanici.FirstOrDefault(x => x.KullaniciAdi == kullanici.KullaniciAdi && x.Sifre == kullanici.Sifre);

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
