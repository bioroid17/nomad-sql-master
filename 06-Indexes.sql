SELECT
  title
FROM
  movies
WHERE
  director = 'Guy Ritchie';

CREATE INDEX idx_director ON movies (director);

DROP INDEX idx_director;