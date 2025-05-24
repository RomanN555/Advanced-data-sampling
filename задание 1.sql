TRUNCATE TABLE 
    AlbumArtists,
    ArtistGenres,
    CollectionTracks,
    Track,
    Collection,
    Album,
    Artist,
    Genre
RESTART IDENTITY CASCADE;

INSERT INTO Artist (name) VALUES
('The Weeknd'),
('лес'),
('Imagine Dragons'),
('Александ Пистолетов');

UPDATE Artist SET name = 'Les' WHERE id = 2;

INSERT INTO Genre (name) VALUES
('Pop'),
('Rock'),
('R&B');

INSERT INTO Album (title, release_year) VALUES
('After Hours', 2020),
('1989', 2014),
('Evolve', 2017);

UPDATE Album SET artist_id = 1 WHERE title = 'After Hours';
UPDATE Album SET artist_id = 4 WHERE title = '1989';
UPDATE Album SET artist_id = 3 WHERE title = 'Evolve';

INSERT INTO Track (title, duration, album_id) VALUES
('Blinding Lights', '00:03:20', 1),
('Save Your Tears', '00:03:36', 1),
('Style', '00:03:51', 2),
('Blank Space', '00:03:58', 2),
('Believer', '00:03:24', 3),
('Thunder', '00:03:07', 3);

INSERT INTO Collection (title) VALUES
('Top Hits 2020'),
('Greatest Pop'),
('Rock Anthems'),
('Billboard Hot 100');

INSERT INTO CollectionTracks (collection_id, track_id) VALUES
(1, 1), (1, 2), (2, 3), (2, 4), (3, 5), (3, 6),
(4, 1), (4, 3);

INSERT INTO AlbumArtists (album_id, artist_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(1, 4);

INSERT INTO ArtistGenres (artist_id, genre_id) VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 1),
(4, 3);



