-- 코파일럿에게 국가코드 물어보기 위해 spoken_languages UNNEST하기
SELECT DISTINCT
  UNNEST(STRING_TO_ARRAY(spoken_languages, ','))
FROM
  movies
GROUP BY
  spoken_languages;

-- langs에 name 추가
UPDATE langs
SET
  name = CASE code
    WHEN 'fi' THEN 'Finnish'
    WHEN 'en' THEN 'English'
    WHEN 'de' THEN 'German'
    WHEN 'he' THEN 'Hebrew'
    WHEN 'es' THEN 'Spanish'
    WHEN 'zh' THEN 'Mandarin'
    WHEN 'ja' THEN 'Japanese'
    WHEN 'da' THEN 'Danish'
    WHEN 'fr' THEN 'French'
    WHEN 'ko' THEN 'Korean'
    WHEN 'pl' THEN 'Polish'
    WHEN 'sv' THEN 'Swedish'
    WHEN 'it' THEN 'Italian'
    WHEN 'bs' THEN 'Bosnian'
    WHEN 'hi' THEN 'Hindi'
    WHEN 'ru' THEN 'Russian'
    WHEN 'no' THEN 'Norwegian'
    WHEN 'pt' THEN 'Portuguese'
    WHEN 'nl' THEN 'Dutch'
    WHEN 'el' THEN 'Greek'
    WHEN 'cs' THEN 'Czech'
    WHEN 'bn' THEN 'Bengali'
    WHEN 'cn' THEN 'Cantonese'
    WHEN 'tn' THEN 'Tswana'
    WHEN 'sr' THEN 'Serbian'
    WHEN 'mn' THEN 'Mongolian'
    WHEN 'et' THEN 'Estonian'
    WHEN 'is' THEN 'Icelandic'
    WHEN 'ca' THEN 'Catalan'
    WHEN 'ro' THEN 'Romanian'
    WHEN 'hu' THEN 'Hungarian'
    WHEN 'se' THEN 'Northern Sami'
    WHEN 'ps' THEN 'Pushto'
    WHEN 'th' THEN 'Thai'
    WHEN 'xx' THEN 'No Language'
    WHEN 'tr' THEN 'Turkish'
    WHEN 'sh' THEN 'Serbo-Croatian'
    WHEN 'fa' THEN 'Persian'
    WHEN 'ht' THEN 'Haitian; Haitian Creole'
    WHEN 'bg' THEN 'Bulgarian'
    WHEN 'zu' THEN 'Zulu'
    WHEN 'ar' THEN 'Arabic'
    WHEN 'ku' THEN 'Kurdish'
    WHEN 'bo' THEN 'Tibetan'
    WHEN 'ta' THEN 'Tamil'
    WHEN 'tl' THEN 'Tagalog'
    WHEN 'kk' THEN 'Kazakh'
    WHEN 'hr' THEN 'Croatian'
    WHEN 'id' THEN 'Indonesian'
    WHEN 'am' THEN 'Amharic'
    WHEN 'lt' THEN 'Lithuanian'
    WHEN 'iu' THEN 'Inuktitut'
    WHEN 'pa' THEN 'Punjabi'
    WHEN 'te' THEN 'Telugu'
    WHEN 'sl' THEN 'Slovenian'
    WHEN 'vi' THEN 'Vietnamese'
    WHEN 'ml' THEN 'Malayalam'
    WHEN 'mk' THEN 'Macedonian'
    WHEN 'sk' THEN 'Slovak'
    WHEN 'af' THEN 'Afrikaans'
    WHEN 'ur' THEN 'Urdu'
    WHEN 'km' THEN 'Khmer'
    WHEN 'nb' THEN 'Norwegian Bokmål'
    WHEN 'mr' THEN 'Marathi'
    WHEN 'hy' THEN 'Armenian'
    WHEN 'uk' THEN 'Ukrainian'
    WHEN 'ka' THEN 'Georgian'
    WHEN 'ms' THEN 'Malay'
    WHEN 'la' THEN 'Latin'
    WHEN 'kn' THEN 'Kannada'
    WHEN 'dz' THEN 'Dzongkha'
    WHEN 'ga' THEN 'Irish'
    WHEN 'eu' THEN 'Basque'
    WHEN 'bm' THEN 'Bambara'
    WHEN 'sq' THEN 'Albanian'
    WHEN 'ab' THEN 'Abkhazian'
    WHEN 'gl' THEN 'Galician'
    WHEN 'mo' THEN 'Moldavian'
    WHEN 'si' THEN 'Sinhalese'
    WHEN 'rw' THEN 'Kinyarwanda'
    WHEN 'ky' THEN 'Kirghiz'
    WHEN 'eo' THEN 'Esperanto'
    WHEN 'xh' THEN 'Xhosa'
    WHEN 'be' THEN 'Belarusian'
    WHEN 'jv' THEN 'Javanese'
    WHEN 'tg' THEN 'Tajik'
    WHEN 'ff' THEN 'Fulah'
    WHEN 'lv' THEN 'Latvian'
    WHEN 'wo' THEN 'Wolof'
    WHEN 'ik' THEN 'Inupiaq'
    WHEN 'uz' THEN 'Uzbek'
    WHEN 'lo' THEN 'Lao'
    WHEN 'ks' THEN 'Kashmiri'
    WHEN 'sm' THEN 'Samoan'
    WHEN 'gd' THEN 'Gaelic'
    WHEN 'cy' THEN 'Welsh'
    WHEN 'ln' THEN 'Lingala'
    WHEN 'sn' THEN 'Shona'
    WHEN 'yi' THEN 'Yiddish'
    WHEN 'tk' THEN 'Turkmen'
    WHEN 'sw' THEN 'Swahili'
    WHEN 'kl' THEN 'Kalaallisut'
    WHEN 'ne' THEN 'Nepali'
    WHEN 'fo' THEN 'Faroese'
    WHEN 'az' THEN 'Azerbaijani'
    WHEN 'lb' THEN 'Letzeburgesch'
    WHEN 'co' THEN 'Corsican'
    WHEN 'yo' THEN 'Yoruba'
    WHEN 'fy' THEN 'Frisian'
    WHEN 'gu' THEN 'Gujarati'
    WHEN 'sc' THEN 'Sardinian'
    WHEN 'ig' THEN 'Igbo'
    WHEN 'ay' THEN 'Aymara'
    WHEN 'mg' THEN 'Malagasy'
    WHEN 'so' THEN 'Somali'
    WHEN 'gn' THEN 'Guarani'
    WHEN 'qu' THEN 'Quechua'
    WHEN 'cr' THEN 'Cree'
    WHEN 'mh' THEN 'Marshall'
    WHEN 'mi' THEN 'Maori'
    WHEN 'mt' THEN 'Maltese'
    WHEN 'st' THEN 'Sotho'
    WHEN 'li' THEN 'Limburgish'
    WHEN 'sa' THEN 'Sanskrit'
    WHEN 'as' THEN 'Assamese'
    WHEN 'ha' THEN 'Hausa'
    WHEN 'nn' THEN 'Norwegian Nynorsk'
    WHEN 'dv' THEN 'Divehi'
    WHEN 'ak' THEN 'Akan'
    WHEN 'my' THEN 'Burmese'
    WHEN 'or' THEN 'Oriya'
    ELSE name
  END;

-- langs에 spoken_languages에만 있는 언어 추가
-- 이 때 code값이 아직 없으므로 빈 문자열 입력
INSERT INTO
  langs (name, code)
SELECT
  u.unnested_langs,
  ''
FROM
  (
    SELECT DISTINCT
      UNNEST(STRING_TO_ARRAY(spoken_languages, ',')) AS unnested_langs
    FROM
      movies
    GROUP BY
      spoken_languages
  ) u
  LEFT JOIN langs l ON u.unnested_langs = l.name
WHERE
  l.name IS NULL;

-- 추가된 언어에 code 추가
UPDATE langs
SET
  code = CASE name
    WHEN 'Slavic' THEN 'sz' -- Slavic의 code는 찾지 못해서 임의로 삽입
    WHEN 'Twi' THEN 'tw'
    WHEN 'Avaric' THEN 'av'
    WHEN 'Venda' THEN 've'
    WHEN 'Sundanese' THEN 'su'
    WHEN 'Tatar' THEN 'tt'
    WHEN 'Ndebele' THEN 'nd'
    WHEN 'Kikuyu' THEN 'ki'
    WHEN 'Raeto-Romance' THEN 'rm'
    WHEN 'Fijian' THEN 'fj'
    WHEN 'Breton' THEN 'br'
    WHEN 'Ido' THEN 'io'
    WHEN 'Bislama' THEN 'bi'
    WHEN 'Uighur' THEN 'ug'
    WHEN 'Afar' THEN 'aa'
    WHEN 'Occitan' THEN 'oc'
    WHEN 'Ganda' THEN 'lg'
    WHEN 'Sango' THEN 'sg'
    WHEN 'Herero' THEN 'hz'
    WHEN 'Chechen' THEN 'ce'
    WHEN 'Nauru' THEN 'na'
    WHEN 'Chichewa; Nyanja' THEN 'ny'
    WHEN 'Tigrinya' THEN 'ti'
    WHEN 'Tahitian' THEN 'ty'
    WHEN 'Tonga' THEN 'to'
    WHEN 'Navajo' THEN 'nv'
    WHEN 'Ojibwa' THEN 'oj'
    WHEN 'Aragonese' THEN 'an'
    ELSE code
  END;

-- 다대다 관계를 위한 브리지 테이블 생성
CREATE TABLE movies_spoken_langs (
  movie_id BIGINT NOT NULL,
  spoken_lang_id BIGINT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP NOT NULL,
  PRIMARY KEY (movie_id, spoken_lang_id),
  FOREIGN KEY (movie_id) REFERENCES movies (movie_id),
  FOREIGN KEY (spoken_lang_id) REFERENCES langs (lang_id)
);

-- 브리지 테이블에 데이터 삽입
INSERT INTO
  movies_spoken_langs (movie_id, spoken_lang_id)
SELECT
  m.movie_id,
  l.lang_id
FROM
  movies m
  JOIN langs l ON m.spoken_languages LIKE '%' || l.name || '%';

-- spoken_languages 열 삭제
ALTER TABLE movies
DROP COLUMN spoken_languages;