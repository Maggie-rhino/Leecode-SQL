
select 
round(sum(cnt.tiv_2016),2) as 'tiv_2016'
from (
-- count window function
select 
i.tiv_2015,
i.tiv_2016,
count(i.pid)over(partition by i.tiv_2015) as cnt_2015,
count(i.pid)over(partition by concat(i.lat,i.lon)) as location_cnt
from Insurance as i ) as cnt
where cnt.cnt_2015>1 and cnt.location_cnt =1