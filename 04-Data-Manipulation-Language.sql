-- Range condition
SELECT
  *
FROM
  movies
WHERE
  release_date BETWEEN 2020 AND 2024;

-- Membership condition
SELECT
  *
FROM
  movies
WHERE
  genres IN ('Documentary', 'Comedy');

SELECT
  *
FROM
  movies
WHERE
  original_language NOT IN ('en', 'es', 'de');

-- Pattern matching
SELECT
  *
FROM
  movies
WHERE
  title LIKE 'The%';

SELECT
  *
FROM
  movies
WHERE
  title LIKE '%Love';

SELECT
  *
FROM
  movies
WHERE
  overview LIKE '%kimchi%';

SELECT
  *
FROM
  movies
WHERE
  genres NOT LIKE '%Drama%';

SELECT
  *
FROM
  movies
WHERE
  title LIKE '___ing';

SELECT
  *
FROM
  movies
WHERE
  title LIKE 'The __';

SELECT
  *
FROM
  movies
WHERE
  director NOT LIKE '_____ Roberts';

SELECT
  *
FROM
  movies
WHERE
  title LIKE 'The ___ %';
