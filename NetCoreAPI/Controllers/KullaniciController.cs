using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPI.Models;

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

            return Ok(new
            {
                kullaniciAdi = authUser.KullaniciAdi,
                adSoyad = authUser.AdSoyad,
            });

        }





        private static readonly List<Kullanici> _kullanici = new List<Kullanici>
        {
            new Kullanici{KullaniciID = 1, KullaniciAdi="test1", Sifre = "123456", AdSoyad="Faruk Bulut"},
        };

    }
}
