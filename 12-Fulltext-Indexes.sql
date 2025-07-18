CREATE FULLTEXT INDEX idx_overview ON movies (overview);

-- 필수로 들어가야 하는 경우(+), 절대 들어가면 안 되는 경우(-)
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('+revenge -violence' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('+revenge -violence' IN BOOLEAN MODE);

-- 필수는 아니지만 있으면 좋은 단어: 그냥 작성
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('+revenge food -violence' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('+revenge food -violence' IN BOOLEAN MODE);

-- 가중치 부여: 있으면 좋은 단어(>), 없으면 좋은 단어(<)
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('+travel >asia <europe' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('+travel >asia <europe' IN BOOLEAN MODE);

-- 공백이 포함된 단어: 큰따옴표로 묶기
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('+"overseas travel"' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('+"overseas travel"' IN BOOLEAN MODE);

-- 괄호를 써서 복잡한 표현 만들기
-- +(단어1 단어2): 둘 중 하나는 필수
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('+(action thriller) -horror +love' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('+(action thriller) -horror +love' IN BOOLEAN MODE);

-- 단어의 시작 부분으로 검색하기: *
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('psycho*' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('psycho*' IN BOOLEAN MODE);

-- 단어 사이의 거리: @distance
SELECT
  title,
  overview,
  MATCH(overview) AGAINST ('"food romance"@10' IN BOOLEAN MODE) AS score
FROM
  movies
WHERE
  MATCH(overview) AGAINST ('"food romance"@10' IN BOOLEAN MODE);