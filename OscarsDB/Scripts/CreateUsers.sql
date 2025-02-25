USE [OscarParty]
GO

CREATE TABLE [dbo].[User] (
    [UserID] INT IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(36) NOT NULL,
    [PIN] INT NOT NULL
)
