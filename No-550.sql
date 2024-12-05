



select 
round(count(distinct case when a2.event_date is not NUll and RankedA.event_date is not NULL then a.player_id else null end)/count(distinct a.player_id),2) as fraction
from Activity as a 
left join Activity as a2 on DATE_ADD(a.event_date,INTERVAL 1 DAY) = a2.event_date and a.player_id = a2.player_id
left join (
    select ar.player_id,ar.event_date,
    row_number()over(partition by ar.player_id order by ar.event_date asc) as ranks
     from activity as ar
) as RankedA on a.event_date = RankedA.event_date and RankedA.ranks =1 and a.player_id = RankedA.player_id