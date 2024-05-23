# إمبارح لو عايزينه يبقى النهاردة هنزود عليه يوم

SELECT t.id
FROM Weather t LEFT JOIN Weather y
    ON t.recordDate = DATE_ADD(y.recordDate, INTERVAL 1 DAY)
WHERE t.temperature > y.temperature;
