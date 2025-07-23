CREATE
OR REPLACE FUNCTION is_hit_or_flop (movie movies) RETURNS TABLE (hit_or_flop TEXT, other_thing NUMERIC) AS $$
  SELECT
  CASE
    WHEN movie.revenue > movie.budget THEN 'Hit'
    WHEN movie.revenue < movie.budget THEN 'Flop'
    ELSE 'N/A'
  END,
  11111;
$$ LANGUAGE SQL IMMUTABLE;

SELECT
  title,
  (is_hit_or_flop(movies.*)).*
FROM
  movies;

-- updated_at 값 업데이트용 함수
CREATE
OR REPLACE FUNCTION set_updated_at () RETURNS TRIGGER AS $$
  BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
  END;
$$ LANGUAGE PLPGSQL;

CREATE TRIGGER updated_at BEFORE
UPDATE -- OF title <- title 열에 대해서만 트리거 실행을 원할 경우
ON movies FOR EACH ROW
EXECUTE PROCEDURE set_updated_at ();