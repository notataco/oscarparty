USE [OscarParty]
GO

/*
EXEC User_Check 'Will', 1327
*/

CREATE OR ALTER PROCEDURE Winner_GetWinners

AS 
BEGIN

    SELECT
        [WinnerID],
        [CategoryID],
        [WinningMovieID],
        [ActorID]
    FROM [dbo].[Winner]
    ORDER BY WinnerID DESC

END
GO