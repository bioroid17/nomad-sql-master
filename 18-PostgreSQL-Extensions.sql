CREATE EXTENSION "uuid-ossp";

CREATE TABLE users4 (
  user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4 (),
  username VARCHAR(100),
  password VARCHAR(100)
);

INSERT INTO
  users4 (username, password)
VALUES
  ('nico', '1234');

SELECT
  *
FROM
  users4;