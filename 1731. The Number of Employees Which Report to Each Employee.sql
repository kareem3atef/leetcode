# مسألة حرفيُأ معبية كل حاجة

SELECT
    m.employee_id,
    m.name,
    COUNT(e.employee_id) reports_count,
    ROUND(AVG(e.age)) average_age
FROM Employees e INNER JOIN Employees m ON e.reports_to = m.employee_id
GROUP BY m.employee_id
ORDER BY m.employee_id;
