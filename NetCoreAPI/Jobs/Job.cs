using NetCoreAPI.DAL.Concrete;
using NetCoreAPI.DAL.Entity;
using NetCoreAPI.DAL.Repository;

namespace NetCoreAPI.Jobs
{
    public class Job
    {
        private readonly IGenericRepository<Kullanici> _kullaniciRepository;
        private readonly Context _context;

        public Job(IGenericRepository<Kullanici> kullaniciRepository, Context context)
        {
            _kullaniciRepository = kullaniciRepository;
            _context = context;
        }

        public void DbControl()
        {
            var values = _kullaniciRepository.GetAll().Where(x => x.gold == true);

            foreach(var value in values)
            {
                value.goldsure = value.goldsure - 1;

                if (value.goldsure <= 0)
                {
                    value.goldsure = 0;
                    value.gold = false;
                }

            }

            _context.SaveChanges();
        }
    }
}
