## note that you can't group by the name 
## you MUST group by the id of the manager

SELECT
    m.name
FROM Employee e INNER JOIN Employee m ON e.managerID = m.id
GROUP BY m.id
HAVING COUNT(m.id) >= 5;
