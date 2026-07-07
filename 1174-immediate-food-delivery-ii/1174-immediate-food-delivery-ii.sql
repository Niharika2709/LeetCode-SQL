# Write your MySQL query statement below
with first_order as 
(
    select customer_id ,
    min(order_date) as first_date
    from Delivery
    group by customer_id
)
select 
round(
        avg( 
        case
        when b.order_date = b.customer_pref_delivery_date
        then 1
        else 0
        end )*100,
        2 )   
 as  immediate_percentage
from Delivery b
join first_order a 
on a.customer_id = b.customer_id 
and a.first_date = b.order_date ;
