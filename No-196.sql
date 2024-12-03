delete dp from Person as dp
where exists(
    select 1 from 
    (
    select 
    p1.id,
    row_number()over(partition by p1.email order by p1.id asc) as ranks
    from Person as p1 ) as rankedP where rankedP.id = dp.id and rankedP.ranks >1
);