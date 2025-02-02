USE [OscarParty]
GO

/*
EXEC Category_GetAll
*/

CREATE PROCEDURE Category_GetAll
AS 
BEGIN

    INSERT INTO [dbo].[User] (
        [Name],
        [PIN]
    ) VALUES (
        @Name,
        @PIN
    )

END
GO