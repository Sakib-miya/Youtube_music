# 🎵 YouTube & Spotify Music Analytics Dashboard (SQL Project)

![Spotify + YouTube](https://user-images.githubusercontent.com/123456789/205010101-spotify-youtube-banner.png)

## 🔍 Project Title: **"Melody Metrics: Analyzing the Pulse of Music Platforms"**

---

## 📌 Project Objective

This project is built to **explore streaming music trends** using real-world data from **Spotify and YouTube**, answering practical questions like:
- Which artists dominate streaming platforms?
- What genres are most popular?
- What tracks are hidden gems?
- How do official videos impact performance?
- What makes a viral hit?

It's a **portfolio-grade SQL project** designed for recruiters and showcases **advanced querying**, **window functions**, and **analytical thinking**.

---

## 🗂 Dataset Overview

The dataset contains metadata for **music tracks** across platforms, including:

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
| `Stream`         | Spotify streams                            |
| `official_video` | Whether it’s an official music video       |
| `Release_Date`   | Date of release                            |
| `Duration_ms`    | Track length in milliseconds               |
| `Tempo`          | Beats per minute                           |
| `Language`       | Song language                              |
| `Danceability`   | Dance score (0-1)                           |
| `Energy`         | Energy score (0-1)                         |
| `Country`        | Primary market or release location         |

---

## 🧠 Key Insights From SQL Queries

✅ Top 10 streamed songs on Spotify  
✅ Most viewed artists on YouTube  
✅ Popular genres by stream average  
✅ Tracks with highest energy per genre  
✅ Viral trends post-2020  
✅ Underrated songs (high likes, low views)  
✅ Cumulative streaming trends by genre  
✅ Custom popularity score = `Stream * 0.5 + Views * 0.3 + Likes * 0.1 + Comments * 0.1`

You’ll also find queries using:
- **`RANK()` window functions**
- **Subqueries and CTEs**
- **Time-based aggregation**
- **Outlier detection**

---

## 💻 How to Use

1. Import the CSV into your MySQL Workbench:
   ```sql
   LOAD DATA INFILE 'path_to/youtube_music_analytics.csv'
   INTO TABLE youtube_music_analytics
   FIELDS TERMINATED BY ','
   ENCLOSED BY '\"'
   LINES TERMINATED BY '\\n'
   IGNORE 1 ROWS;
