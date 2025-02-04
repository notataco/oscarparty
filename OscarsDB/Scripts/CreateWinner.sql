USE [OscarParty]
GO

CREATE TABLE [dbo].[Winner] (
    [WinnerID] INT IDENTITY(1,1) NOT NULL,
    [CategoryID] INT NOT NULL,
    [MovieID] INT NULL,
    [ActorID] INT NULL
)