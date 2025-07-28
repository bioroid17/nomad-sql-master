CREATE TABLE users (
  user_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  profile JSONB
);

INSERT INTO
  users (profile)
VALUES
  (
    JSON_BUILD_OBJECT('name', 'Taco', 'age', 30, 'city', 'Budapest')
  ),
  (
    JSON_BUILD_OBJECT(
      'name',
      'Giga',
      'age',
      25,
      'city',
      'Tbilisi',
      'hobbies',
      JSON_BUILD_ARRAY('reading', 'climbing')
    )
  );

SELECT
  *
FROM
  users;