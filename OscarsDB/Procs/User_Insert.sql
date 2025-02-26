USE [OscarParty]
GO


CREATE OR ALTER PROCEDURE User_Insert
    @Name VARCHAR(50),
    @PIN INT
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