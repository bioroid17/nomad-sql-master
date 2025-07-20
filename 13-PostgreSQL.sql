-- ENUM을 새로 만든 모습
CREATE TYPE gender_type AS ENUM ('male', 'female');

CREATE TABLE users (
  -- CHAR(n) VARCHAR(n)
  -- 0 < n < 10,485,760
  username CHAR(10) NOT NULL UNIQUE,
  email VARCHAR(50) NOT NULL UNIQUE,
  gender gender_type NOT NULL, -- ENUM 타입을 직접 쓸 수 없고, 새로 만든 다음 써야 한다.
  interests TEXT[] NOT NULL,
  bio TEXT, -- TEXT < 1GB
  profile_photo BYTEA -- BYTEA < 1GB
);