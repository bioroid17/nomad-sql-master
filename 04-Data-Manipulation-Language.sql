-- 1. 영화의 최고 평점과 최저 평점 차이가 가장 큰 상위 5개 연도
SELECT
  release_date,
  MAX(rating) - MIN(rating) AS diff
FROM
  movies
WHERE
  release_date IS NOT NULL
  AND rating IS NOT NULL
GROUP BY
  release_date
ORDER BY
  diff DESC,
  release_date DESC
LIMIT
  5;


-- 2. 2시간 미만의 영화를 만들어 본 적이 한 번도 없는 감독
SELECT
  director
FROM
  movies
WHERE
  runtime IS NOT NULL
  AND director IS NOT NULL
GROUP BY
  director
HAVING
  MIN(runtime) >= 120;

-- 3. 전체 영화에서 평점이 8.0보다 높은 영화의 비율
SELECT
  CONCAT(ROUND(100.0 * SUM(rating > 8) / COUNT(*), 2), '%') AS percentage
FROM
  movies;

-- 4. 평점이 7.0보다 높은 영화가 차지하는 비율이 가장 높은 감독
SELECT
  director,
  ROUND(1.0 * SUM(rating > 7) / COUNT(*), 2) AS ratio
FROM
  movies
WHERE
  director IS NOT NULL
GROUP BY
  director
HAVING
  COUNT(*) >= 5
ORDER BY
  ratio DESC
LIMIT
  1;

-- 5. 길이별로 영화를 분류하고 그룹화하기
SELECT
  CASE
    WHEN runtime < 90 THEN 'Short'
    WHEN runtime > 120 THEN 'Long'
    ELSE 'Medium'
  END AS runtime_category,
  COUNT(*) AS total_movies
FROM
  movies
GROUP BY
  runtime_category;


-- 6. flop 여부에 따라 영화를 분류 및 그룹화하기
-- flop이란, 수익보다 예산이 더 많이 나가는 영화를 의미한다.
SELECT
  CASE
    WHEN budget > revenue THEN 'Flop'
    ELSE 'Success'
  END AS flop_or_success,
  COUNT(*) total_movies
FROM
  movies
WHERE
  budget IS NOT NULL
  AND revenue IS NOT NULL
GROUP BY flop_or_success;
