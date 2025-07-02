create database youtube_music;
use youtube_music;
select * from youtube_music_analytics;
-- 📌 Query 1: Top 10 most streamed tracks
-- Shows the most streamed tracks on Spotify to identify listener favorites
SELECT Track, Artist, Stream
FROM youtube_music_analytics
ORDER BY Stream DESC
LIMIT 10;

-- 📌 Query 2: Top 5 artists by total YouTube views
-- Helps identify which artists are most watched on YouTube
SELECT Artist, SUM(Views) AS total_views
FROM youtube_music_analytics
GROUP BY Artist
ORDER BY total_views DESC
LIMIT 5;

-- 📌 Query 3: Most popular genre by average streams
-- Determines the genre that performs best on average
SELECT Genre, ROUND(AVG(Stream)) AS avg_streams
FROM youtube_music_analytics
GROUP BY Genre
ORDER BY avg_streams DESC;

-- 📌 Query 4: Track with highest energy per genre
-- Uses window function to rank energy levels per genre
SELECT Genre, Track, Energy
FROM (
  SELECT *, RANK() OVER (PARTITION BY Genre ORDER BY Energy DESC) AS rnk
  FROM youtube_music_analytics
) AS ranked
WHERE rnk = 1;

-- 📌 Query 5: Monthly average streams per album
-- Analyzes stream performance over time
SELECT DATE_FORMAT(Release_Date, '%Y-%m') AS month, ROUND(AVG(Stream)) AS avg_streams
FROM youtube_music_analytics
GROUP BY month
ORDER BY month;

-- 📌 Query 6: Top 3 tracks by views in each country
-- Highlights the top hits per country
SELECT Country, Track, Artist, Views
FROM (
  SELECT *, RANK() OVER (PARTITION BY Country ORDER BY Views DESC) AS rnk
  FROM youtube_music_analytics
) AS ranked
WHERE rnk <= 3;

-- 📌 Query 7: Track duration stats by genre
-- Compare short vs. long tracks across genres
SELECT Genre,
       ROUND(MIN(Duration_ms)/60000, 2) AS min_minutes,
       ROUND(AVG(Duration_ms)/60000, 2) AS avg_minutes,
       ROUND(MAX(Duration_ms)/60000, 2) AS max_minutes
FROM youtube_music_analytics
GROUP BY Genre;

-- 📌 Query 8: Most streamed track in each language
-- Useful for multilingual content strategy
SELECT Language, Track, Artist, Stream
FROM (
  SELECT *, RANK() OVER (PARTITION BY Language ORDER BY Stream DESC) AS rnk
  FROM youtube_music_analytics
) AS ranked
WHERE rnk = 1;

-- 📌 Query 9: High likes but low views (underrated songs)
-- Finds hidden gems that might go viral
SELECT Track, Artist, Likes, Views
FROM youtube_music_analytics
WHERE Likes > 100000 AND Views < 500000
ORDER BY Likes DESC;

-- 📌 Query 10: Average likes/comments/views by album type
-- Shows how performance varies by album format
SELECT Album_Type,
       ROUND(AVG(Likes)) AS avg_likes,
       ROUND(AVG(Comments)) AS avg_comments,
       ROUND(AVG(Views)) AS avg_views
FROM youtube_music_analytics
GROUP BY Album_Type;

-- 📌 Query 11: Count official videos by genre
-- Indicates which genres have most official content
SELECT Genre, COUNT(*) AS num_official_videos
FROM youtube_music_analytics
WHERE official_video = TRUE
GROUP BY Genre;

-- 📌 Query 12: Tracks with unusual tempo
-- Identifies tempo outliers that may stand out musically
SELECT Track, Artist, Tempo
FROM youtube_music_analytics
WHERE Tempo > 160 OR Tempo < 70;

-- 📌 Query 13: Top 10 tracks by energy-to-danceability ratio
-- Measures hype level of songs
SELECT Track, Artist, ROUND(Energy / Danceability, 2) AS energy_dance_ratio
FROM youtube_music_analytics
WHERE Danceability > 0
ORDER BY energy_dance_ratio DESC
LIMIT 10;

-- 📌 Query 14: Post-2020 tracks with over 100M views
-- Focuses on recent viral hits
SELECT Track, Artist, Release_Date, Views
FROM youtube_music_analytics
WHERE Release_Date >= '2021-01-01' AND Views > 100000000;

-- 📌 Query 15: Top artists by total engagement
-- Calculates artist popularity by combined actions
SELECT Artist, SUM(Likes + Comments + Views) AS total_engagement
FROM youtube_music_analytics
GROUP BY Artist
ORDER BY total_engagement DESC
LIMIT 10;

-- 📌 Query 16: Rank tracks per label by views
-- Great for seeing top-performing songs from each label
SELECT Label, Track, Views
FROM (
  SELECT *, RANK() OVER (PARTITION BY Label ORDER BY Views DESC) AS rnk
  FROM youtube_music_analytics
) AS ranked
WHERE rnk <= 3;

-- 📌 Query 17: Labels with most #1 streamed tracks
-- Counts how many times a label had the top streamed song
SELECT Label, COUNT(*) AS top_tracks
FROM (
  SELECT *, RANK() OVER (PARTITION BY Label ORDER BY Stream DESC) AS rnk
  FROM youtube_music_analytics
) AS ranked
WHERE rnk = 1
GROUP BY Label
ORDER BY top_tracks DESC;

-- 📌 Query 18: Top non-English track by streams
-- Highlights global diversity
SELECT Track, Artist, Language, Stream
FROM youtube_music_analytics
WHERE Language != 'English'
ORDER BY Stream DESC
LIMIT 1;

-- 📌 Query 19: Cumulative stream trend by genre
-- Tracks how streams accumulate over time per genre
SELECT Genre, Release_Date,
       SUM(Stream) OVER (PARTITION BY Genre ORDER BY Release_Date) AS cumulative_streams
FROM youtube_music_analytics;

-- 📌 Query 20: Popularity index (custom metric)
-- Custom formula for ranking overall success
SELECT Track, Artist,
       ROUND(Stream * 0.5 + Views * 0.3 + Likes * 0.1 + Comments * 0.1) AS popularity_index
FROM youtube_music_analytics
ORDER BY popularity_index DESC
LIMIT 10;


