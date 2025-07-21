-- ALTER TABLE

-- 열 추가
ALTER TABLE movies ADD COLUMN xxx VARCHAR(100);

-- 열 삭제
ALTER TABLE movies DROP COLUMN xxx;

-- 열 타입 수정
ALTER TABLE movies ALTER COLUMN xxx TYPE TEXT;

-- 열 이름 수정
ALTER TABLE movies RENAME COLUMN xxx TO zzz;

-- PK 추가
ALTER TABLE movies ADD PRIMARY KEY (movie_id);

-- FK 제약조건 추가
ALTER TABLE movies
ADD CONSTRAINT fk FOREIGN KEY (director_id) REFERENCES directors (director_id);

-- CHECK 제약조건 추가
ALTER TABLE movies
ADD CONSTRAINT check_rating CHECK (rating BETWEEN 1 AND 10);

-- UNIQUE 제약조건 추가
ALTER TABLE movies
ADD CONSTRAINT unique_title UNIQUE (title);

-- 제약조건 삭제
ALTER TABLE movies DROP CONSTRAINT check_rating;

-- 열 기본값 변경
ALTER TABLE movies ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;

-- 열 nullable 여부 변경
ALTER TABLE movies ALTER COLUMN zzz SET NOT NULL;

-- 테이블 이름 변경
ALTER TABLE movies RENAME TO movies_;

-- 여러 개의 테이블 변경 작업
ALTER TABLE movies
ADD COLUMN likes INT,
ADD COLUMN dislikes INT;
-------------------------------------------------------------------------------------------

-- FULL OUTER JOIN
SELECT
  movies.title,
  directors.name
FROM
  movies
  FULL OUTER JOIN directors USING (director_id);

-- FULL OUTER JOIN*
SELECT
  movies.title,
  directors.name
FROM
  movies
  FULL OUTER JOIN directors USING (director_id)
WHERE
  movies.director_id IS NULL
  OR directors.director_id IS NULL;