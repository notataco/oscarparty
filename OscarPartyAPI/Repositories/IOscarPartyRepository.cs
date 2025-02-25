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
        Task SubmitPicks(List<UserPick> picks);
        Task<List<User>> GetCurrentStandings();
        Task InsertWinner(List<Winner> winner);
        Task<List<Winner>> GetWinners();
        Task<List<UserPick>> GetUserPicks(int UserID);
    }
}
