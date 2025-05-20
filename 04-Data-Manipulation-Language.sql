-- 1. 각 년도에 개봉된 영화의 수
SELECT
  release_date,
  COUNT(*) total_movies
FROM
  movies
WHERE
  release_date IS NOT NULL
GROUP BY
  release_date
ORDER BY
  total_movies DESC;

-- 2. 평균 영화 상영 시간이 가장 높은 최신 10년
SELECT
  release_date,
  ROUND(AVG(runtime), 2) avg_runtime
FROM
  movies
WHERE
  runtime IS NOT NULL
GROUP BY
  release_date
ORDER BY
  avg_runtime DESC
LIMIT
  10;

-- 3. 21세기에 개봉한 영화의 평균 평점
SELECT
  ROUND(AVG(rating), 2) avg_rating
FROM
  movies
WHERE
  release_date >= 2000;

-- 4. 평균 영화 상영 시간이 가장 긴 감독
SELECT
  director,
  ROUND(AVG(runtime), 2) avg_runtime
FROM
  movies
WHERE
  director IS NOT NULL
  AND runtime IS NOT NULL
GROUP BY
  director
HAVING
  COUNT(*) >= 3
ORDER BY
  avg_runtime DESC;

-- 5. 가장 많은 영화를 작업한 다작 감독 상위 5명
SELECT
  director,
  COUNT(*) total_movies
FROM
  movies
WHERE
  director IS NOT NULL
  AND runtime > 45
GROUP BY
  director
ORDER BY
  total_movies DESC
LIMIT
  5;
  
-- 6. 각 감독의 최고 평점과 최저 평점
SELECT
  director,
  MIN(rating) min_rating,
  MAX(rating) max_rating
FROM
  movies
WHERE
  rating IS NOT NULL
  AND director IS NOT NULL
GROUP BY
  director
HAVING
	COUNT(*) > 5;

-- 7. 돈을 가장 많이 번 감독 (수익에서 예산을 뺀 금액 계산)
SELECT
  director,
  SUM(revenue) - SUM(budget) AS profit
FROM
  movies
WHERE
  revenue IS NOT NULL
  AND budget IS NOT NULL
  AND director IS NOT NULL
GROUP BY
  director
ORDER BY
  profit DESC;

-- 8. 2시간 이상인 영화들의 평균 평점
SELECT
  ROUND(AVG(rating), 2) AS avg_rating
FROM
  movies
WHERE
  runtime >= 120
  AND rating IS NOT NULL;
  
-- 9. 가장 많은 영화가 개봉된 년도
SELECT
  release_date,
  COUNT(*) AS total_movies
FROM
  movies
WHERE
  release_date IS NOT NULL
GROUP BY
  release_date
ORDER BY
  total_movies DESC
LIMIT
  1;

-- 10. 각 10년동안 평균 영화 상영 시간 (ex: 1800, 1900, 2000)
SELECT
  CONCAT((release_date / 10) * 10, 's') AS decade,
  ROUND(AVG(runtime), 2) AS avg_runtime
FROM
  movies
WHERE
  release_date IS NOT NULL
  AND runtime IS NOT NULL
GROUP BY
  decade;