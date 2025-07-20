INSERT INTO
  users (
    username,
    email,
    gender,
    interests,
    bio,
    age,
    is_admin,
    birth_date,
    bed_time,
    graduation_year,
    internship_period
  )
VALUES
  (
    'nico',
    'nico@n.com',
    'male',
    ARRAY['tech', 'music', 'travel'],
    'I like eating and traveling',
    18,
    True,
    '1990-01-01',
    '21:00:00',
    1993,
    '2 years 6 months'
  );

SELECT joined_at FROM users;
SELECT joined_at::DATE FROM users;
SELECT joined_at::TIME FROM users;


SELECT '1' + '1'; -- 에러
SELECT '1'::INTEGER + '1'::INTEGER;
SELECT 'aaaa'::INTEGER + '1'::INTEGER; -- 에러

SELECT
  joined_at::DATE AS joined_date,
  EXTRACT(YEAR FROM joined_at) as joined_year,
  joined_at - INTERVAL '1 day' as day_before_joining,
  AGE(birth_date) as age,
  JUSTIFY_INTERVAL(INTERVAL '38493 hours')
FROM
  users;