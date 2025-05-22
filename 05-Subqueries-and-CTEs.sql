-- 같은 해에 상영된 영화들의 평균 평점보다 높은 평점을 기록한 영화들의 목록
WITH
  movie_avg_per_year AS (
    SELECT
      AVG(inner_movies.rating)
    FROM
      movies AS inner_movies
    WHERE
      inner_movies.release_date = main_movies.release_date
  )
SELECT
  main_movies.title,
  main_movies.director,
  main_movies.rating,
  main_movies.release_date,
  ( SELECT*FROM movie_avg_per_year ) AS year_average
FROM
  movies AS main_movies
WHERE
  main_movies.rating > ( SELECT*FROM movie_avg_per_year )
  AND release_date > 2020;