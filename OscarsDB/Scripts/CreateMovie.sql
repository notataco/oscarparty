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
	('Marty Supreme', '../../movieposters/marty-supreme.jpg', null),
	('Blue Moon', '../../movieposters/blue-moon.jpg', null),
	('The Secret Agent', '../../movieposters/the-secret-agent.jpg', 'Brazil'),
    ('One Battle After Another', '../../movieposters/one-battle-after-another.jpg', null),
	('Frankenstein', '../../movieposters/frakenstein.jpg', null),
	('Sinners', '../../movieposters/sinners.jpg', null),
	('Sentimental Value', '../../movieposters/sentimental-value.jpg', 'Norway'),
	('Hamnet', '../../movieposters/hamnet.jpg', null),
	('If I Had Legs I''d Kick You', '../../movieposters/if-i-had-legs-id-kick-you.jpg', null),
	('Song Sung Blue', '../../movieposters/song-sung-blue.jpg', null),
	('Bugonia', '../../movieposters/bugonia.jpg', null),
	('Weapons', '../../movieposters/blue-moon.jpg', null),
	('Arco', '../../movieposters/weapons.jpg', null),
	('Elio', '../../movieposters/elio.jpg', null),
	('KPOP Demon Hunters', '../../movieposters/kpop-demon-hunters.webp', null),
	('Little Amélie or the Character of Rain', '../../movieposters/Little-Amélie-or-the-Character-of-Rain.jpg', null),
	('Zootopia 2', '../../movieposters/zootopia-2.jpg', null),
	('Butterfly', '../../movieposters/butterfly.jpg', null),
	('Forevergreen', '../../movieposters/forevergreen.jpg', null),
	('The Girl Who Cried Pearls', '../../movieposters/the-girl-who-cried-pearls.jpg', null),
	('Retirement Plan', '../../movieposters/retirement-plan.jpg', null),
	('The Three Sisters', '../../movieposters/the-three-sisters.jpg', null),
	('Train Dreams', '../../movieposters/train-dreams.jpg', null),
	('Avatar: Fire and Ash', '../../movieposters/avatar-fire-and-ash.jpg', null),
	('The Alabama Solution', '../../movieposters/the-alabama-solution.jpg', null),
	('Come See Me in the Good Light', '../../movieposters/come-see-me-in-the-good-light.jpg', null),
	('Cutting through Rocks', '../../movieposters/cutting-through-rocks.jpg', null),
	('Mr. Nobody against Putin', '../../movieposters/mr-nobody-against-putin.jpg', null),
	('The Perfect Neighbor', '../../movieposters/the-perfect-neighbor.jpg', null),
	('All the Empty Rooms', '../../movieposters/all-the-empty-rooms.jpg', null),
	('Armed Only with a Camera: The Life and Death of Brent Renaud', '../../movieposters/Armed-Only-with-a-Camera-The-Life-and-Death-of-Brent-Renaud.jpg', null),
	('Children No More: "Were and Are Gone"', '../../movieposters/Children-No-More-Were-and-Are-Gone.jpg', null),
	('The Devil Is Busy', '../../movieposters/the-devil-is-busy.jpg', null),
	('Perfectly a Strangeness', '../../movieposters/Perfectly-a-strangeness.jpg', null),
	('F1', '../../movieposters/f1.jpg', null),
	('It Was Just an Accident', '../../movieposters/It-Was-Just-an-Accident.jpg', 'France'),
	('Sirāt', '../../movieposters/sirat.jpg', 'Spain'),
	('The Voice of Hind Rajab', '../../movieposters/The-Voice-of-Hind-Rajab.jpg', 'Tunisia'),
	('Butcher''s Stain', '../../movieposters/butchers-stain.jpg', null),
	('A Friend of Dorothy', '../../movieposters/a-friend-of-dorothy.jpg', null),
	('Jane Austen''s Period Drama', '../../movieposters/Jane-Austens-Period-Drama.jpg', null),
	('The Singers', '../../movieposters/the-singers.jpg', null),
	('Two People Exchanging Saliva', '../../movieposters/two-people-exchanging-saliva.jpg', null),
	('Kokuho', '../../movieposters/kokuho.jpg', null),
	('The Smashing Machine', '../../movieposters/the-smashing-machine.jpg', null),
	('The Ugly Stepsister', '../../movieposters/the-ugly-stepsister.jpg', null),
	('Diane Warren: Relentless', '../../movieposters/diane-warren-relentless.jpg', null),
	('Viva Verdi!', '../../movieposters/viva-verdi.jpg', null),
	('Jurassic World Rebirth', '../../movieposters/jurassic-world-rebirth.jpg', null),
	('The Lost Bus', '../../movieposters/the-lost-bus.jpg', null);

SELECT * FROM dbo.Movie