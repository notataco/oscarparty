namespace OscarPartyAPI._models
{
    public class User
    {
        private static readonly HashSet<string> _Admins = new() { "WILL", "JAKE", "KEELY" };

        public int? UserID { get; set; }
        public string Name { get; set; }
        public int PIN { get; set; }
        public bool HasEntries { get; set; }
        public bool IsAdmin => _Admins.Contains(Name);
        public int CurrentScore { get; set; } = 0;
    }
}
