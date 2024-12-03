-- solution 1(without window function)

select 
w2.id
from Weather as w1
join Weather as w2 on w2.recordDate = date_add(w1.recordDate,Interval 1 Day)
where w2.temperature > w1.temperature