DROP TABLE IF EXISTS ArtistGenres;
DROP TABLE IF EXISTS AlbumArtists;
DROP TABLE IF EXISTS CollectionTracks;
DROP TABLE IF EXISTS Collection;
DROP TABLE IF EXISTS Track;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Genre;
DROP TABLE IF EXISTS Artist;

CREATE TABLE Artist (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Album (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_year INT
);

ALTER TABLE Album
DROP COLUMN artist_id CASCADE;


CREATE TABLE Track (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    duration INTERVAL NOT NULL,
    album_id INT REFERENCES Album(id)
);

CREATE TABLE Collection (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT null
   
);

CREATE TABLE CollectionTracks (
    collection_id INT REFERENCES Collection(id),
    track_id INT REFERENCES Track(id),
    PRIMARY KEY (collection_id, track_id)
);

CREATE TABLE AlbumArtists (
    album_id INT REFERENCES Album(id),
    artist_id INT REFERENCES Artist(id),
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE ArtistGenres (
    artist_id INT REFERENCES Artist(id),
    genre_id INT REFERENCES Genre(id),
    PRIMARY KEY (artist_id, genre_id)
);

ALTER TABLE Collection
	ADD COLUMN release_year INT;

UPDATE Collection
SET release_year = CASE
    WHEN title = 'Top Hits 2020' THEN 2020
    WHEN title = 'Greatest Pop' THEN 2019
    WHEN title = 'Rock Anthems' THEN 2018
    WHEN title = 'Billboard Hot 100' THEN 2020
    ELSE NULL
END;