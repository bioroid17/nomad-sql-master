-- 전체 영화 중 평점이나 수익이 평균 평점 또는 수익보다 높은 영화들의 목록
SELECT
  COUNT(*)
FROM
  movies
WHERE
  rating > (
    SELECT
      AVG(rating)
    FROM
      movies
  );