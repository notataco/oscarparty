namespace OscarPartyAPI._models
{
    public class Category
    {
        public int CategoryID { get; set; }
        public string Name { get; set; } = "";
        public List<Movie> Movies { get; set; } = new List<Movie>();
        public List<Actor> Actors { get; set; } = new List<Actor>();
        public bool MoviePrimary { get; set; }
        public bool MovieSecondary { get; set; }
        public bool ActorPrimary { get; set; }
        public bool ActorSecondary { get; set; }
        public bool SongPrimary { get; set; }
        public bool SongSecondary { get; set; }
        public bool CountryPrimary { get; set; }
        public bool CountrySecondary { get; set; }
    }
}
