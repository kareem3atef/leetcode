SELECT *
FROM Cinema
WHERE id % 2 != 0 AND description NOT REGEXP 'boring'
ORDER BY rating DESC;
