USE [OscarParty]
GO

/*
EXEC Pick_Insert 
*/

CREATE OR ALTER PROCEDURE Pick_GetByUserID
    @UserID INT
AS 
BEGIN

    SELECT
        CategoryID,
        MovieID,
        ActorID
    FROM [dbo].[UserPick]
    WHERE UserID = @UserID

END
GO