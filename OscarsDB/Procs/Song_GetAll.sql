USE [OscarParty]
GO

/*
EXEC Song_GetAll
*/

CREATE OR ALTER PROCEDURE Song_GetAll
AS 
BEGIN

    SELECT 
        [SongID],
        [SongName],
        [MovieID]
    FROM [dbo].[Song]

END
GO
