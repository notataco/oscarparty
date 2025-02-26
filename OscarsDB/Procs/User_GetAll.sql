USE [OscarParty]
GO

/*
EXEC User_GetAll
*/

CREATE OR ALTER PROCEDURE User_GetAll
AS 
BEGIN

    SELECT 
        [UserID],
        [Name],
        [PIN]
    FROM [dbo].[User]

END
GO