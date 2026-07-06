# Write your MySQL query statement below
select  b.project_id ,
round(
    ifnull(
        sum(a.experience_years)/ nullif (count(b.employee_id),0),
        0
    ),
    2
) as average_years
from Project b
left join Employee a 
on b.employee_id = a.employee_id
group by b.project_id ;
