using NetCoreAPI.Models;

namespace NetCoreAPI.BL
{
    public interface IBuildToken
    {
        string GenerateToken(Kullanici authUser);
    }
}
