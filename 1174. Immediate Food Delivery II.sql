# اتنين cte
# اتنيييييييين !!
# بتعرف تعد لحد كااام

WITH cte AS(
SELECT
    customer_id,
    MIN(order_date) AS first_order
FROM Delivery 
GROUP BY customer_id),

ctee AS(
SELECT
    d.customer_id,
    IF(first_order = customer_pref_delivery_date, 1, 0) imbinary
FROM Delivery d INNER JOIN cte c ON d.order_date = c.first_order AND d.customer_id = c.customer_id
)

SELECT
    ROUND(SUM(imbinary) / COUNT(*) * 100, 2) AS immediate_percentage 
FROM ctee
