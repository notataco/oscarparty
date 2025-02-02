USE [OscarParty]
GO

/*
EXEC Actor_GetAll
*/

CREATE PROCEDURE Actor_GetAll
AS 
BEGIN

    SELECT 
        [ActorID],
        [MovieID],
        [FirstName],
        [LastName],
        [CharacterName]
    FROM [dbo].[Actor]

END
GO