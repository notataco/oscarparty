namespace OscarPartyAPI._models
{
    public class User
    {
        public int? UserID { get; set; }
        public string Name { get; set; }
        public int PIN { get; set; }
        public int CurrentScore { get; set; } = 0; 
    }
}
