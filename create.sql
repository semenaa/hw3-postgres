CREATE TABLE IF NOT EXISTS genre (
	genre_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	artist_id SERIAL PRIMARY KEY,
	artist_name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS album (
	album_id SERIAL PRIMARY KEY,
	album_name VARCHAR(80) UNIQUE NOT NULL,
	album_year SMALLINT NOT NULL
);

CREATE TABLE IF NOT EXISTS compilation (
	compilation_id SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT NULL,
	compilation_year SMALLINT
);

CREATE TABLE IF NOT EXISTS artist_by_genre (
	id SERIAL PRIMARY KEY,
	genre_id INTEGER NOT NULL REFERENCES genre(genre_id),
	artist_id INTEGER NOT NULL REFERENCES artist(artist_id)
);

CREATE TABLE IF NOT EXISTS album_by_artist (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	artist_id INTEGER NOT NULL REFERENCES artist(artist_id)
);

CREATE TABLE IF NOT EXISTS album_songs (
	song_id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(album_id),
	song_name VARCHAR(80) NOT NULL,
	song_length INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS songs_in_compilations (
	id SERIAL PRIMARY KEY,
	song_id INTEGER NOT NULL REFERENCES album_songs(song_id),
	compilation_id INTEGER NOT NULL REFERENCES compilation(compilation_id)
);