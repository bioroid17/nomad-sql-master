-- 1. List all dogs with their breed names
SELECT
  dogs.name as dogs_name,
  breeds.name as breeds_name
FROM
  dogs
  LEFT JOIN breeds USING (breed_id);

-- 2. Show all owners and their dogs (if they have any)
SELECT
  owners.name as owners_name,
  dogs.name as dogs_name
FROM
  owners
  JOIN dogs USING (owner_id);

-- 3. Display all breeds and the dogs of that breed (if any)
SELECT
  breeds.name as breeds_name,
  dogs.name as dogs_name
FROM
  breeds
  JOIN dogs USING (breed_id);

-- 4. List all dogs with their pet passport information and owner data (if avaliable)
SELECT
  d.name AS dogs_name,
  pp.allergies,
  pp.blood_type,
  pp.lASt_checkup_date,
  o.name AS owners_name
FROM
  dogs AS d
  JOIN pet_passports AS pp USING (dog_id)
  JOIN owners AS o USING (owner_id);

-- 5. Show all tricks and the dogs that know them
SELECT
  d.name as dogs_name,
  t.name as tricks_name,
  t.difficulty,
  dt.proficiency,
  dt.date_learned
FROM
  tricks AS t
  JOIN dog_tricks AS dt USING (trick_id)
  JOIN dogs AS d USING (dog_id);

-- 6. Display all dogs that don't know a single trick
SELECT
  d.name as dogs_name
FROM
  dog_tricks AS dt
  RIGHT JOIN dogs AS d USING (dog_id)
WHERE
  dt.trick_id IS NULL;