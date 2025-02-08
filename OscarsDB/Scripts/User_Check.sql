USE [OscarParty]
GO

/*
EXEC User_Check 'Will', 1327
*/

CREATE OR ALTER PROCEDURE User_Check
    @Name VARCHAR(36),
    @PIN INT
AS 
BEGIN

    SELECT
        [UserID],
        [Name],
        [PIN]
    FROM [dbo].[User]
    WHERE   [Name] = @Name
    AND     [PIN] = @PIN   

END
GO