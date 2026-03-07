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
	('Marty Supreme', '../../assets/movieposters/marty-supreme.jpg', null),
	('Blue Moon', '../../assets/movieposters/blue-moon.jpg', null),
	('The Secret Agent', '../../assets/movieposters/the-secret-agent.jpg', 'Brazil'),
    ('One Battle After Another', '../../assets/movieposters/one-battle-after-another.jpg', null),
	('Frankenstein', '../../assets/movieposters/frakenstein.jpg', null),
	('Sinners', '../../assets/movieposters/sinners.jpg', null),
	('Sentimental Value', '../../assets/movieposters/sentimental-value.jpg', 'Norway'),
	('Hamnet', '../../assets/movieposters/hamnet.jpg', null),
	('If I Had Legs I''d Kick You', '../../assets/movieposters/if-i-had-legs-id-kick-you.jpg', null),
	('Song Sung Blue', '../../assets/movieposters/song-sung-blue.jpg', null),
	('Bugonia', '../../assets/movieposters/bugonia.jpg', null),
	('Weapons', '../../assets/movieposters/weapons.jpg', null),
	('Arco', '../../assets/movieposters/arco.jpg', null),
	('Elio', '../../assets/movieposters/elio.jpg', null),
	('KPOP Demon Hunters', '../../assets/movieposters/kpop-demon-hunters.webp', null),
	('Little Amélie or the Character of Rain', '../../assets/movieposters/Little-Amélie-or-the-Character-of-Rain.jpg', null),
	('Zootopia 2', '../../assets/movieposters/zootopia-2.jpg', null),
	('Butterfly', '../../assets/movieposters/butterfly.jpg', null),
	('Forevergreen', '../../assets/movieposters/forevergreen.jpg', null),
	('The Girl Who Cried Pearls', '../../assets/movieposters/the-girl-who-cried-pearls.jpg', null),
	('Retirement Plan', '../../assets/movieposters/retirement-plan.jpg', null),
	('The Three Sisters', '../../assets/movieposters/the-three-sisters.jpg', null),
	('Train Dreams', '../../assets/movieposters/train-dreams.jpg', null),
	('Avatar: Fire and Ash', '../../assets/movieposters/avatar-fire-and-ash.jpg', null),
	('The Alabama Solution', '../../assets/movieposters/the-alabama-solution.jpg', null),
	('Come See Me in the Good Light', '../../assets/movieposters/come-see-me-in-the-good-light.jpg', null),
	('Cutting through Rocks', '../../assets/movieposters/cutting-through-rocks.jpg', null),
	('Mr. Nobody against Putin', '../../assets/movieposters/mr-nobody-against-putin.jpg', null),
	('The Perfect Neighbor', '../../assets/movieposters/the-perfect-neighbor.jpg', null),
	('All the Empty Rooms', '../../assets/movieposters/all-the-empty-rooms.jpg', null),
	('Armed Only with a Camera: The Life and Death of Brent Renaud', '../../assets/movieposters/Armed-Only-with-a-Camera-The-Life-and-Death-of-Brent-Renaud.jpg', null),
	('Children No More: "Were and Are Gone"', '../../assets/movieposters/Children-No-More-Were-and-Are-Gone.jpg', null),
	('The Devil Is Busy', '../../assets/movieposters/the-devil-is-busy.jpg', null),
	('Perfectly a Strangeness', '../../assets/movieposters/Perfectly-a-strangeness.jpg', null),
	('F1', '../../assets/movieposters/f1.jpg', null),
	('It Was Just an Accident', '../../assets/movieposters/It-Was-Just-an-Accident.jpg', 'France'),
	('Sirāt', '../../assets/movieposters/sirat.jpg', 'Spain'),
	('The Voice of Hind Rajab', '../../assets/movieposters/The-Voice-of-Hind-Rajab.jpg', 'Tunisia'),
	('Butcher''s Stain', '../../assets/movieposters/butchers-stain.jpg', null),
	('A Friend of Dorothy', '../../assets/movieposters/a-friend-of-dorothy.jpg', null),
	('Jane Austen''s Period Drama', '../../assets/movieposters/Jane-Austens-Period-Drama.jpg', null),
	('The Singers', '../../assets/movieposters/the-singers.jpg', null),
	('Two People Exchanging Saliva', '../../assets/movieposters/two-people-exchanging-saliva.jpg', null),
	('Kokuho', '../../assets/movieposters/kokuho.jpg', null),
	('The Smashing Machine', '../../assets/movieposters/the-smashing-machine.jpg', null),
	('The Ugly Stepsister', '../../assets/movieposters/the-ugly-stepsister.jpg', null),
	('Diane Warren: Relentless', '../../assets/movieposters/diane-warren-relentless.jpg', null),
	('Viva Verdi!', '../../assets/movieposters/viva-verdi.jpg', null),
	('Jurassic World Rebirth', '../../assets/movieposters/jurassic-world-rebirth.jpg', null),
	('The Lost Bus', '../../assets/movieposters/the-lost-bus.jpg', null),
	('One Battle After Another', '../../assets/movieposters/one-battle-after-another.jpg', null),
	('Sentimental Value', '../../assets/movieposters/sentimental-value.jpg', 'Norway');

SELECT * FROM dbo.Movie