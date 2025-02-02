﻿using OscarPartyAPI._models;
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

        public async Task SaveNewUser(User user)
        {
            await _oscarPartyRepository.SaveNewUser(user);
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
    }
}
