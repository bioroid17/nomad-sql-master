-- || 연산자: 두 JSON(B)를 concatenate한다.
UPDATE users
SET
  profile = profile || JSONB_BUILD_OBJECT('email', 'x@x.com');

-- - 연산자: JSON 객체나 배열에서 키와 값을 삭제한다.
UPDATE users
SET
  profile = profile - 'email'
WHERE
  profile ->> 'name' = 'Giga';

UPDATE users
SET
  profile = profile || JSONB_BUILD_OBJECT(
    'hobbies',
    JSONB_BUILD_ARRAY('climbing', 'traveling')
  )
WHERE
  profile ->> 'name' = 'Taco';

-- hobbies에서 climbing 제거
UPDATE users
SET
  profile = profile || JSONB_SET(
    profile,
    '{hobbies}',
    (profile -> 'hobbies') - 'climbing'
  );

-- hobbies에 cooking 추가
UPDATE users
SET
  profile = profile || JSONB_SET(
    profile,
    '{hobbies}',
    (profile -> 'hobbies') || JSONB_BUILD_ARRAY('cooking')
  );

SELECT
  *
FROM
  users;