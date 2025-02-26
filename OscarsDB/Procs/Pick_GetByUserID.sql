USE [OscarParty]
GO

/*
EXEC Pick_GetByUserID 1
*/

CREATE OR ALTER PROCEDURE Pick_GetByUserID
    @UserID INT
AS 
BEGIN

    SELECT
        CategoryID,
        MovieID,
        ActorID
    FROM [dbo].[Pick]
    WHERE UserID = @UserID

END
GO