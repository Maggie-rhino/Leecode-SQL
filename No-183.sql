-- solution 1:
select 
c.name as 'Customers'
from Customers as c 
left join Orders as o on c.id = o.customerId
where o.id is null


-- solution 2:

select 
c.name as 'Customers'
from Customers as c where not exists (
    select 1 from Orders as o where c.id = o.customerId
)