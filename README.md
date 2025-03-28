# spotify_sql_project

## Overview
This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using **SQL**. It covers an end-to-end process of normalizing a denormalized dataset, performing SQL queries of varying complexity (easy, medium, and advanced), and optimizing query performance. The primary goals of the project are to practice advanced SQL skills and generate valuable insights from the dataset.

```sql
-- create table
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
```
## Project Steps

### 1. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:
- `Artist`: The performer of the track.
- `Track`: The name of the song.
- `Album`: The album to which the track belongs.
- `Album_type`: The type of album (e.g., single or album).
- Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.

### 4. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium**, and **advanced** levels to help progressively develop SQL proficiency.

#### Easy Queries
- Simple data retrieval, filtering, and basic aggregations.
  
#### Medium Queries
- More complex queries involving grouping, aggregation functions, and joins.
  
#### Advanced Queries
- Nested subqueries, window functions, CTEs, and performance optimization.

## 15 Practice Questions

### DATA ANALYSIS AND FINDINGS 

1.**Retrieve the names of all tracks that have more than 1 billion streams.**
   
  ```sql
   SELECT * FROM spotify 
   WHERE stream > 1,0000,00000 ;
   ```

2.**List all albums along with their respective artists.**

  ```sql
  SELECT 
    DISTINCT album, artist 
  FROM spotify 
    ORDER BY 1;

   ```

3.** Get the total number of comments for tracks where `licensed = TRUE`.**

  ```sql
  SELECT
    SUM(comments) as total_comments
    FROM spotify
  WHERE licensed = 'true' ;

```

4.**Find all tracks that belong to the album type `single`.**

```sql
SELECT * FROM spotify 
WHERE album_type = 'single' ;
```

5.**Count the total number of tracks by each artist.**

```sql
SELECT 
artist , ---1
COUNT(*) as total_no_songs ---2
FROM spotify 
GROUP BY artist 
ORDER BY 2 DESC ;

```

6.**Calculate the average danceability of tracks in each album.**

```sql
SELECT 
album,
avg(danceability) as avg_danceability
FROM spotify 
GROUP BY 1 
ORDER BY 2 DESC ;

```

7.**Find the top 5 tracks with the highest energy values.**

```sql
SELECT 
track,
MAX(energy)
FROM spotify 
GROUP BY 1 
ORDER BY 2 DESC 
LIMIT 5 ;

```

8.**List all tracks along with their views and likes where `official_video = TRUE`.**

```sql
SELECT 
track,
    SUM(views) as total_views,
    SUM(likes) as total_likes,
FROM spotify 
    WHERE official_video = 'true'
GROUP BY 1 
ORDER BY 2 DESC;

```

9.**For each album, calculate the total views of all associated tracks.**

```sql
SELECT 
album,
track,
SUM(views)
FROM spotify 
GROUP BY 1 ,2
ORDER BY 3 DESC;

```

10.**Retrieve the track names that have been streamed on Spotify more than YouTube.**

```sql
SELECT *
(SELECT 
    track,  
    COALESCE(SUM(CASE WHEN most_played_on = 'Youtube' THEN stream ELSE 0 END), 0) AS streamed_on_youtube,  
    COALESCE(SUM(CASE WHEN most_played_on = 'Spotify' THEN stream ELSE 0 END), 0) AS streamed_on_spotify  
FROM spotify  
GROUP BY track
    ) as t1
WHERE streamed_on_spotify > streamed_on_youtube 
AND 
streamed_on_youtube <> 0 ;

```
