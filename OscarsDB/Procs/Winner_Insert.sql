USE [OscarParty]
GO

/* EXEC Winner_Insert 1, 1; */

CREATE OR ALTER PROCEDURE Winner_Insert
    @WinnerTable UserPicks READONLY
AS 
BEGIN

    MERGE INTO [dbo].[Winner] AS target
    USING @WinnerTable AS source
    ON target.CategoryID = source.CategoryID
    WHEN MATCHED THEN 
        -- Update existing records
        UPDATE SET 
            target.WinningMovieID = source.MovieID,
            target.ActorID = source.ActorID
    WHEN NOT MATCHED THEN 
        -- Insert new records
        INSERT (CategoryID, WinningMovieID, ActorID)
        VALUES (source.CategoryID, source.MovieID, source.ActorID);

    UPDATE [dbo].[Pick] 
        SET IsCorrect = 1
    FROM dbo.Pick AS P 
    JOIN dbo.Winner AS W ON W.CategoryID = P.CategoryID
    WHERE W.WinningMovieID = P.MovieID;

END
GO

