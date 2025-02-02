USE [OscarParty]
GO

/*
EXEC User_GetAll
*/

CREATE PROCEDURE User_GetAll
AS 
BEGIN

    SELECT 
        [UserID],
        [Name],
        [PIN]
    FROM [dbo].[User]

END
GO