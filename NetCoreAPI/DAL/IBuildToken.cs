using NetCoreAPI.Models;

namespace NetCoreAPI.DAL
{
    public interface IBuildToken
    {
        string GenerateToken(Kullanici authUser);
    }
}
