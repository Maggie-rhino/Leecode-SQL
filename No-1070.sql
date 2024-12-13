# Write your MySQL query statement below
select 
ranked.product_id,ranked.year as first_year,ranked.quantity, ranked.price
from (
select 
s.product_id,s.year,s.quantity,s.price,rank()over(partition by s.product_id order by s.year asc) as ranks
from Sales as s ) as ranked
where ranked.ranks =1