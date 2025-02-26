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
    ('el mal', 9),
    ('the journey', 39),
    ('like a bird', 3),
    ('mi camino', 51),
    ('never too late', 40)

SELECT * FROM dbo.Song