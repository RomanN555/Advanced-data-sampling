SELECT 
    g.name AS genre_name,
    COUNT(DISTINCT ag.artist_id) AS artist_count
FROM 
    ArtistGenres AS ag
JOIN 
    Genre AS g ON ag.genre_id = g.id
GROUP BY 
    g.name;

SELECT COUNT(*) AS track_count
FROM Track AS t
JOIN Album as a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

SELECT 
    a.title AS album_title,
    AVG(t.duration) AS avg_duration 
FROM 
    Track AS t
JOIN 
    Album AS a ON t.album_id = a.id
GROUP BY 
    a.id, a.title;

SELECT a.name as Artist_name
FROM Artist as a
WHERE a.id not in (
	SELECT artist_id
	FROM Album 
	WHERE release_year = 2020
);

SELECT DISTINCT c.title AS collection_name
FROM Collection c
JOIN CollectionTracks ct ON c.id = ct.collection_id
JOIN Track t ON ct.track_id = t.id
JOIN Album al ON t.album_id = al.id
JOIN Artist a ON al.artist_id = a.id
WHERE a.name = 'The Weeknd';
    
