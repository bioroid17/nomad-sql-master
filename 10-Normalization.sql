DROP TABLE countries;
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