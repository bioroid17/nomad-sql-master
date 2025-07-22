CREATE
OR REPLACE FUNCTION is_hit_or_flop (movie movies) RETURNS TEXT AS $$
  SELECT
  CASE
    WHEN movie.revenue > movie.budget THEN 'Hit'
    WHEN movie.revenue < movie.budget THEN 'Flop'
    ELSE 'N/A'
  END;
$$ LANGUAGE SQL;

SELECT
  title,
  is_hit_or_flop(movies.*)
FROM
  movies;

DROP FUNCTION is_hit_or_flop(movies);

-- 여러 개의 값을 반환하는 함수
CREATE
OR REPLACE FUNCTION is_hit_or_flop (movie movies) RETURNS TABLE (hit_or_flop TEXT, other_thing NUMERIC) AS $$
  SELECT
  CASE
    WHEN movie.revenue > movie.budget THEN 'Hit'
    WHEN movie.revenue < movie.budget THEN 'Flop'
    ELSE 'N/A'
  END,
  11111;
$$ LANGUAGE SQL;

SELECT
  title,
  (is_hit_or_flop(movies.*)).*
FROM
  movies;