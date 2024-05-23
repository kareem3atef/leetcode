# common table expression === CTE

WITH cte AS(
SELECT
    query_name,
    (rating / position) AS ratio,
    CASE
        WHEN rating < 3 THEN 1
        ELSE 0
    END AS poor_query
FROM Queries
)

SELECT
    query_name,
    ROUND(AVG(ratio), 2) AS quality,
    ROUND(SUM(poor_query) / COUNT(*) * 100, 2) AS poor_query_percentage
FROM cte
WHERE query_name IS NOT NULL
GROUP BY query_name;
