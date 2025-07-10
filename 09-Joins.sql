SELECT
  dogs.name AS dog_name,
  owners.name AS owner_name,
  breeds.name AS breed_name
FROM
  dogs
  JOIN owners USING(owner_id)
  JOIN breeds USING(breed_id);