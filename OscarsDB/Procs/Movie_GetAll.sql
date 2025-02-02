USE [OscarParty]
GO

/*
EXEC Movie_GetAll
*/

CREATE PROCEDURE Movie_GetAll
AS 
BEGIN

    SELECT 
        [UserID],
        [Name],
        [PIN]
    FROM [dbo].[User]

END
GO