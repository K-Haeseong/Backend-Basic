-- self join
select m.*, b.name boss_name
from member m left outer join member b on b.id = m.boss_id;

-- union
select id, name from member
union
select writer_id, title from notice;

select id, name from member
union all
select writer_id, title from notice;

select id, name from member
minus
select writer_id, title from notice;

select id, name from member
intersect
select writer_id, title from notice;

select id, name from member where id like '%n%'
 minus
select id, name from member where id like '%g%'

intersect
select writer_id, title from notice;