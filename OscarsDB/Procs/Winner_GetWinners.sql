USE [OscarParty]
GO

/*
EXEC Winner_GetWinners
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