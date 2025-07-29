CREATE EXTENSION pgcrypto;

CREATE TABLE users3 (
  user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  username VARCHAR(100),
  password VARCHAR(100)
);

-- 비밀번호를 암호화해서 저장
-- crypt(): 해시 함수
-- gen_salt(): 해시 알고리즘 선택 함수
INSERT INTO
  users3 (username, password)
VALUES
  ('nico', crypt ('user_password', gen_salt ('bf')));

-- 암호화된 비밀번호를 인증하는 방법
SELECT
  username
FROM
  users3
WHERE
  username = 'nico'
  AND password = crypt ('user_password', password);