USE [OscarParty]
GO

/* 
	EXEC User_GetScore 1 
*/

CREATE OR ALTER PROCEDURE User_GetScore
    @UserID INT 
AS 
BEGIN

    SELECT 
        COUNT(*) AS Score
    FROM [dbo].[User] AS U
    JOIN [dbo].[Pick] AS P ON P.UserID = U.UserID
    WHERE U.UserID = @UserID
    AND P.IsCorrect = 1;

END
GO