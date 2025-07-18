CREATE FULLTEXT INDEX idx_overview ON movies (overview);

SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('the food and the drinks') AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('the food and the drinks');
