# Write your MySQL query statement below
SELECT
'Low Salary' as category,
( 
   select count(*) 
   from Accounts
   where income < 20000
) as accounts_count

UNION ALL

SELECT
'Average Salary' as category,
(  
   select count(*) 
   from Accounts 
   where income >= 20000
   and income <= 50000
) as accounts_count


UNION ALL

SELECT
'High Salary'as category ,
(
   select count(*) 
   from Accounts
   where income > 50000
)as accounts_count;