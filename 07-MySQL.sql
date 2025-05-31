ALTER TABLE users MODIFY COLUMN graduation_year DATE;

ALTER TABLE users ADD COLUMN graduation_date DATE;

UPDATE users SET graduation_date = MAKEDATE(graduation_year, 1);

ALTER TABLE users DROP COLUMN graduation_year;

ALTER TABLE users MODIFY COLUMN graduation_date DATE NOT NULL;

-- ALTER TABLE users ADD COLUMN graduation_date DATE NOT NULL DEFAULT MAKEDATE(graduation_year, 1); -- DEFAULT 값이 상수가 아니므로 에러가 난다.