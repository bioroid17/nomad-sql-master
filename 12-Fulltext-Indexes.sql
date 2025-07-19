SELECT
  title,
  overview,
  MATCH(overview) AGAINST (
    'kimchi'
    WITH
      QUERY EXPANSION
  ) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST (
    'kimchi'
    WITH
      QUERY EXPANSION
  );