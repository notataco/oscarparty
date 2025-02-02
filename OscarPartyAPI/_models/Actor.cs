namespace OscarPartyAPI._models
{
    public class Actor
    {
        public int ActorID { get; set; }
        public int MovieID { get; set; }
        public string FirstName { get; set; }
        public string? LastName { get; set; }
        public string? CharacterName { get; set; }
    }
}
