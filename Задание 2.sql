SELECT title, duration
FROM Track
WHERE duration = (SELECT MAX(duration) FROM Track); 

SELECT title, duration
FROM Track
WHERE duration >= INTERVAL '3 minutes 30 seconds';

SELECT title
FROM Collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name
FROM Artist
WHERE name NOT LIKE '% %'; 

SELECT DISTINCT title, id 
FROM Track
WHERE 
    title ILIKE 'my'           
    OR title ILIKE 'my %'      
    OR title ILIKE '% my'      
    OR title ILIKE '% my %'    
    OR title ILIKE '% my'      
    OR title ILIKE 'my %'; 

SELECT DISTINCT title, id 
FROM Track
WHERE 
    title ILIKE 'мой%'    
    OR title ILIKE '%мой'  
    OR title ILIKE '%мой%'  
    OR title ILIKE ' мой'     
    OR title ILIKE 'мой '     
    OR title ILIKE ' мой'; 
