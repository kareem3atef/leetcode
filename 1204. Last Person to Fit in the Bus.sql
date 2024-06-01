WITH cte AS(
SELECT
    person_name, SUM(weight) OVER(ORDER BY turn ASC) sw
FROM Queue
),
names AS(
SELECT * FROM cte
WHERE sw <= 1000
)

SELECT person_name FROM names
WHERE sw = (SELECT MAX(sw) FROM names)
