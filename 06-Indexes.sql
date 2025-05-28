SELECT
  title
FROM
  movies
WHERE
  release_date = 2020
  AND rating > 7;

CREATE INDEX idx ON movies (release_date, rating);

DROP INDEX idx;