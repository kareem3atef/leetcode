WITH cte AS(
SELECT
    id,
    student,
    LEAD(id) OVER() AS `lead`,
    LAG(id) OVER() AS `lag`
FROM Seat
)

SELECT
    CASE
        WHEN id % 2 != 0 THEN IFNULL(`lead`, `id`)
        WHEN id % 2 = 0 THEN `lag`
    END AS id,
    student
FROM cte
ORDER BY id;
