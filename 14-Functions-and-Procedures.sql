-- return 하지 않는 프로시저
CREATE PROCEDURE set_zero_revenue () AS $$
  UPDATE movies SET revenue = NULL WHERE revenue = 0;
$$ LANGUAGE SQL;

CALL set_zero_revenue ();

-- return 하는 프로시저
CREATE PROCEDURE hello_world_p (IN name TEXT, OUT greeting TEXT) AS $$
  BEGIN
    greeting = 'Hello ' || name;
  END;
$$ LANGUAGE PLPGSQL;

-- CALL hello_world_p ('nico'); <- 에러
CALL hello_world_p ('nico', NULL); -- 출력값에 해당하는 인자도 줘야 한다.

-- PLPGSQL 맛보기
-- 유저의 언어에 따라 여러 언어로 인사하는 함수 만들기
CREATE PROCEDURE hello_world_i (IN name TEXT, IN lang TEXT, OUT greeting TEXT) AS $$
  DECLARE
    spanish_hello TEXT = 'hola';
    italian_hello TEXT = 'ciao';
    korean_hello TEXT = '안녕';
  BEGIN
    IF lang = 'korean' THEN
      greeting := korean_hello || ' ' || name || '!';
    ELSIF lang = 'italian' THEN
      greeting := italian_hello || ' ' || name || '!';
    ELSIF lang = 'spanish' THEN
      greeting := spanish_hello || ' ' || name || '!';
    ELSE
      greeting := 'hello ' || name || '!';
    END IF;
  END;
$$ LANGUAGE PLPGSQL;



CALL hello_world_i('nico', 'korean', NULL);
CALL hello_world_i('nico', 'italian', NULL);
CALL hello_world_i('nico', 'spanish', NULL);
CALL hello_world_i('nico', 'esperanto', NULL);