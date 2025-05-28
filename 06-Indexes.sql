-- EXPLAIN QUERY PLAN
SELECT
  title
FROM
  movies
WHERE
  rating > 7;

-- 일반 인덱스
CREATE INDEX idx ON movies (rating);

-- 다중 열 인덱스, 커버링 인덱스
CREATE INDEX idx ON movies (rating, title);

-- 인덱스 삭제
DROP INDEX idx;