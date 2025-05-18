SELECT
  title,
  CASE
    WHEN rating >= 8 THEN '👍'
    WHEN rating <= 6 THEN '👎'
    ELSE '👀'
  END AS good_or_not
FROM
  movies;