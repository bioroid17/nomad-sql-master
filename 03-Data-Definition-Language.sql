DROP TABLE movies;

CREATE TABLE movies (
	title TEXT UNIQUE NOT NULL,
	released INTEGER NOT NULL CHECK (released > 0), -- 1, 2, 3, ...
	overview TEXT NOT NULL CHECK (LENGTH(overview) <= 100),
	rating REAL NOT NULL CHECK (rating BETWEEN 0 AND 10), -- 1.2, 9.7, ...
	director TEXT,
	for_kids INTEGER NOT NULL DEFAULT 0 CHECK (for_kids BETWEEN 0 AND 1) -- 0 or 1
-- 	poster BLOB
) STRICT;

INSERT INTO
  movies (title, rating, released, overview, for_kids)
VALUES
  ('The Lord Of The Rings', 0.5, 1, 'Rings and hobbits qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnm qazwsxedc rfv tgb', 0),
  ('Dune: Part One', 10, 1, 'Sand', 1);