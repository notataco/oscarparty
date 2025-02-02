USE [OscarParty]
GO

CREATE TABLE [dbo].[Pick] (
    [PickID] INT IDENTITY(1,1) NOT NULL,
    [UserID] INT NOT NULL,
    [CategoryID] INT NOT NULL,
    [MovieID] INT NULL,
    [ActorID] INT NULL
)
