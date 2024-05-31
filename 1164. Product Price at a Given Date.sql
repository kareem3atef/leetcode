###############################
### window function and CTE ###
###     منتهى الدلع        ###
###############################


WITH cte AS(
SELECT
    product_id,
    new_price AS price,
    RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS r
FROM Products
WHERE change_date <= '2019-08-16'
)

SELECT
    product_id,
    price
FROM cte
WHERE r = 1

UNION

SELECT
    product_id,
    10
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM cte
)
