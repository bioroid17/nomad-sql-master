SELECT
  JSONB_ARRAY_ELEMENTS_TEXT(profile -> 'hobbies') hobby,
  COUNT(*)
FROM
  users
GROUP BY
  hobby
ORDER BY
  hobby;