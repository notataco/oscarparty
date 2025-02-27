USE [OscarParty]
GO

/*
EXEC User_Check 'Will', 1327
*/

CREATE OR ALTER PROCEDURE Winner_GetAll
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