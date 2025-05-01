DROP TABLE movies;

CREATE TABLE movies (
	title TEXT,
	released INTEGER, -- 1, 2, 3, ...
	overview TEXT,
	rating REAL, -- 1.2, 9.7, ...
	director TEXT,
	for_kids INTEGER -- 0 or 1
-- 	poster BLOB
) STRICT;

INSERT INTO
  movies (title, rating)
VALUES
  ('The Lord Of The Rings', -10),
  ('Dune: Part One', -10),
  (9.8, 9.9),
  (NULL, NULL);