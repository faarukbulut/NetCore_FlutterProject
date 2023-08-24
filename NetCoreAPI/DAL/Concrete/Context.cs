using Microsoft.EntityFrameworkCore;
using NetCoreAPI.DAL.Entity;

namespace NetCoreAPI.DAL.Concrete
{
    public class Context : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("server=FARUK\\SQLEXPRESS;database=NETCoreFlutter;integrated security=true;Encrypt=False");
        }

        public DbSet<Kullanici> Kullanicis { get; set; }

        public DbSet<Kategori> Kategoris { get; set; }

    }
}
