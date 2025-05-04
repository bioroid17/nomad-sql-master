SELECT
    REPLACE(title, ': Part One', 'I') AS title,
    rating * 2 AS double_rating,
    UPPER(overview) AS overview_uppercase
FROM
    movies;