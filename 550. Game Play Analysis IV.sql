

WITH
cte AS(
SELECT
    player_id,
    MIN(event_date) AS first_date
FROM Activity
GROUP BY player_id
),

finish AS(
SELECT
    player_id,
    IF(first_date + INTERVAL 1 DAY IN (
        SELECT event_date
        FROM Activity
        WHERE Activity.player_id = cte.player_id
    ), 1, 0) pbinary
FROM cte
)

SELECT ROUND(SUM(pbinary) / COUNT(player_id), 2) AS fraction
FROM finish;
