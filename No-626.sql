
# Write your MySQL query statement below
select 
-- s.id,s.student,s1.student as studentBefore, s2.student as studentAfter 
s.id,
case 
when s.id %2=1 and s2.student is not null then s2.student
when s.id %2 =0 and s1.student is not null then s1.student
when s.id %2 =1 and s2.student is null then s.student else null end as 'student'
from Seat as s
left join Seat as s1 on s.id = s1.id+1
left join Seat as s2 on s.id =s2.id-1
