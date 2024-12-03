
select 
t1.request_at as "Day",
round(sum(case when t1.status !="completed" then 1 else 0 end)/ count(1),2) as "Cancellation Rate"
from Trips as t1
join Users as u1 on t1.client_id = u1.users_id
join Users as u2 on t1.driver_id = u2.users_id
where u1.banned ="no" and u1.role="client"
and u2.banned ="no" and u2.role ="driver"
and t1.request_at between "2013-10-01" and "2013-10-03"
group by t1.request_at