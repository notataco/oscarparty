using OscarPartyAPI._models;
using OscarPartyAPI.Repositories;

namespace OscarPartyAPI.Services
{
    public class OscarPartyService : IOscarPartyService
    {
        private readonly IOscarPartyRepository _oscarPartyRepository;
        public OscarPartyService(IOscarPartyRepository oscarPartyRepository) 
        {
            _oscarPartyRepository = oscarPartyRepository;
        }

        public async Task<User> SaveNewUser(User user)
        {
            try
            {
                var existingUser = await _oscarPartyRepository.CheckUser(user);

                throw new InvalidOperationException("User already exsists");
            }
            catch (ArgumentException ex) 
            { 
                _ = await _oscarPartyRepository.SaveNewUser(user);

                return await _oscarPartyRepository.CheckUser(user);
            }
        }

        public async Task<User> Login(User user)
        {
            try
            {
                return await _oscarPartyRepository.CheckUser(user);
            }
            catch (Exception ex)
            {
                throw new Exception("User does not exist");
            }
        }

        public async Task<List<User>> GetAllUsers()
        {
            return await _oscarPartyRepository.GetAllUsers();
        }

        public async Task<List<Category>> GetAllCategories()
        {
            var categories = await _oscarPartyRepository.GetAllCategories();
            var movies = await _oscarPartyRepository.GetAllMovies();
            var actors = await _oscarPartyRepository.GetAllActors();
            var nominees = await _oscarPartyRepository.GetAllNominees();

            foreach (var nominee in nominees)
            {
                var category = categories.Where(cat => cat.CategoryID == nominee.CategoryID).FirstOrDefault();

                category.Movies.Add(movies.Where(movie => movie.MovieID == nominee.MovieID).FirstOrDefault());
                category.Actors.Add(actors.Where(actor => actor.ActorID == nominee.ActorID).FirstOrDefault());
            }

            return categories;
        }

        public async Task SubmitPicks(List<UserPick> picks)
        {
            await _oscarPartyRepository.SubmitPicks(picks);
        }

        public async Task<List<User>> GetCurrentStandings()
        {
            var standings = await _oscarPartyRepository.GetCurrentStandings();

            return standings;   
        }

        public async Task InsertWinner(List<Winner> winner)
        {
            await _oscarPartyRepository.InsertWinner(winner);
        }

        public async Task<List<Winner>> GetWinners()
        {
            var winners = await _oscarPartyRepository.GetWinners();

            return winners;
        }

        public async Task<List<UserPick>> GetUserPicks(int userID)
        {
            var picks = await _oscarPartyRepository.GetUserPicks(userID);

            return picks;
        }
    }
}
