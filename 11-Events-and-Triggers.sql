-- BEFORE: INSERT, UPDATE, DELETE
-- AFTER: INSERT, UPDATE, DELETE
SHOW TRIGGERS;

DROP TRIGGER after_movie_update;

TRUNCATE TABLE records;

DELIMITER $$
CREATE TRIGGER after_movie_update AFTER UPDATE
ON movies FOR EACH ROW
BEGIN
  DECLARE changes TINYTEXT DEFAULT '';

  IF NEW.title <> OLD.title THEN
    SET changes = CONCAT(changes, 'Title changed ', OLD.title, ' -> ', NEW.title, '\n');
  END IF;

  IF NEW.budget <> OLD.budget THEN
    SET changes = CONCAT(changes, 'Budget changed ', OLD.budget, ' -> ', NEW.budget, '\n');
  END IF;
  
  INSERT INTO records (changes) VALUES (changes);

END $$
DELIMITER;