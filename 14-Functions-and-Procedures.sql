-- 함수 생성
-- OR REPLACE는 필수 아님
CREATE
OR REPLACE FUNCTION hello_world () RETURNS TEXT AS $$
  SELECT 'hello_world';
$$ LANGUAGE SQL;

SELECT
  hello_world();

-- 파라미터 받기
CREATE
OR REPLACE FUNCTION hello_world (user_name TEXT) RETURNS TEXT AS $$
  SELECT 'hello ' || user_name;
$$ LANGUAGE SQL;

-- 함수 삭제
DROP FUNCTION hello_world ();

SELECT
  hello_world ('nico');

-- 파라미터 이름 없음 -> 타입만 작성
CREATE
OR REPLACE FUNCTION hello_world (TEXT, TEXT) RETURNS TEXT AS $$
  SELECT 'hello ' || $1 || ' and ' || $2; -- 파라미터 순서로 값에 접근
$$ LANGUAGE SQL;

SELECT
  hello_world ('nico', 'lynn');