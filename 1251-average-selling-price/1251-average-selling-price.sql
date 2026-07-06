# Write your MySQL query statement below
select p.product_id ,
round(
    ifnull (
        sum(a.units * p.price)/NULLIF (sum(a.units),0),
        0
    ),
    2
) as average_price
from Prices p
left join UnitsSold a
on p.product_id = a.product_id 
and a.purchase_date between p.start_date and p.end_date
group by p.product_id ; 


