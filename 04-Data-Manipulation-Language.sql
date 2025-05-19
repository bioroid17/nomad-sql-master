SELECT	-- 4
  release_date,
  ROUND(AVG(rating), 2) AS avg_rating
FROM	-- 1
  movies
WHERE	-- 2
  rating IS NOT NULL
  AND release_date IS NOT NULL
GROUP BY-- 3
  release_date
ORDER BY-- 5
  avg_rating DESC;