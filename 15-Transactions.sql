-- 트랜잭션 A
BEGIN;

SELECT
  balance
FROM
  accounts
WHERE
  account_holder = 'lynn'
FOR UPDATE;

COMMIT;

-- 트랜잭션 B
UPDATE accounts
SET
  account_holder = 'lynn'
WHERE
  account_holder = 'Lynn';

BEGIN;

SELECT
  balance
FROM
  accounts
WHERE
  account_holder = 'lynn'
FOR SHARE;

COMMIT;