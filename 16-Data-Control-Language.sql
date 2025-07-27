-- 유저 생성
CREATE ROLE marketer
WITH
  LOGIN PASSWORD 'marketing4ever';

-- 권한 부여
GRANT
-- INSERT,
-- UPDATE,
SELECT
  ON movies TO marketer;

GRANT
SELECT, INSERT ON statuses, directors TO marketer;

GRANT
SELECT
  ON ALL TABLES IN SCHEMA public TO marketer;

-- 권한 취소
REVOKE INSERT ON statuses, directors FROM marketer;

GRANT
INSERT
  ON ALL TABLES IN SCHEMA public TO marketer;

GRANT
SELECT, INSERT
  ON ALL TABLES IN SCHEMA public TO marketer;

REVOKE SELECT, INSERT ON ALL TABLES IN SCHEMA public
FROM
  marketer;