CREATE TABLE statuses (
  status_id BIGINT UNSIGNED PRIMARY KEY auto_increment,
  status_name ENUM(
    'Released',
    'Rumored',
    'Post Production',
    'Canceled',
    'Planned',
    'In Production'
  ) NOT NULL,
  explanation TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL
);

INSERT INTO
  statuses (status_name)
SELECT DISTINCT
  status
FROM
  movies;

ALTER TABLE movies
ADD COLUMN status_id BIGINT UNSIGNED;

ALTER TABLE movies
ADD CONSTRAINT fk_status FOREIGN KEY (status_id) REFERENCES statuses (status_id) ON DELETE SET NULL;

UPDATE movies
SET
  status_id = (
    SELECT
      status_id
    FROM
      statuses
    WHERE
      status_name = movies.status
  );

ALTER TABLE movies
DROP COLUMN status;