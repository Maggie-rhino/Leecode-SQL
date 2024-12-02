-- step 1: find the highest three salary for each deparment first
-- step 2: join step 1 with Employee table and get the name;
-- step 3: join step2 with Department table to get the result

select 
    d.name as 'Department',e.name as 'Employee',e.salary as 'Salary'
from Employee as e
join (
    select 
    distinct departmentId,salary,
    dense_rank()over(partition by departmentId order by salary desc) as ranks
    from Employee ) as rankedE 
 on e.departmentId = rankedE.departmentId and e.salary = rankedE.salary
join Department as d on e.departmentId = d.id
where rankedE.ranks<4
order by rankedE.ranks asc