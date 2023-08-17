using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
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

        [HttpPost]
        public IActionResult Oturum([FromBody] Kullanici kullanici)
        {
            var authUser = _kullanici.FirstOrDefault(x => x.KullaniciAdi == kullanici.KullaniciAdi && x.Sifre == kullanici.Sifre);

            if(authUser == null)
            {
                return BadRequest("Kullanıcı adı veya şifre hatalı");
            }

            //// JWT TOKEN
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes("alesiaNetCoreFlutter2306");
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Issuer = "https://localhost:7176/",
                Audience = "https://localhost:7176/",
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, authUser.AdSoyad),
                }),
                Expires = DateTime.UtcNow.AddMinutes(15),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);

            return Ok(new { Token = tokenString });
        }



        private static readonly List<Kullanici> _kullanici = new List<Kullanici>
        {
            new Kullanici{KullaniciID = 1, KullaniciAdi="test1", Sifre = "123456", AdSoyad="Faruk Bulut"},
        };

    }
}
