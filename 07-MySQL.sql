CREATE TABLE users (
  username CHAR(10), -- 'nico' ---> 'nico      '
  email VARCHAR(50), -- 'nico@nomad.co' ---> 'nico@nomad.co'
  gender ENUM('Male', 'Female'),
  interests SET(
    'Technology',
    'Sports',
    'Music',
    'Art',
    'Travel',
    'Food',
    'Fashion',
    'Science'
  ),
  bio TEXT, -- TINYTEXT <= 255. TEXT <= 65,535 (64KB). MEDIUMTEXT <= 16,777,215 (16MB). LONGTEXT <= 4,294,967,295 (4GB)
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
  age TINYINT UNSIGNED,
  is_admin BOOLEAN -- TINYINT(1, 0)
);