-- GROUP BY를 실행하고 집계 함수를 쓰지 않는 경우
SELECT	-- 4
  release_date
FROM	-- 1
  movies
WHERE	-- 2
  rating IS NOT NULL
  AND release_date IS NOT NULL
GROUP BY-- 3
  release_date;


-- GROUP BY를 하지 않은 열을 SELECT 하는 경우
SELECT -- 4
  title,
  release_date,
  ROUND(AVG(rating), 2) AS avg_rating
FROM -- 1
  movies
WHERE -- 2
  rating IS NOT NULL
  AND release_date IS NOT NULL
GROUP BY -- 3
  release_date
ORDER BY -- 5
  avg_rating DESC;


-- GROUP BY를 하지 않고 집계 함수를 쓰는 경우
SELECT -- 4
  ROUND(SUM(revenue), 2) 
FROM -- 1
  movies
WHERE -- 2
  rating IS NOT NULL
  AND release_date IS NOT NULL
-- GROUP BY -- 3
--   release_date
-- ORDER BY -- 5
--   avg_rating DESC;