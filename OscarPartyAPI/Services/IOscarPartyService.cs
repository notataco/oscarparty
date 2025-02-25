using OscarPartyAPI._models;

namespace OscarPartyAPI.Services
{
    public interface IOscarPartyService
    {
        Task<User> SaveNewUser(User user);
        Task<User> Login(User user);
        Task<List<User>> GetAllUsers();
        Task<List<Category>> GetAllCategories();
        Task SubmitPicks(List<UserPick> picks);
        Task<List<User>> GetCurrentStandings();
        Task InsertWinner(List<Winner> winner);
        Task<List<Winner>> GetWinners();
        Task<List<UserPick>> GetUserPicks(int userID);
    }
}
