-- 자신의 평점이 자신이 속한 장르 평균 평점보다 높은 영화들의 목록
WITH
  avg_genre_rating_cte AS (
    SELECT
      AVG(sub_movies.rating)
    FROM
      movies AS sub_movies
    WHERE
      sub_movies.genres IS NOT NULL
      AND sub_movies.genres = main_movies.genres
    GROUP BY
      sub_movies.genres
  )
SELECT
  main_movies.title,
  main_movies.genres,
  main_movies.rating,
  (
    SELECT
      *
    FROM
      avg_genre_rating_cte
  ) as avg_rating
FROM
  movies AS main_movies
WHERE
  main_movies.rating > (
    SELECT
      *
    FROM
      avg_genre_rating_cte
  )
  AND main_movies.release_date > 2020;


-- 모든 감독들의 평균 수익보다 높은 커리어 수익을 기록한 감독들의 목록
WITH
  directors_revenues AS (
    SELECT
      director,
      SUM(revenue) AS career_revenue
    FROM
      movies
    WHERE
      director IS NOT NULL
      AND revenue IS NOT NULL
    GROUP BY
      director
  ),
  avg_director_career_revenue AS (
    SELECT
      AVG(career_revenue)
    FROM
      directors_revenues
  )
SELECT
  director,
  SUM(revenue) AS total_revenue,
  (
    SELECT
      *
    FROM
      avg_director_career_revenue
  ) AS peers_avg
FROM
  movies
WHERE
  director IS NOT NULL
  AND revenue IS NOT NULL
GROUP BY
  director
HAVING
  total_revenue > (
    SELECT
      *
    FROM
      avg_director_career_revenue
  );