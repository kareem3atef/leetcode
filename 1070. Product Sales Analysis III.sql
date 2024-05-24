WITH
cte AS(
SELECT
    product_id,
    MIN(year) first_year
FROM Sales
GROUP BY product_id
)

SELECT
    Sales.product_id,
    cte.first_year,
    Sales.quantity,
    Sales.price
FROM Sales INNER JOIN cte
    ON Sales.product_id = cte.product_id AND Sales.year = cte.first_year
