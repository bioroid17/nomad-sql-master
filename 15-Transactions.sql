-- MySQL 연결에서 작성됨

CREATE TABLE accounts (
  account_id BIGINT PRIMARY KEY AUTO_INCREMENT,
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
START TRANSACTION;

UPDATE accounts
SET
  balance = balance + 1500
WHERE
  account_holder = 'lynn';

SELECT
  *
FROM
  accounts;

ROLLBACK;

COMMIT;


-- 트랜잭션 B
SET
  SESSION TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

START TRANSACTION;

-- do stuff
SELECT
  *
FROM
  accounts;

COMMIT;