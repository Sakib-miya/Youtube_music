# 🎬 YouTube Music Analytics with SQL

<img src="https://i.imgur.com/mSvUB6Z.png" alt="YouTube Music Banner" width="100%" />

## 📌 Project Title: **"SoundScope: Analyzing YouTube Music Trends with SQL"**

---

## 🎯 Project Objective

This project dives deep into **YouTube music trends** using real-world-style data. The goal is to extract insights about:

- Which songs and artists dominate YouTube
- What genres and tempos perform best
- Which hidden gems are most underrated
- How video type and country affect popularity

The project is crafted to **demonstrate your SQL and data storytelling skills to recruiters**.

---

## 🗂 Dataset Summary

The dataset is stored in a table named `youtube_music_analytics` and includes:

| Column Name     | Description                                |
|------------------|--------------------------------------------|
| `Track`          | Name of the song                           |
| `Artist`         | Performing artist                          |
| `Genre`          | Music genre                                |
| `Album_Type`     | Single, album, EP, etc.                    |
| `Label`          | Music label                                |
| `Views`          | YouTube views                              |
| `Likes`          | YouTube likes                              |
| `Comments`       | YouTube comments                           |
| `official_video` | Whether it's an official music video       |
| `Release_Date`   | Date of release                            |
| `Duration_ms`    | Track length in milliseconds               |
| `Tempo`          | Beats per minute                           |
| `Language`       | Song language                              |
| `Danceability`   | Dance score (0–1)                           |
| `Energy`         | Energy score (0–1)                         |
| `Country`        | Country of popularity                      |

---

## 🧠 Key SQL Use Cases

✅ Top 10 most-streamed tracks  
✅ Most-viewed artists  
✅ Genre-wise performance  
✅ Official video vs. user-uploaded  
✅ Viral post-2020 hits  
✅ High-energy vs. high-danceability tracks  
✅ Ranking using window functions  
✅ Tempo & duration analysis  
✅ Cumulative and average metrics over time  
✅ Custom "popularity index" formula

---

## 🧪 Sample Query

```sql
-- Find the most viewed tracks per country
SELECT Country, Track, Artist, Views
FROM (
  SELECT *, RANK() OVER (PARTITION BY Country ORDER BY Views DESC) AS rnk
  FROM youtube_music_analytics
) ranked
WHERE rnk = 1;
