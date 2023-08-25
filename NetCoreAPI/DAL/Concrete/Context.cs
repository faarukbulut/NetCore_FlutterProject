using Microsoft.EntityFrameworkCore;
using NetCoreAPI.DAL.Entity;

namespace NetCoreAPI.DAL.Concrete
{
    public class Context : DbContext
    {
        public Context(DbContextOptions<Context> options) : base(options) { }

        public DbSet<Kullanici> Kullanicis { get; set; }

        public DbSet<Kategori> Kategoris { get; set; }

    }
}
