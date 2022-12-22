INSERT INTO artist(artist_name)
VALUES
	('Dio'),
	('Tool'),
	('Metallica'),
	('Sons of Apollo'),
	('Slipknot'),
	('Miles Davis'),
	('Marcus Miller'),
	('Scott Henderson');
	
INSERT INTO genre(genre_name)
VALUES 
	('Heavy metal'),
	('Progressive metal'),
	('Thrash metal'),
	('Sludge metal'),
	('Death metal'),
	('Nu metal'),
	('Contemporary jazz'),
	('R''n''B'),
	('Fusion');
	
INSERT INTO album(album_name, album_year)
VALUES
	('Metallica (Black album)', 1991),
	('Aenima', 1996),
	('MMXX', 2020),
	('We Are Not Your Kind', 2019),
	('Kind of Blue', 1959),
	('Laid Black', 2018),
	('Well to the Bone', 2002),
	('Psychotic Symphony', 2018);
	
INSERT INTO compilation(compilation_name, compilation_year)
VALUES
	('Greatest Hits', 2018),
	('Oldies but Goldies', 2020),
	('Hits of Metal Scene', 2019),
	('Antennas to Hell', 2012),
	('Power - The Essential Marcus Miller', 2006),
	('The Story So Far', 2013),
	('We Rock - Greatest Hits', 2005),
	('Garage Inc.', 1998);
	

INSERT INTO artist_by_genre(artist_id, genre_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 2),
	(5, 5),
	(6, 7),
	(7, 7),
	(7, 8),
	(8, 9);

	
INSERT INTO album_by_artist(album_id, artist_id)
VALUES
	(1, 3),
	(2, 2),
	(3, 4),
	(4, 5),
	(5, 6),
	(6, 7),
	(7, 8),
	(8, 4);

INSERT INTO album_songs(album_id, song_name, song_length)
VALUES
	(1,	'Enter Sandman', 333),
	(1, 'My Friend of Misery', 410),
	(1,	'Sad But True', 325),
	(4, 'Insert Coin', 100),
	(4, 'Spiders', 244),
	(4,	'My Pain', 409),
	(7,	'Well to the Bone', 291),
	(5,	'So What', 565),
	(5,	'Freddie Freeloader', 590),
	(5,	'Blue In Green', 338),
	(2,	'Stinkfist', 312),
	(2, 'Eulogy', 509),
	(2,	'H', 368),
	(2,	'Useful Idiot', 39),
	(3,	'Goodbye Divinity', 433);
	
INSERT INTO songs_in_compilations(song_id, compilation_id)
VALUES
	(8,	2),
	(10, 2),
	(1, 3),
	(3, 3),
	(12, 3),
	(7, 1);