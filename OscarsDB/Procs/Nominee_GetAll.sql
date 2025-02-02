USE [OscarParty]
GO

/*
EXEC Nominee_GetAll
*/

CREATE PROCEDURE Nominee_GetAll
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