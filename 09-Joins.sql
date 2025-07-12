-- 1. Show all breeds and the count of dogs for each breed
SELECT
  breeds.name AS breed_name,
  COUNT(*) AS dog_count
FROM
  breeds
  RIGHT JOIN dogs USING (breed_id)
GROUP BY
  breed_name;

-- 2. Display all owners with the count of their dogs, the average dog weight and the average dog age.
SELECT
  owners.name AS owner_name,
  COUNT(dogs.dog_id) AS dog_count,
  AVG(dogs.weight) AS avg_weight,
  AVG(
    TIMESTAMPDIFF(YEAR, dogs.date_of_birth, CURRENT_DATE)
  ) AS avg_age
FROM
  owners
  LEFT JOIN dogs USING (owner_id)
GROUP BY
  owners.owner_id;

-- 3. Show all tricks and the number of dogs that know each trick ordered by popularity
SELECT
  t.name AS trick_name,
  COUNT(dt.dog_id) AS total_dogs
FROM
  tricks AS t
  LEFT JOIN dog_tricks AS dt USING (trick_id)
GROUP BY
  t.trick_id
ORDER BY
  total_dogs DESC;

-- 4. Display all dogs along with the count of tricks they know
SELECT
  d.name AS dog_name,
  COUNT(dt.trick_id) AS total_tricks
FROM
  dogs AS d
  LEFT JOIN dog_tricks AS dt USING (dog_id)
GROUP BY
  d.dog_id
ORDER BY
  total_tricks DESC;

-- 5. List all owner with their dogs and the tricks their dogs know
SELECT
  o.name owner_name,
  d.name dog_name,
  dt.proficiency,
  t.name trick_name
FROM
  owners o
  LEFT JOIN dogs d USING (owner_id)
  LEFT JOIN dog_tricks dt USING (dog_id)
  JOIN tricks t USING (trick_id)
ORDER BY
  o.name;