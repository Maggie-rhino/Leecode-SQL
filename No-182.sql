select 
p.email as Email
from Person as p 
group by p.email
having count(1) >1