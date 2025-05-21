-- view 생성
CREATE VIEW v_guy_ritchie_awesome AS
SELECT
  *
FROM
  movies
WHERE
  director = 'Guy Ritchie';

-- view 조회
SELECT
  title
FROM
  v_guy_ritchie_awesome;

-- view 삭제
DROP VIEW v_guy_ritchie_awesome;