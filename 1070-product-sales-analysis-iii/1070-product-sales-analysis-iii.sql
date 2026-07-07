# Write your MySQL query statement below
with first_year as
(
    select product_id ,
    min(year) as first_year
    from Sales
    group by product_id
)
select 
a.product_id,
b.first_year as first_year ,
a.quantity ,
a.price
from Sales a
join first_year b
on a.year = b.first_year  
and a.product_id = b.product_id ;