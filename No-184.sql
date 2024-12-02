-- sulution 1 
    -- step 1: find the highest salary amount
    -- step 2: join the table and get the info


select 
d.name as 'Department',
rankedE.name as 'Employee',
rankedE.salary as 'Salary'
from 
(
select 
e.departmentId, e.salary,e.name,
rank()over(partition by e.departmentId order by e.salary desc) as ranks
 from Employee as e ) rankedE
 join Department as d on rankedE.departmentId = d.id
 where rankedE.ranks =1