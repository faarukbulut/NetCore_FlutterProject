using System.Linq.Expressions;

namespace NetCoreAPI.DAL.Repository
{
    public interface IGenericRepository<T>
    {
        List<T> GetAll();
        T GetById(int id);
        void Add(T t);
        void Update(T t);
        void Delete(T t);
        T GetFirstOrDefault(Expression<Func<T, bool>> filter);
    }
}
