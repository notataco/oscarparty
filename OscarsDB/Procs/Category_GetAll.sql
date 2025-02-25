USE [OscarParty]
GO

/*
EXEC Category_GetAll
*/

CREATE OR ALTER PROCEDURE Category_GetAll
AS 
BEGIN

    SELECT
        [CategoryID],
        [Name],
        [MoviePrimary],
        [MovieSecondary],
        [ActorPrimary],
        [ActorSecondary],
        [SongPrimary],
        [SongSecondary],
        [CountryPrimary],
        [CountrySecondary]
    FROM [dbo].[Category]

END
GO
