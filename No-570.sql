
select 
e2.name
from Employee as e1
join Employee as e2 on e1.managerId = e2.id
group by e2.id
having count(e1.id)>=5