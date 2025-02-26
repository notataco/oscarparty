USE [OscarParty]
GO

/*
EXEC User_Check 'alex', 3333
*/

CREATE OR ALTER PROCEDURE User_Check
    @Name VARCHAR(36),
    @PIN INT
AS 
BEGIN

    SELECT DISTINCT
        [u].[UserID],
        [Name],
        [PIN],
        CASE
            WHEN up.UserID IS NOT NULL THEN 1
            ELSE 0
        END AS ExistingEntry
    FROM [dbo].[User] AS u
    LEFT JOIN dbo.Pick AS up ON up.UserID = u.UserID
    WHERE   [Name] = @Name
    AND     [PIN] = @PIN

END
GO