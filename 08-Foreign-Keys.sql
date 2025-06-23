DROP TABLE dogs;

CREATE TABLE dogs (
  dog_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  weight DECIMAL(5, 2),
  date_of_birth DATE,
  owner_id BIGINT UNSIGNED,
  breed_id BIGINT UNSIGNED,
  
  FOREIGN KEY (owner_id) REFERENCES owners (owner_id),
  CONSTRAINT breed_fk FOREIGN KEY (breed_id) REFERENCES breeds (breed_id)
);

CREATE TABLE breeds (
  breed_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  size_category ENUM('small', 'medium', 'big') DEFAULT 'small',
  typical_lifespan TINYINT
);

CREATE TABLE owners (
  owner_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(20),
  address TINYTEXT
);

INSERT INTO
  breeds (name, size_category, typical_lifespan)
VALUES
  ('Golden Retriever', 'big', 12);

INSERT INTO
  owners (name, email, phone, address)
VALUES
  (
    'Adam Smith',
    'adam@smith.com',
    '1122334455',
    '9010 St. Scotland'
  );

INSERT INTO
  dogs (name, date_of_birth, weight, breed_id, owner_id)
VALUES
  ('Buddy', '2018-03-15', 10.5, 1, 1);

INSERT INTO
  dogs (name, date_of_birth, weight, breed_id, owner_id)
VALUES
  ('Champ', '2018-03-15', 10.5, 1, 1);