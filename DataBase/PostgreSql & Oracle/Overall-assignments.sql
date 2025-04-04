select * from movies

select * from movie_revenues

-- 1. Top 3 Grossing Movies Per Release Date (Domestic Revenue)
SELECT
    m.movie_name,
    m.release_date,
    r.revenue_domestic,
    RANK() OVER (
        PARTITION BY m.release_date
        ORDER BY r.revenue_domestic DESC
    ) AS rank_on_date
FROM
    movies m
JOIN movie_revenues r ON m.movie_id = r.movie_id
WHERE r.revenue_domestic IS NOT NULL
ORDER BY m.release_date, rank_on_date;

select * from  movie_actor

--Top Actors by Movie Count Per Year
SELECT
    a.first_name || ' ' || a.last_name AS "Actor Name",
    EXTRACT(YEAR FROM m.release_date) AS release_year,
    COUNT(*) AS movie_count,
    RANK() OVER (
        PARTITION BY EXTRACT(YEAR FROM m.release_date)
        ORDER BY COUNT(*) DESC
    ) AS rank_per_year
FROM
    actors a
JOIN movie_actor ma ON a.actor_id = ma.actor_id
JOIN movies m ON ma.movie_id = m.movie_id
GROUP BY a.first_name, a.last_name, EXTRACT(YEAR FROM m.release_date)
ORDER BY release_year, rank_per_year;

