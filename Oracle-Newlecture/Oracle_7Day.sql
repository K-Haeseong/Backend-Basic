-- inner ����
-- �����ִ� �ͳ��� ����
select * from member;
select * from notice;

select * from member inner join notice on member.id = writer_id;


-- (LEFT / RIGHT / FULL) outer ����
select * from notice join member on member.id = notice.writer_id;
select * from notice left outer join member on member.id = notice.writer_id;
select * from notice right outer join member on member.id = notice.writer_id;
select * from notice full outer join member on member.id = notice.writer_id ;

