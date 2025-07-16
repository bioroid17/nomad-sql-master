CREATE TABLE langs (
  lang_id BIGINT UNSIGNED PRIMARY KEY auto_increment,
  name VARCHAR(120),
  code CHAR(2),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO
  langs (code)
SELECT
  original_language
FROM
  movies
GROUP BY
  original_language;

ALTER TABLE movies
ADD COLUMN original_lang_id BIGINT UNSIGNED;

ALTER TABLE movies
ADD CONSTRAINT fk_org_lang FOREIGN KEY (original_lang_id) REFERENCES langs (lang_id) ON DELETE SET NULL;

CREATE INDEX idx_director_name ON directors (name);

UPDATE movies
SET
  original_lang_id = (
    SELECT
      lang_id
    FROM
      langs
    WHERE
      code = movies.original_language
  );

ALTER TABLE movies
DROP COLUMN original_language;