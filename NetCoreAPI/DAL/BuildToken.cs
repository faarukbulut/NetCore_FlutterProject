using Microsoft.IdentityModel.Tokens;
using NetCoreAPI.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace NetCoreAPI.DAL
{
    public class BuildToken
    {
        public string GenerateToken(Kullanici authUser)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.UTF8.GetBytes("alesiaNetCoreFlutter2306");
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Issuer = "https://localhost:7176/",
                Audience = "https://localhost:7176/",
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, authUser.AdSoyad!),
                }),
                Expires = DateTime.UtcNow.AddMonths(6),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);

            return tokenString;
        }
    }
}
