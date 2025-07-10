SELECT
  dogs.name AS dog_name,
  owners.name AS owner_name
FROM
  dogs RIGHT JOIN owners USING (owner_id);