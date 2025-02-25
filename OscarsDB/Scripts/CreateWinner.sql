USE [OscarParty]
GO

CREATE TABLE [dbo].[Winner] (
    [WinnerID] INT IDENTITY(1,1) NOT NULL,
    [CategoryID] INT NOT NULL,
    [WinningMovieID] INT NOT NULL,
    [ActorID] INT NULL
)