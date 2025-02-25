USE [OscarParty]
GO

/*
EXEC Movie_GetAll
*/

CREATE OR ALTER PROCEDURE Movie_GetAll
AS 
BEGIN

    SELECT 
        MovieID,
        Title,
        Country,
		PosterURL
    FROM dbo.Movie

END
GO