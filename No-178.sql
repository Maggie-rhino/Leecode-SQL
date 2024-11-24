
select 
s.score, 
DENSE_RANK()over(order by s.score desc) as `rank`
 from Scores as s
 order by s.score desc