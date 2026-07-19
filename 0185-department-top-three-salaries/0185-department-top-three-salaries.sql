# Write your MySQL query statement below
WITH ranked AS
(
    SELECT
        e.name AS Employee,
        e.salary AS Salary,
        e.departmentId,
        DENSE_RANK() OVER
        (
            PARTITION BY departmentId
            ORDER BY salary DESC
        ) AS rn
    FROM Employee e
)

SELECT
    d.name AS Department,
    r.Employee,
    r.Salary
FROM ranked r
JOIN Department d
ON r.departmentId = d.id
WHERE r.rn <= 3;