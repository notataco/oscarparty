USE [OscarParty]
GO

CREATE TABLE [dbo].[Actor] (
    [ActorID] INT IDENTITY(1,1) NOT NULL,
    [MovieID] INT NOT NULL,
    [FirstName] VARCHAR(64) NOT NULL,
    [LastName] VARCHAR(64) NULL,
    [CharacterName] VARCHAR(64) NOT NULL,
)

INSERT INTO [dbo].[Actor] (
    [MovieID],
    [FirstName],
    [LastName],
    [CharacterName]
) VALUES 
    (4, 'Leonardo', 'Dicaprio', 'Bob'),
    (1, 'Timothée', 'Chalamet', 'Marty Mauser'),
    (2, 'Ethan', 'Hawk', 'Lorenz Hart'),
    (6, 'Michael B.', 'Jordan', 'Smoke / Stack'),
    (3, 'Wagner', 'Moura', 'Marcelo Alves / Armando Solimões / Fernando Solimões'),
	--
    (4, 'Benicio', 'Del Toro', 'Sensei Sergio St. Carlos'),
    (5, 'Jacob', 'Elordi', 'The Creature'),
    (6, 'Delroy', 'Lindo', 'Delta Slim'),
    (4, 'Sean', 'Penn', 'Col. Steven J. Lockjaw'),
    (7, 'Stellan', 'Skarsgård', 'Gustav Borg'),
	--
    (8, 'Jessie', 'Buckley', 'Agnes'),
    (9, 'Rose', 'Byrne', 'Linda'),
    (10, 'Kate', 'Hudson', 'Claire / Thunder'),
    (7, 'Renate', 'Reinsve', 'Nora Borg'),
    (11, 'Emma', 'Stone', 'Michelle'),
	--
    (7, 'Elle', 'Fanning', 'Rachel Kemp'),
    (7, 'Inga', 'Ibsdotter Lilleaas', 'Agnes Borg Pettersen'),
    (12, 'Amy', 'Madigan', 'Gladys'),
    (6, 'Wunmi', 'Mosaku', 'Annie'),
    (4, 'Teyana', 'Taylor', 'Perfidia');


    SELECT * FROM dbo.Actor