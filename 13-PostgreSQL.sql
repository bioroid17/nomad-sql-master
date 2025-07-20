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
  profile_photo BYTEA, -- BYTEA < 1GB
  
  -- 1. SMALLINT
  -- Signed:	-32,768 to 32,767
  
  -- 2. INTEGER
  -- Signed:	-2,147,483,648 to 2,147,483,647
  
  -- 3. BIGINT
  -- Signed:	-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
  
  -- SMALLSERIAL (1 to 32,767)
  -- SERIAL (1 to 2,147,483,647)
  -- BIGSERIAL (1 to 9,223,372,036,854,775,807)

  -- DECIMAL & NUMERIC(precision, scale) 10.53 4p 2s
  -- REAL (6 deciaml digits) & DOUBLE PRECISION (15 decimal digits)
  age SMALLINT NOT NULL CHECK (age >= 0),
  is_admin BOOLEAN NOT NULL DEFAULT FALSE,
  
  -- 4713 BC ~ 294276 AD
  joined_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  birth_date DATE NOT NULL,
  bed_time TIME NOT NULL,
  graduation_year INTEGER NOT NULL CHECK(graduation_year BETWEEN 1901 AND 2115),
  internship_period INTERVAL
);