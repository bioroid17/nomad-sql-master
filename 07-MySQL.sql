-- 열 삭제
ALTER TABLE users DROP COLUMN profile_picture;

-- 열 이름 변경(CHANGE COLUMN)
ALTER TABLE users CHANGE COLUMN bio about_me TINYTEXT;

-- 열 데이터 타입 변경(CHANGE COLUMN)
ALTER TABLE users CHANGE COLUMN about_me about_me TEXT;

-- 열 데이터 타입 변경(MODIFY COLUMN)
ALTER TABLE users MODIFY COLUMN about_me TINYTEXT;

-- DB 이름 변경
ALTER TABLE users RENAME TO customers;

ALTER TABLE customers RENAME TO users;

-- 제약 조건 삭제
ALTER TABLE users DROP CONSTRAINT uq_email;

ALTER TABLE users
DROP CONSTRAINT username,
DROP CONSTRAINT chk_age;

-- 제약 조건 추가
ALTER TABLE users
ADD CONSTRAINT uq_email UNIQUE (email),
ADD CONSTRAINT uq_username UNIQUE (username);

ALTER TABLE users ADD CONSTRAINT chk_age CHECK (age < 100);

-- NOT NULL 조건 삭제
ALTER TABLE users MODIFY COLUMN bed_time TIME NULL;

-- NOT NULL 조건 추가
ALTER TABLE users MODIFY COLUMN bed_time TIME NOT NULL;

SHOW CREATE TABLE users;