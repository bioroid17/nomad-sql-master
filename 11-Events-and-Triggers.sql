-- BEFORE: INSERT, UPDATE, DELETE
-- AFTER: INSERT, UPDATE, DELETE
CREATE TABLE records (
  record_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  changes TINYTEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

DROP TRIGGER before_movie_insert;

CREATE TRIGGER before_movie_insert BEFORE INSERT ON movies FOR EACH ROW
INSERT INTO
  records (changes)
VALUES
  (CONCAT ('Will insert: ', NEW.title));

CREATE TRIGGER after_movie_insert AFTER INSERT ON movies FOR EACH ROW
INSERT INTO
  records (changes)
VALUES
  (CONCAT ('Insert completed: ', NEW.title));

CREATE TRIGGER before_movie_update BEFORE
UPDATE ON movies FOR EACH ROW
INSERT INTO
  records (changes)
VALUES
  (
    CONCAT (
      'Will update title: ',
      OLD.title,
      ' -> ',
      NEW.title
    )
  );

CREATE TRIGGER after_movie_update AFTER
UPDATE ON movies FOR EACH ROW
INSERT INTO
  records (changes)
VALUES
  (
    CONCAT (
      'Update completed: ',
      OLD.title,
      ' -> ',
      NEW.title
    )
  );

CREATE TRIGGER before_movie_delete BEFORE DELETE ON movies FOR EACH ROW
INSERT INTO
  records (changes)
VALUES
  (CONCAT ('Will delete title: ', OLD.title));

CREATE TRIGGER after_movie_delete AFTER DELETE ON movies FOR EACH ROW
INSERT INTO
  records (changes)
VALUES
  (CONCAT ('Delete completed: ', OLD.title));