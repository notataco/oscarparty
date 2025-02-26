USE [OscarParty]
GO

/*
EXEC Nominee_GetAll
*/

CREATE OR ALTER PROCEDURE Nominee_GetAll
AS 
BEGIN

    SELECT 
        [NomineeID],
        [CategoryID],
        [MovieID],
        [ActorID],
        [SongID]
    FROM [dbo].[Nominees]

END
GO