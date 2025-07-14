CREATE TABLE directors (
  director_id BIGINT UNSIGNED PRIMARY KEY auto_increment,
  name VARCHAR(120),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO
  directors (name)
SELECT
  director
FROM
  movies
GROUP BY
  director
HAVING
  director <> '';

ALTER TABLE movies
ADD COLUMN director_id BIGINT UNSIGNED;

ALTER TABLE movies
ADD CONSTRAINT fk_director FOREIGN KEY (director_id) REFERENCES directors (director_id) ON DELETE SET NULL;

CREATE INDEX idx_director_name ON directors (name);

UPDATE movies
SET
  director_id = (
    SELECT
      director_id
    FROM
      directors
    WHERE
      name = movies.director
  );

ALTER TABLE movies
DROP COLUMN director;