# Write your MySQL query statement below
with latest_price as (
    select
        product_id,
        MAX(change_date) as latest_date
    from Products
    where change_date <= '2019-08-16'
    group by product_id
)

select
    p.product_id,
    p.new_price as price
from Products p
join latest_price l
on p.product_id = l.product_id
and p.change_date = l.latest_date

union

select
    product_id,
    10 as price
from Products
where product_id not in (
    select product_id
    from latest_price
);