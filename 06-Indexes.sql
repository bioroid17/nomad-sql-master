-- EXPLAIN QUERY PLAN
SELECT
  title
FROM
  movies
WHERE
  rating > 7;

CREATE INDEX idx ON movies (rating);

CREATE INDEX idx ON movies (rating, title);

DROP INDEX idx;