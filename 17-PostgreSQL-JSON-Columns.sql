-- ->: JSONB 키에 대한 값 반환, ->>: 텍스트 반환
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  profile -> 'age' AS age,
  profile -> 'hobbies' ->> 0 AS first_hobby
FROM
  users;

-- ?: JSONB 객체 내에 키 값이 존재하는지 찾기
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city
FROM
  users
WHERE
  profile ? 'hobbies';

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city
FROM
  users
WHERE
  profile -> 'hobbies' ? 'climbing';

-- JSONB_ARRAY_LENGTH: JSONB 배열 길이 구하는 함수
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users;

-- JSONB 객체를 이용한 필터링
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city
FROM
  users
WHERE
  profile ? 'hobbies';

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city
FROM
  users
WHERE
  profile -> 'hobbies' ? 'climbing';

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile ->> 'name' = 'Taco'; -- 텍스트끼리 비교해야 하므로 ->> 연산자 사용

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  (profile ->> 'age')::INTEGER < 30; -- profile ->> 'age'는 텍스트이므로 정수형으로 변환 필요

-- ?| 연산자: 텍스트 배열에 있는 문자열 중 하나라도 JSONB에 존재하는지 물어본다.
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile -> 'hobbies' ?| ARRAY['reading', 'traveling'];

-- ?& 연산자: 텍스트 배열에 있는 문자열 모두 JSONB에 존재하는지 물어본다.
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile -> 'hobbies' ?& ARRAY['reading', 'traveling'];

-- ?|, ?& 연산자는 JSON 배열 뿐만 아니라 객체에서도 사용 가능
SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile ?| ARRAY['name', 'email'];

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile ?& ARRAY['name', 'email'];

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile ?& ARRAY['name', 'hobbies'];

SELECT
  profile ->> 'name' AS name,
  profile ->> 'city' AS city,
  JSONB_ARRAY_LENGTH(profile -> 'hobbies') AS total_hobbies
FROM
  users
WHERE
  profile ->> 'city' LIKE 'B%';