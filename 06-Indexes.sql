SELECT
  title,
  movie_id,
  rowid
FROM
  movies
WHERE
  director = 'Guy Ritchie';

CREATE INDEX idx_director ON movies (director);

DROP INDEX idx_director;


CREATE TABLE X (name TEXT);

INSERT INTO X VALUES ('hello');

SELECT name, rowid FROM X;

SELECT * FROM X;

SELECT *, rowid FROM X;


CREATE TABLE Z (name UNIQUE);

INSERT INTO Z VALUES ('hello');