DROP TABLE movies;

CREATE TABLE movies (
	title TEXT UNIQUE NOT NULL,
	released INTEGER NOT NULL, -- 1, 2, 3, ...
	overview TEXT NOT NULL,
	rating REAL NOT NULL, -- 1.2, 9.7, ...
	director TEXT,
	for_kids INTEGER NOT NULL DEFAULT 0 -- 0 or 1
-- 	poster BLOB
) STRICT;

INSERT INTO
  movies (title, rating, released, overview, for_kids)
VALUES
  ('The Lord Of The Rings', -10, -100, 'Rings and hobbits', 121212),
  ('Dune: Part One', -10, -100, 'Sand',123);