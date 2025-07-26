-- PostgreSQL에서 작성됨

CREATE TABLE accounts (
  account_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  account_holder VARCHAR(100) NOT NULL,
  balance DECIMAL(10, 2) NOT NULL CHECK (balance >= 0)
);

DROP TABLE accounts;

INSERT INTO
  accounts (account_holder, balance)
VALUES
  ('nico', 1000.00),
  ('lynn', 2000.00);

-- 트랜잭션 A
BEGIN;

UPDATE accounts
SET
  balance = balance + 200
WHERE
  account_holder = 'lynn';

SELECT
  *
FROM
  accounts;

ROLLBACK;

COMMIT;


-- 트랜잭션 B
BEGIN;

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- do stuff
UPDATE accounts
SET
  balance = balance - 100
WHERE
  account_holder = 'lynn';

SELECT
  *
FROM
  accounts;

COMMIT;