--  if it only exists in id, not p_id, then it is the leaf;
--  if one exists in id, while p_id is null, then it is the root; 
-- all the rest are innner

select 
n.id,
case when n.p_id is null then "Root" when leaf.id is not null then "Leaf" else "Inner" end as 'type'
from Tree as n
left join (
      -- step 1 find the leaf
    select * from Tree as t where not exists (
        select 1 from (
            select distinct  t1.p_id as id from Tree as t1 ) pt
        where pt.id = t.id )
    ) as leaf on n.id = leaf.id
  
