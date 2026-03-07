USE [OscarParty]
GO

CREATE TABLE [dbo].[Nominees] (
    [NomineeID] INT IDENTITY(1,1) NOT NULL,
    [CategoryID] INT NOT NULL,
    [MovieID] INT NULL,
    [ActorID] INT NULL,
    [SongID] INT NULL
)

INSERT INTO [dbo].[Nominees] (
    CategoryID,
    MovieID,
    ActorID,
    SongID
) VALUES
    (1, 1, 2, null),
    (1, 4, 1, null),
    (1, 2, 3, null),
    (1, 6, 4, null),
    (1, 3, 5, null),
	--
    (2, 4, 6, null),
    (2, 5, 7, null),
    (2, 6, 8, null),
    (2, 51, 9, null),
    (2, 7, 10, null),
	--
    (3, 8, 11, null),
    (3, 9, 12, null),
    (3, 10, 13, null),
    (3, 7, 14, null),
    (3, 11, 15, null),
	--
    (4, 52, 16, null),
    (4, 7, 17, null),
    (4, 12, 18, null),
    (4, 6, 19, null),
    (4, 4, 20, null),
	--
    (5, 13, null, null),
    (5, 14, null, null),
    (5, 15, null, null),
    (5, 16, null, null),
    (5, 17, null, null),
	--
    (6, 18, null, null),
    (6, 19, null, null),
    (6, 20, null, null),
    (6, 21, null, null),
    (6, 22, null, null),
	--
    (7, 5, null, null),
    (7, 1, null, null),
    (7, 4, null, null),
    (7, 6, null, null),
    (7, 23, null, null),
	--
    (8, 24, null, null),
    (8, 5, null, null),
    (8, 8, null, null),
    (8, 1, null, null),
    (8, 6, null, null),
	--
    (9, 8, null, null),
    (9, 1, null, null),
    (9, 4, null, null),
    (9, 7, null, null),
    (9, 6, null, null),
	--
    (10, 25, null, null),
    (10, 26, null, null),
    (10, 27, null, null),
    (10, 28, null, null),
    (10, 29, null, null),
	--
    (11, 30, null, null),
    (11, 31, null, null),
    (11, 32, null, null),
    (11, 33, null, null),
    (11, 34, null, null),
	--
    (12, 35, null, null),
    (12, 1, null, null),
    (12, 4, null, null),
    (12, 7, null, null),
    (12, 6, null, null),
	--
    (13, 3, null, null),
    (13, 36, null, null),
    (13, 7, null, null),
    (13, 37, null, null),
    (13, 38, null, null),
	--
    (14, 5, null, null),
    (14, 44, null, null),
    (14, 6, null, null),
    (14, 45, null, null),
    (14, 46, null, null),
	--
    (15, 11, null, null),
    (15, 5, null, null),
    (15, 8, null, null),
    (15, 4, null, null),
    (15, 6, null, null),
	--
    (16, 47, null, 1),
    (16, 15, null, 2),
    (16, 6, null, 3),
    (16, 48, null, 4),
    (16, 23, null, 5),
	--
    (17, 11, null, null),
    (17, 35, null, null),
    (17, 5, null, null),
    (17, 8, null, null),
    (17, 1, null, null),
    (17, 4, null, null),
    (17, 3, null, null),
    (17, 7, null, null),
    (17, 6, null, null),
    (17, 23, null, null),
	--
    (18, 5, null, null),
    (18, 8, null, null),
    (18, 1, null, null),
    (18, 4, null, null),
    (18, 6, null, null),
	--
    (19, 39, null, null),
    (19, 40, null, null),
    (19, 41, null, null),
    (19, 42, null, null),
    (19, 43, null, null),
	--
    (20, 35, null, null),
    (20, 5, null, null),
    (20, 4, null, null),
    (20, 6, null, null),
    (20, 37, null, null),
	--
    (21, 24, null, null),
    (21, 35, null, null),
    (21, 49, null, null),
    (21, 50, null, null),
    (21, 6, null, null),
	--
    (22, 11, null, null),
    (22, 5, null, null),
    (22, 8, null, null),
    (22, 4, null, null),
    (22, 23, null, null),
	--
    (23, 2, null, null),
    (23, 26, null, null),
    (23, 1, null, null),
    (23, 7, null, null),
    (23, 6, null, null),
	--
	(24, 8, null, null),
    (24, 1, null, null),
    (24, 4, null, null),
    (24, 3, null, null),
    (24, 6, null, null);

SELECT * FROM dbo.Nominees