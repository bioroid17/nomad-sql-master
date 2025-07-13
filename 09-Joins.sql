-- 1. Show all breeds with their average dog weight and typical lifespan
SELECT
  breeds.name breed_name,
  AVG(dogs.weight) avg_weight,
  breeds.typical_lifespan
FROM
  breeds
  JOIN dogs USING (breed_id)
GROUP BY
  breeds.breed_id;

-- 2. Display all dogs with their latest checkup date and the time since their last checkup
SELECT
  d.name AS dog_name,
  pp.last_checkup_date,
  TIMESTAMPDIFF (DAY, pp.last_checkup_date, CURDATE ()) days_since_last_checkup
FROM
  dogs d
  JOIN pet_passports pp USING (dog_id);

-- 3. Display all breeds with the name of the heaviest dog of that breed
SELECT
  breeds.name,
  dogs.name dogs_name,
  dogs.weight
FROM
  dogs
  JOIN breeds USING (breed_id)
WHERE
  dogs.weight = (
    SELECT
      MAX(d1.weight)
    FROM
      dogs d1
    WHERE
      d1.breed_id = breeds.breed_id
  );

-- 4. List all tricks with the name of the dog who learned it most recently
SELECT
  t.name trick_name,
  d.name dog_name,
  dt.date_learned
FROM
  tricks t
  LEFT JOIN dog_tricks dt USING (trick_id)
  JOIN dogs d USING (dog_id)
WHERE
  dt.date_learned = (
    SELECT
      MAX(dog_tricks.date_learned)
    FROM
      dog_tricks
    WHERE
      dog_tricks.trick_id = dt.trick_id
    GROUP BY
      trick_id
  );