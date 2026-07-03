# Write your MySQL query statement below
select a.employee_id 
FROM Employees a
LEFT JOIN Employees b
on a.manager_id = b.employee_id 
WHERE a.salary < 30000
  AND a.manager_id IS NOT NULL
  AND b.employee_id IS NULL
  order by employee_id asc;
