USE [OscarParty]
GO

CREATE TABLE [dbo].[Song] (
    [SongID] INT IDENTITY(1,1) NOT NULL,
    [SongName] VARCHAR(64) NOT NULL,
    [MovieID] INT NOT NULL
)

INSERT INTO [dbo].[Song] (
    SongName,
    MovieID
) VALUES
    ('Dear Me', 47),
    ('Golden', 15),
    ('I Lied To You', 6),
    ('Sweet Dreams Of Joy', 48),
    ('Train Dreams', 23)

SELECT * FROM dbo.Song