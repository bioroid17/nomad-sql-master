CREATE TABLE countries (
  country_id BIGINT UNSIGNED PRIMARY KEY auto_increment,
  country_code CHAR(2) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO
  countries (country_code)
SELECT
  country
FROM
  movies
WHERE
  country NOT LIKE '%,%'
GROUP BY
  country;

INSERT IGNORE INTO
  countries (country_code)
SELECT
  SUBSTRING_INDEX(country, ',', 1)
FROM
  movies
WHERE
  country LIKE '__,__'
GROUP BY
  country
UNION
SELECT
  SUBSTRING_INDEX(country, ',', -1)
FROM
  movies
WHERE
  country LIKE '__,__'
GROUP BY
  country;

INSERT IGNORE INTO
  countries (country_code)
SELECT
  SUBSTRING_INDEX(country, ',', 1)
FROM
  movies
WHERE
  country LIKE '__,__,__'
GROUP BY
  country
UNION
SELECT
  SUBSTRING_INDEX(country, ',', -1)
FROM
  movies
WHERE
  country LIKE '__,__,__'
GROUP BY
  country
UNION
SELECT
  SUBSTRING_INDEX(SUBSTRING_INDEX(country, ',', 2), ',', -1)
FROM
  movies
WHERE
  country LIKE '__,__,__'
GROUP BY
  country;

CREATE TABLE movies_countries (
  movie_id BIGINT UNSIGNED,
  country_id BIGINT UNSIGNED,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (movie_id, country_id),
  FOREIGN KEY (movie_id) REFERENCES movies (movie_id) ON DELETE CASCADE,
  FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE
);

INSERT INTO
  movies_countries (movie_id, country_id)
SELECT
  movies.movie_id,
  countries.country_id
FROM
  movies
  JOIN countries ON movies.country LIKE CONCAT('%', countries.country_code, '%')
WHERE
  movies.country <> ''
  AND countries.country_code <> '';

ALTER TABLE movies
DROP COLUMN country;