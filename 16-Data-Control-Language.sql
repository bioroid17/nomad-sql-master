-- ROLE 생성(비밀번호 없음)
CREATE ROLE editor;

GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA "public" TO editor;

-- USER 생성(비밀번호와 함께 생성)
CREATE USER editor_one WITH PASSWORD 'words4ever';

-- USER에게 ROLE 부여
GRANT editor TO editor_one;

REVOKE ALL ON movies FROM editor;

-- 테이블의 특정 열에 대해서만 접근 허용
GRANT SELECT (title) ON movies TO editor;

GRANT UPDATE (budget) ON movies TO editor;

-- 같은 유저와 비밀번호로 연결 못 하게 제한
-- editor_one 연결은 1명까지만 가능
ALTER ROLE editor_one WITH CONNECTION LIMIT 1;