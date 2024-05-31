# كسم الهبللللللللل

WITH cte AS(
SELECT
    id,
    num,
    LEAD(num, 1) OVER(ORDER BY id ASC) AS num1,
    LEAD(num, 2) OVER(ORDER BY id ASC) AS num2
FROM Logs
)

SELECT num AS ConsecutiveNums FROM cte
WHERE num + num1 = 2 * num2;
