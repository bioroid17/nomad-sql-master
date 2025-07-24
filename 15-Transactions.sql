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

SELECT
  *
FROM
  accounts;

BEGIN; -- 트랜잭션 시작 시 실행

UPDATE accounts
SET
  balance = balance + 1500
WHERE
  account_holder = 'lynn';

SELECT
  *
FROM
  accounts;

UPDATE accounts
SET
  balance = balance - 1500
WHERE
  account_holder = 'nico';

COMMIT; -- 트랜잭션 종료 시 실행

ROLLBACK; -- 트랜잭션 변경사항 폐기 시 실행