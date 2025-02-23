USE [OscarParty]
GO

/* EXEC Winner_Insert 1, 1; */

CREATE OR ALTER PROCEDURE Winner_Insert
    @CategoryID INT,
    @MovieID INT 
AS 
BEGIN

    INSERT INTO [dbo].[Winner] (
        [CategoryID],
        [WinningMovieID]
    )
    VALUES
    (
        @CategoryID,
        @MovieID
    );

    UPDATE [dbo].[Pick] 
        SET IsCorrect = 1
    FROM dbo.Pick AS P 
    JOIN dbo.Winner AS W ON W.CategoryID = P.CategoryID
    WHERE W.WinningMovieID = P.MovieID;

END
GO