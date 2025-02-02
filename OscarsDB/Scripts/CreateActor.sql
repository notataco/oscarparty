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
    (1, 'Adrien', 'Brody', 'László Tóth'),
    (2, 'Timothée', 'Chalamet', 'Paul Atreides'),
    (3, 'Colman', 'Domingo', 'Divine G'),
    (4, 'Ralph', 'Fiennes', 'Dean Thomas Lawrence'),
    (5, 'Sebastian', 'Stan', 'Donald Trump'),
    (6, 'Yura', 'Borisov', 'Ivan Zakharov'),
    (7, 'Kieran', 'Culkin', 'Benji Kaplan'),
    (2, 'Edward', 'Norton', 'Pete Seeger'),
    (1, 'Guy', 'Pearce', 'Harrison Lee Van Buren'),
    (5, 'Jeremy', 'Strong', 'Roy Cohn'),
    (8, 'Cynthia', 'Erivo', 'Elphaba'),
    (9, 'Karla Sofía', 'Gascón', 'Emilia Pérez'),
    (6, 'Mikey', 'Madison', 'Anora Mikheeva'),
    (10, 'Demi', 'Moore', 'Elisabeth Sparkle'),
    (11, 'Fernanda', 'Torres', 'Eunice Paiva'),
    (2, 'Monica', 'Barbaro', 'Joan Baez'),
    (8, 'Ariana', 'Grande', 'Glinda'),
    (1, 'Felicity', 'Jones', 'Erzsébet Tóth'),
    (4, 'Isabella', 'Rossellini', 'Sister Agnes'),
    (9, 'Zoe', 'Saldaña', 'Rita Mora Castro')
    -- (1, '', '', 'Lol Crawley'),
    -- (1, '', '', 'Greg Fraser'),
    -- (1, '', '', 'Paul Guilhaume'),
    -- (1, '', '', 'Ed Lachman'),
    -- (1, '', '', 'Jarin Blaschke'),
    -- (1, '', '', 'Sean Baker'),
    -- (1, '', '', 'Brady Corbet'),
    -- (1, '', '', 'James Mangold'),
    -- (1, '', '', 'Jagues Audiard'),
    -- (1, '', '', 'Coralie Fargeat'),
    -- (1, '', '', 'David Jancso'),
    -- (1, '', '', 'Nick Emerson'),
    -- (1, '', '', 'Juliette Welfing'),
    -- (1, '', '', 'Myron Kerstein'),
    -- (1, '', '', 'Daniel Blumberg'),
    -- (1, '', '', 'Volker Bertelmann'),
    -- (1, '', '', 'Clément Ducol and Camille'),
    -- (1, '', '', 'John Powell and Stephen Schwartz'),
    -- (1, '', '', 'Kris Bowers'),
    -- (1, '', '', 'Jesse Eisenberg')


    SELECT * FROM dbo.Actor