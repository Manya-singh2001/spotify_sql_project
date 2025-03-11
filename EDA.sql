-- CREATE A TABLE 

DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);

-- 15 Practice Questions

-- Easy Level
--1. Retrieve the names of all tracks that have more than 1 billion streams.
--2. List all albums along with their respective artists.
--3. Get the total number of comments for tracks where `licensed = TRUE`.
--4. Find all tracks that belong to the album type `single`.
--5. Count the total number of tracks by each artist.

-- Medium Level
--1. Calculate the average danceability of tracks in each album.
--2. Find the top 5 tracks with the highest energy values.
--3. List all tracks along with their views and likes where `official_video = TRUE`.
--4. For each album, calculate the total views of all associated tracks.
--5. Retrieve the track names that have been streamed on Spotify more than YouTube.

-- Advanced Level
--1. Find the top 3 most-viewed tracks for each artist using window functions.
--2. Write a query to find tracks where the liveness score is above the average.
--3. **Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.**
--5. Find tracks where the energy-to-liveness ratio is greater than 1.2.
--6. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.


-- EDA 

SELECT COUNT(*) FROM spotify ;
SELECT COUNT(DISTINCT artist ) FROM spotify ;
SELECT DISTINCT album_type FROM spotify ;

SELECT MAX(duration_min) FROM spotify;
SELECT MIN(duration_min) FROM spotify;

SELECT * FROM spotify 
WHERE duration_min = 0 ;

DELETE FROM spotify 
WHERE duration_min = 0 ;
SELECT DISTINCT channel FROM spotify ;

-----------------------------------------------------
-- DATA ANALYSIS EASY CATEGORY 
-----------------------------------------------------

-- Easy Level
--1. Retrieve the names of all tracks that have more than 1 billion streams.

SELECT * FROM spotify 
WHERE stream > 1,0000,00000 ;

--2. List all albums along with their respective artists.

SELECT 
    DISTINCT album, artist 
FROM spotify 
    ORDER BY 1;

--3. Get the total number of comments for tracks where `licensed = TRUE`.

SELECT
    SUM(comments) as total_comments
    FROM spotify
WHERE licensed = 'true' ;

--4. Find all tracks that belong to the album type `single`.

SELECT * FROM spotify 
WHERE album_type = 'single' ;

--5. Count the total number of tracks by each artist.

SELECT 
artist , ---1
COUNT(*) as total_no_songs ---2
FROM spotify 
GROUP BY artist 
ORDER BY 2 DESC ;




















