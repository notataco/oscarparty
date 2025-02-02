USE [OscarParty]
GO

/*
SELECT * FROM dbo.Category
*/

CREATE TABLE [dbo].[Category] (
    [CategoryID] INT IDENTITY(1,1) NOT NULL,
    [Name] VARCHAR(64) NOT NULL,
    [MoviePrimary] BIT NOT NULL,
    [MovieSecondary] BIT NOT NULL,
    [ActorPrimary] BIT NOT NULL,
    [ActorSecondary] BIT NOT NULL,
    [SongPrimary] BIT NOT NULL,
    [SongSecondary] BIT NOT NULL,
    [CountryPrimary] BIT NOT NULL,
    [CountrySecondary] BIT NOT NULL,
)

INSERT INTO dbo.Category (
    [Name],
    [MoviePrimary],
    [MovieSecondary],
    [ActorPrimary],
    [ActorSecondary],
    [SongPrimary],
    [SongSecondary],
    [CountryPrimary],
    [CountrySecondary]
) VALUES
    ('actor in a leading role', 0, 1, 1, 0, 0, 0, 0, 0),
    ('actor in a supporting role', 0, 1, 1, 0, 0, 0, 0, 0),
    ('actress in a leading role', 0, 1, 1, 0, 0, 0, 0, 0),
    ('actress in a supporting role', 0, 1, 1, 0, 0, 0, 0, 0),
    ('animated feature film', 1, 0, 0, 0, 0, 0, 0, 0),
    ('animated short film', 1, 0, 0, 0, 0, 0, 0, 0),
    ('cinematography', 1, 0, 0, 0, 0, 0, 0, 0),
    ('costume design', 1, 0, 0, 0, 0, 0, 0, 0),
    ('directing', 1, 0, 0, 1, 0, 0, 0, 0),
    ('documentary feature film', 1, 0, 0, 0, 0, 0, 0, 0),
    ('documentary short film', 1, 0, 0, 0, 0, 0, 0, 0),
    ('film editing', 1, 0, 0, 1, 0, 0, 0, 0),
    ('international feature film', 0, 1, 0, 0, 0, 0, 1, 0),
    ('makeup and hairstyling', 1, 0, 0, 0, 0, 0, 0, 0),
    ('music (original score)', 1, 0, 0, 1, 0, 0, 0, 0),
    ('music (original song)', 0, 1, 0, 0, 1, 0, 0, 0),
    ('best picture', 1, 0, 0, 0, 0, 0, 0, 0),
    ('production design', 1, 0, 0, 0, 0, 0, 0, 0),
    ('live action short film', 1, 0, 0, 0, 0, 0, 0, 0),
    ('sound', 1, 0, 0, 0, 0, 0, 0, 0),
    ('visual effects', 1, 0, 0, 0, 0, 0, 0, 0),
    ('writing (adapted screenplay)', 1, 0, 0, 0, 0, 0, 0, 0),
    ('writing (original screenplay)', 1, 0, 0, 0, 0, 0, 0, 0)

SELECT * FROM dbo.Category