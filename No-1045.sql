
select 
x.customer_id
from
(select 
c.customer_id,count(distinct c.product_key) as products
 from Customer as c 
 group by c.customer_id) x
 join (
    select count(1) as products from Product
 ) y on x.products = y.products