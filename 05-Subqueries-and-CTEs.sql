-- 전체 영화 중 평점이나 수익이 평균 평점 또는 수익보다 높은 영화들의 제목, 감독, 수익 목록
WITH
  avg_revenue_cte AS (
    SELECT
      AVG(revenue) AS avg_revenue
    FROM
      movies
  ),
  avg_rating_cte AS (
    SELECT
      AVG(rating) AS avg_rating
    FROM
      movies
  )
SELECT
  title,
  director,
  revenue,
  ROUND( ( SELECT avg_revenue FROM avg_revenue_cte ), 0 ) AS avg_revenue,
  rating,
  ROUND( ( SELECT avg_rating FROM avg_rating_cte ), 0 ) AS avg_rating
FROM
  movies
WHERE
  revenue > ( SELECT * FROM avg_revenue_cte )
  AND rating > ( SELECT * FROM avg_rating_cte );