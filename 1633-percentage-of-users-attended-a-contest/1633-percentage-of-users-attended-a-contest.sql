# Write your MySQL query statement below
select r.contest_id,
round(
    COUNT(r.user_id) * 100.0 /
(
    SELECT COUNT(*)
    FROM Users
) ,
2 
) as percentage
from Register r 
group by r.contest_id
order by percentage desc ,  contest_id asc;
