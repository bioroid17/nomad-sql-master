CREATE EXTENSION hstore;
-- DROP EXTENSION hstore;

SELECT
  *
FROM
  pg_extension;

CREATE TABLE users2 (
  user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  prefs hstore -- hstore 타입
);

-- hstore 값 삽입
INSERT INTO
  users2 (prefs)
VALUES
  ('theme => dark, lang => kr, notifications => off'),
  (
    'theme => light, lang => es, notifications => on, push_notifications => on, email_notifications => off'
  ),
  (
    'theme => dark, lang => it, start_page => dashboard, font_size => large'
  );

-- hstore 연산자
SELECT
  user_id,
  prefs -> 'theme',
  prefs -> ARRAY['lang', 'notifications'],
  prefs ? 'font_size' AS has_font_size,
  prefs ?| ARRAY['push_notifications', 'start_page']
FROM
  users2;

-- hstore 함수
SELECT
  user_id,
  akeys(prefs),
  avals(prefs)
FROM
  users2;

SELECT
  user_id,
  each(prefs)
FROM
  users2;

-- 특정 행의 hstore 키-값 수정
UPDATE users2
SET
  prefs['theme'] = 'light'
WHERE
  user_id = 1;

-- 모든 행의 hstore에 새로운 키-값 추가
UPDATE users2
SET
  prefs = prefs || hstore (
    ARRAY['currency', 'cookies_ok'],
    ARRAY['krw', 'yes']
  );

-- 모든 행의 hstore에서 키 삭제
UPDATE users2
SET
  prefs = delete (prefs, 'cookies_ok');

SELECT
  *
FROM
  users2;