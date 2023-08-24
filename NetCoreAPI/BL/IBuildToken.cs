using NetCoreAPI.DAL.Entity;

namespace NetCoreAPI.BL
{
    public interface IBuildToken
    {
        string GenerateToken(Kullanici authUser);
    }
}
