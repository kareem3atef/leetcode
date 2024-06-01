WITH cte AS(
SELECT
    *,
    CASE
        WHEN income < 20000 THEN 'Low Salary'
        WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
        WHEN income > 50000 THEN 'High Salary'
    END AS category
FROM Accounts
),
c AS(
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary' AS category
    UNION
    SELECT 'High Salary' AS category
)

SELECT
    c.category,
    COUNT(account_id) AS accounts_count
FROM cte RIGHT JOIN c ON cte.category = c.category
GROUP BY c.category;
