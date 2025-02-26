USE [OscarParty]
GO

CREATE TABLE [dbo].[Movie] (
    [MovieID] INT IDENTITY(1,1) NOT NULL,
    [Title] VARCHAR(64) NOT NULL,
    [Country] VARCHAR(64) NULL,
    [PosterURL] VARCHAR(128) NOT NULL
)

INSERT INTO [dbo].[Movie] (
    Title,
    PosterURL,
    Country
) VALUES
    ('the brutalist', '../../assets/posters/brutalist.webp', null),
    ('a complete unknown', '../../assets/posters/completeunknown.webp', null),
    ('sing sing', '../../assets/posters/singsing.webp', null),
    ('conclave', '../../assets/posters/conclave.webp', null),
    ('the apprentice', '../../assets/posters/apprentice.webp', null),
    ('anora', '../../assets/posters/anora.webp', null),
    ('a real pain', '../../assets/posters/arealpain.webp', null),
    ('wicked', '../../assets/posters/wicked.webp', null),
    ('emilia pérez', '../../assets/posters/perez.webp', 'france'),
    ('the substance', '../../assets/posters/substance.webp', null),
    ('i''m still here', '../../assets/posters/stillhere.webp', 'brazil'),
    ('flow', '../../assets/posters/flow.webp', 'latvia'),
    ('inside out 2', '../../assets/posters/insideout.webp', null),
    ('memoir of a snail', '../../assets/posters/memoirofasnail.webp', null),
    ('wallace & gromit: vengeance most fowl', '../../assets/posters/wallace.webp', null),
    ('the wild robot', '../../assets/posters/wildrobot.webp', null),
    ('beautiful men', '../../assets/posters/beautifulmen.jpg', null),
    ('in the shadows of the cypress', '../../assets/posters/cypress.jpeg', null),
    ('magic candies', '../../assets/posters/candies.webp', null),
    ('wander to wonder', '../../assets/posters/wonder.jpg', null),
    ('yuck!', '../../assets/posters/yuck.jpg', null),
    ('dune: part two', '../../assets/posters/dune.webp', null),
    ('maria', '../../assets/posters/maria.webp', null),
    ('nosferatu', '../../assets/posters/nosferatu.webp', null),
    ('gladiator II', '../../assets/posters/gladiator.webp', null),
    ('black box diaries', '../../assets/posters/blackbox.webp', null),
    ('no other land', '../../assets/posters/nootherland.jpg', null),
    ('porcelain war', '../../assets/posters/porcelain.jpg', null),
    ('soundtrack to a coup d''etat', '../../assets/posters/soundtrack.jpg', null),
    ('sugarcane', '../../assets/posters/sugarcane.jpg', null),
    ('death by number', '../../assets/posters/death.jpg', null),
    ('i am ready, warden', '../../assets/posters/warden.jpg', null), -- missing poster
    ('incident', '../../assets/posters/incident.jpg', null), -- missing poster
    ('instruments of a beating heart', '../../assets/posters/instrument.jpg', null),
    ('the only girl in the orchestra', '../../assets/posters/orchestra.jpg', null),
    ('the girl with the needle', '../../assets/posters/needle.jpg', 'denmark'),
    ('the seed of the sacred fig', '../../assets/posters/sacredfig.jpg', 'germany'),
    ('a different man', '../../assets/posters/differentman.webp', null),
    ('the six triple eight', '../../assets/posters/6888.webp', null),
    ('elton john: never too late', '../../assets/posters/eltonjohn.jpeg', null),
    ('nickel boys', '../../assets/posters/nickelboys.webp', null),
    ('a lien', '../../assets/posters/a_lien.jpg', null), -- missing poster
    ('anuja', '../../assets/posters/anuja.jpg', null),
    ('i''m not a robot', '../../assets/posters/notarobot.jpg', null),
    ('the last ranger', '../../assets/posters/lastranger.jpg', null),
    ('the man who could not remain silent', '../../assets/posters/remainsilent.jpg', null),
    ('alien: romulus', '../../assets/posters/romulus.webp', null),
    ('better man', '../../assets/posters/betterman.webp', null),
    ('kingdom of the planet of the apes', '../../assets/posters/kingdomofapes.webp', null),
    ('september 5', '../../assets/posters/september5.jpg', null),
    -- yes, this is stupid, but unfortunately is needed for song category
    ('emilia pérez', '../../assets/posters/perez.webp', 'france')

SELECT * FROM dbo.Movie