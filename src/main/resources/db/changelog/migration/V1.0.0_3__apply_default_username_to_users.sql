UPDATE users
SET username = SUBSTRING(MD5(RANDOM()::text) FROM 1 FOR 10)
WHERE username IS NULL;