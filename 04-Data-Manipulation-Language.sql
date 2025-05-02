-- INSERT INTO VALUES

INSERT INTO
	movies (title, rating, released, overview)
VALUES
-- 	('The Lord Of The Rings', 0.5, 1, 'Rings and hobbits'),
	('Dune: Part One', 10, 1, 'Sand');

-- UPDATE

UPDATE movies SET director = 'Unknown' WHERE director IS NULL AND rating = 10;

-- DELETE

DELETE FROM movies WHERE movie_id = 4;