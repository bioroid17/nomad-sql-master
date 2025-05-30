CREATE TABLE users (
  user_id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  username CHAR(10) NOT NULL UNIQUE, -- 'nico' ---> 'nico      '
  email VARCHAR(50) NOT NULL, -- 'nico@nomad.co' ---> 'nico@nomad.co'
  gender ENUM('Male', 'Female') NOT NULL,
  interests SET(
    'Technology',
    'Sports',
    'Music',
    'Art',
    'Travel',
    'Food',
    'Fashion',
    'Science'
  ) NOT NULL,
  bio TEXT NOT NULL, -- TINYTEXT <= 255. TEXT <= 65,535 (64KB). MEDIUMTEXT <= 16,777,215 (16MB). LONGTEXT <= 4,294,967,295 (4GB)
  profile_picture TINYBLOB, -- TINYBLOB. BLOB. MEDIUMBLOB. LONGBLOB
  /*
  1. TINYINT
  Signed:	-128 to 127
  Unsigned:	0 to 255
  
  2. SMALLINT
  Signed:	-32,768 to 32,767
  Unsigned:	0 to 65,535
  
  3. MEDIUMINT
  Signed:	-8,388,608 to 8,388,607
  Unsigned:	0 to 16,777,215
  
  4. INT (INTEGER)
  Signed:	-2,147,483,648 to 2,147,483,647
  Unsigned:	0 to 4,294,967,295
  
  5. BIGINT
  Signed:	-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
  Unsigned:	0 to 18,446,744,073,709,551,615
  */
  age TINYINT UNSIGNED NOT NULL,
  is_admin BOOLEAN DEFAULT FALSE NOT NULL, -- TINYINT(1, 0)
  balance DECIMAL(5, 2) DEFAULT 0.0 NOT NULL, -- DECIMAL(p, s) FLOAT
  /*
  TIMESTAMP - '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC
  DATETIME - '1000-01-01 00:00:00' to '9999-12-31 23:59:59'
  */
  joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- DATETIME YYYY-MM-DD hh:mm:ss
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
  birth_date DATE NOT NULL,
  bed_time TIME NOT NULL,
  graduation_year YEAR NOT NULL, -- 1901 ~ 2155
  -- 그 외에도 JSON, GEOMETRY, POINT, LINESTRING, POLYGON, MULTIPOINT, MULTILINESTRING, MULTIPOLYGON, GEOMETRYCOLLECTION
  
  CONSTRAINT chk_age CHECK (age < 100),
  CONSTRAINT uq_email UNIQUE (email)
);

DROP TABLE users;