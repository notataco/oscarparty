using System.Threading.Tasks;
using OscarPartyAPI._models;

namespace OscarPartyAPI.Repositories
{
    public interface IOscarPartyRepository
    {
        Task<User> SaveNewUser(User user);
        Task<User> CheckUser(User user);
        Task<List<User>> GetAllUsers();
        Task<List<Category>> GetAllCategories();
        Task<List<Movie>> GetAllMovies();
        Task<List<Actor>> GetAllActors();
        Task<List<Nominee>> GetAllNominees();
    }
}
