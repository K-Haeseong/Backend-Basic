insert into member(id, pwd) values('test', '111');

UPDATE member set pwd='111', name='����' where id ='dragon';


SELECT id "USER ID", name, pwd from member;
delete member where id ='test';

COMMIT;
rollback;

select hit+1 hit from notice;
select name, id, pwd from member;

insert into notice(HIT) values('1');
insert into notice(HIT) values('12');
insert into notice(HIT) values('9');
insert into notice(HIT) values('2');
insert into notice(HIT) values('23');

delete notice where hit in ('1','12','9','2','23');

select 1+'3' from dual; 
--�������̺��� Ȱ���ؼ� ȭ�鿡 ���
-- '+'�� ���ڸ� �������ִ� ������
-- '||'�� ���ڿ��� �������ִ� ������

select * from notice where writer_id ='newlec';

select * from notice where HIT > 3;

select * from notice where content is null;

select * from notice where 0 <= hit AND hit <= 2;
select * from notice where hit between 0 and 2;

select * from notice where hit in (0,2,7);

select * from notice where hit not in (0,2,7);

select * from member;
delete member where name in ('���ϳ�', 'ȫ�浿', '���̹�', '�̹ڼ�');
insert into member(name) values('���ϳ�');
insert into member(name) values('����');
insert into member(name) values('���̹�');
insert into member(name) values('�̹ڼ�');

select * from member where name like '_��';
select * from member where name not like '��%';
update member set name='�赵��' where name='���̹�'; 
select * from member where name like '%��%';

select * from notice;

insert into notice values(1, 'JDBC�� �����ΰ�?', 'newlec', 'aaa', sysdate, 1,'');
insert into notice values(2, 'JDBC ����̹� �ٿ�ε� ���', 'dragon', 'aaa', sysdate,12,'');
insert into notice values(3, '�Ķ���͸� ������ ���� �����ϱ�', 'good', 'aaa', sysdate,9,'');
insert into notice values(4, 'JSP���� JDBC ����ϱ�', 'dragon', 'aaa', sysdate,2,'');
insert into notice values(5, 'Service ���� �߰��ϱ�', 'good', 'qqq', sysdate,23,'');

select * from notice where title like 'J%';
select * from notice where title like '%�ϱ�%';
select * from notice where title like '%S%';

commit;