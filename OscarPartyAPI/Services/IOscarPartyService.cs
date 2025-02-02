using OscarPartyAPI._models;

namespace OscarPartyAPI.Services
{
    public interface IOscarPartyService
    {
        Task SaveNewUser(User user);
        Task<List<User>> GetAllUsers();

        Task<List<Category>> GetAllCategories();
    }
}
