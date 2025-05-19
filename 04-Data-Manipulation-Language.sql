-- 1. 각 감독의 평균 평점은?
SELECT
  director,
  AVG(rating) avg_rating
FROM
  movies
WHERE
  director IS NOT NULL
  AND rating IS NOT NULL
GROUP BY
  director
ORDER BY
  avg_rating DESC;
	
-- 2. 5편 이상의 영화를 가진 각 감독의 평균 평점은?
SELECT
  director,
  ROUND(AVG(rating), 3) avg_rating
FROM
  movies
WHERE
  director IS NOT NULL
  AND rating IS NOT NULL
GROUP BY
  director
HAVING
  COUNT(*) >= 5
ORDER BY
  avg_rating DESC;

-- 3. 각 장르에 몇 편의 영화가 있나요?
SELECT
  genres,
  COUNT(*) total_movies
FROM
  movies
WHERE
  genres IS NOT NULL
GROUP BY
  genres
ORDER BY
  total_movies DESC;

-- 4. 평점이 6점보다 높은 영화는 몇 편인가요? 이 중 가장 많은 평점은 몇 점인가요?
SELECT
  rating,
  COUNT(*) AS total_movies
FROM
  movies
WHERE
  rating > 6
GROUP BY
  rating
ORDER BY
  total_movies DESC,
  rating DESC;