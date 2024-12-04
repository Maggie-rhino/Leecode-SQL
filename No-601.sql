
select 
s.id,s.visit_date,s.people
from Stadium as s
-- previous day
left join Stadium as day_before on s.id =day_before.id+1
-- next day
left join Stadium as day_after on s.id = day_after.id-1
-- two days ago
left join Stadium as two_days_ago on s.id = two_days_ago.id+2
-- two days after
left join Stadium as two_days_after on s.id = two_days_after.id-2
where 1=1 and (
(-- in the beginning
day_after.people>=100 and two_days_after.people>=100) or
(-- in the middle
day_after.people>=100 and day_before.people >=100) or 
( -- at last
two_days_ago.people >=100 and day_before.people >=100
) ) and s.people>=100 
