USE [OscarParty]
GO

CREATE TYPE UserPicks AS TABLE (
    UserID INT,
    CategoryID INT,
    MovieID INT,
    ActorID INT
);