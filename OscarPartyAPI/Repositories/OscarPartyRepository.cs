using Microsoft.Data.SqlClient;
using OscarPartyAPI._models;
using System.Data;
using System.Reflection.PortableExecutable;

namespace OscarPartyAPI.Repositories
{
    public class OscarPartyRepository : IOscarPartyRepository
    {
        private readonly string _connectionString;

        CommandType spCommand = System.Data.CommandType.StoredProcedure;

        public OscarPartyRepository(string connectionString) 
        {
            _connectionString = connectionString;
        }

        public async Task<User> SaveNewUser(User user)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("User_Insert", connection))
                {
                    command.CommandType = spCommand;

                    command.Parameters.AddWithValue("Name", user.Name);
                    command.Parameters.AddWithValue("PIN", user.PIN);

                    await command.ExecuteNonQueryAsync();
                }
            }

            return user;
        }

        public async Task<User> CheckUser(User user)
        {                    
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("User_Check", connection))
                {
                    command.CommandType = spCommand;

                    command.Parameters.AddWithValue("Name", user.Name);
                    command.Parameters.AddWithValue("PIN", user.PIN);

                    var reader = await command.ExecuteReaderAsync();

                    if (reader.Read())
                    {
                        var existingUser = new User()
                        {
                            UserID = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            PIN = reader.GetInt32(2)
                        };
                        
                        return existingUser;
                    }
                }
            }

            throw new ArgumentException("No user found");
        }

        public async Task<List<User>> GetAllUsers()
        {
            var users = new List<User>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("User_GetAll", connection))
                {
                    command.CommandType = spCommand;

                    var reader = await command.ExecuteReaderAsync();

                    while (reader.Read()) 
                    {
                        users.Add(new User
                        {
                            UserID = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            PIN = reader.GetInt32(2)
                        });
                    }
                }
            }

            return users;
        }

        public async Task<List<Category>> GetAllCategories()
        {
            var categories = new List<Category>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("Category_GetAll", connection))
                {
                    command.CommandType = spCommand;

                    var reader = await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        categories.Add(new Category 
                        { 
                            CategoryID = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            MoviePrimary = reader.GetBoolean(2),
                            MovieSecondary = reader.GetBoolean(3),
                            ActorPrimary = reader.GetBoolean(4),
                            ActorSecondary = reader.GetBoolean(5),
                            SongPrimary = reader.GetBoolean(6),
                            SongSecondary = reader.GetBoolean(7),
                            CountryPrimary = reader.GetBoolean(8),
                            CountrySecondary = reader.GetBoolean(9)
                        });
                    }
                }
            }

            return categories;
        }

        public async Task<List<Movie>> GetAllMovies()
        {
            var movies = new List<Movie>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("Movie_GetAll", connection))
                {
                    command.CommandType = spCommand;

                    var reader = await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        movies.Add(new Movie
                        {
                            MovieID = reader.GetInt32(0),
                            Title = reader.GetString(1),
                            Country = reader.IsDBNull(2) ? "" : reader.GetString(2),
                            PosterURL = reader.IsDBNull(3) ? "" : reader.GetString(3)
                        });
                    }
                }
            }

            return movies;
        }

        public async Task<List<Actor>> GetAllActors()
        {
            var actors = new List<Actor>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("Actor_GetAll", connection))
                {
                    command.CommandType = spCommand;

                    var reader = await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        actors.Add(new Actor
                        {
                            ActorID = reader.GetInt32(0),
                            MovieID = reader.GetInt32(1),
                            FirstName = reader.GetString(2),
                            LastName = reader.GetString(3),
                            CharacterName = reader.GetString(4)
                        });
                    }
                }
            }

            return actors;
        }

        public async Task<List<Nominee>> GetAllNominees()
        {
            var nominees = new List<Nominee>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("Nominee_GetAll", connection))
                {
                    command.CommandType = spCommand;

                    var reader = await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        nominees.Add(new Nominee
                        {
                            NomineeID = reader.GetInt32(0),
                            CategoryID = reader.GetInt32(1),
                            MovieID = reader.GetInt32(2),
                            ActorID = reader.IsDBNull(3) ? 0 : reader.GetInt32(3)
                        });
                    }
                }
            }

            return nominees;
        }

        public async Task SubmitPicks(List<UserPick> picks)
        {
            DataTable pickTable = new DataTable();
            pickTable.Columns.Add("UserID", typeof(int));
            pickTable.Columns.Add("CategoryID", typeof(int));
            pickTable.Columns.Add("MovieID", typeof(int));
            pickTable.Columns.Add("ActorID", typeof(int));

            foreach (var pick in picks)
            {
                pickTable.Rows.Add(pick.userID, pick.categoryID, pick.movieID, pick.actorID);
            }

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("Pick_Insert", connection))
                {
                    command.CommandType = spCommand;

                    SqlParameter tvpParam = command.Parameters.AddWithValue("@PickTable", pickTable);
                    tvpParam.SqlDbType = SqlDbType.Structured;
                    tvpParam.TypeName = "dbo.UserPicks";

                    await command.ExecuteNonQueryAsync();
                }
            }
        }

        public async Task<List<User>> GetCurrentStandings()
        {
            var userStandings = new List<User>();

            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("User_GetAll", connection))
                {
                    command.CommandType = spCommand;

                    var reader = await command.ExecuteReaderAsync();

                    while (reader.Read())
                    {
                        userStandings.Add(new User
                        {
                            UserID = reader.GetInt32(0),
                            Name = reader.GetString(1),
                            PIN = reader.GetInt32(2)
                        });
                    }
                }

                connection.Close();

                foreach (var user in userStandings)
                {
                    await connection.OpenAsync();

                    using (var command = new SqlCommand("User_GetScore", connection))
                    {
                        command.CommandType = spCommand;

                        var reader = await command.ExecuteReaderAsync();

                        while (reader.Read())
                        {
                            user.CurrentScore = reader.GetInt32("Score");
                        }
                    }

                    connection.Close();
                }
            }

            return userStandings;
        }

        public async Task InsertWinner(Winner winner)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var command = new SqlCommand("Winner_Insert", connection))
                {
                    command.CommandType = spCommand;

                    command.Parameters.AddWithValue("CategoryID", winner.CategoryID);
                    command.Parameters.AddWithValue("MovieID", winner.WinningMovieID);

                    await command.ExecuteNonQueryAsync();
                }
            }
        }
    }
}
