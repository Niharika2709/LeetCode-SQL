# Write your MySQL query statement below
WITH movie_rating AS
(
    SELECT
        u.name,
        COUNT(*) AS cnt
    FROM MovieRating mr
    JOIN Users u
    ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
    ORDER BY cnt DESC, u.name
    LIMIT 1
),

feb_rating AS
(
    SELECT
        m.title,
        AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m
    ON mr.movie_id = m.movie_id
    WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
    GROUP BY m.movie_id, m.title
    ORDER BY avg_rating DESC, m.title
    LIMIT 1
)

SELECT name AS results
FROM movie_rating

UNION ALL

SELECT title
FROM feb_rating;