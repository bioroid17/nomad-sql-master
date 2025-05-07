SELECT
  *
FROM
  movies
WHERE
  rating > 9
  OR (
    rating IS NULL
    AND genres = 'Documentary'
  );