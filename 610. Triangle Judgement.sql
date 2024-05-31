SELECT 
    x,
    y,
    z,
    CASE
        when ((x + y) > z) AND ((y + z) > x) AND ((z + x) > y)
        then 'Yes'
        else 'No'
    END as `triangle`
FROM Triangle
