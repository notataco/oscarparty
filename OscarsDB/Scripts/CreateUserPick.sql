USE [OscarParty]
GO

CREATE TABLE [dbo].[UserPick] (
    [UserPickID] INT IDENTITY(1,1) NOT NULL,
    [CategoryID] INT NOT NULL,
    [UserID] INT NOT NULL,
    [MovieID] INT NULL,
    [ActorID] INT NULL
)