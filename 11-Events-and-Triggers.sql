SHOW events;

SHOW CREATE EVENT archive_old_movies;

CREATE DEFINER = `root` @`localhost` EVENT `archive_old_movies` ON SCHEDULE EVERY 2 MINUTE STARTS '2025-07-18 00:58:34' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
INSERT INTO
  archived_movies
SELECT
  *
FROM
  movies
WHERE
  release_date < YEAR(CURDATE()) - 20;

DELETE FROM movies
WHERE
  release_date < YEAR(CURDATE()) - 20;

END