CREATE TABLE movies (
  movie_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(300) NOT NULL,
  original_title VARCHAR(300) NOT NULL,
  original_language CHAR(2) NOT NULL,
  overview TEXT,
  release_date SMALLINT UNSIGNED,
  revenue BIGINT UNSIGNED,
  budget BIGINT UNSIGNED,
  homepage TEXT,
  runtime SMALLINT UNSIGNED,
  rating FLOAT,
  status ENUM (
    'Released',
    'Rumored',
    'Post Production',
    'Canceled',
    'Planned',
    'In Production'
  ) NOT NULL,
  country TINYTEXT,
  genres TINYTEXT,
  director TINYTEXT,
  spoken_languages TINYTEXT,
  CONSTRAINT chk_rating CHECK (rating BETWEEN 0.0 AND 10.0)
);

SELECT
  *
FROM
  movies;