


select 
wh.id,count(1) as num
from (
select 
x.requester_id as id
 from RequestAccepted as x
 union all
 select y.accepter_id as id from RequestAccepted as y) wh
group by wh.id
order by num  desc limit 1