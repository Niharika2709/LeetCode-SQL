# Write your MySQL query statement below
with tw as 
(
    select 
    turn , person_id , person_name, weight ,
    sum(weight) over (order by turn asc)
    as Total
    from Queue
)
select 
a.person_name 
from Queue a
join tw b 
on a.person_name = b.person_name
and b.Total<= 1000 
order by b.turn desc 
limit 1 ;