CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN 
set N = N-1;
  RETURN (
select distinct e.salary from Employee as e 
order by e.salary desc limit 1 offset N);
END