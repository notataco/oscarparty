USE [OscarParty]
GO

/*
EXEC Pick_Insert 
*/

CREATE OR ALTER PROCEDURE Pick_Insert
    @PickTable UserPicks READONLY
AS 
BEGIN

    INSERT INTO [dbo].[Pick] (
        [UserID],
        [CategoryID],
        [MovieID],
        [ActorID]
    )
    SELECT
        UserID,
        CategoryID,
        MovieID,
        ActorID
    FROM @PickTable

END
GO