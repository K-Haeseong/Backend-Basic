-- SELECT ������ ����(ORDER BY)
-- SELECT ���� : SELECT, FROM , WHERE, GROUP BY, HAVING, ORDER BY(���� �߿�)

--ORDER BY
--ASC:��������(���), DSEC(��������)

UPDATE NOTICE SET TITLE='Service ���� �߰��ϱ�' WHERE TITLE ='Service ���� �߰��ϱ�';
SELECT * FROM NOTICE;
SELECT * FROM NOTICE ORDER BY HIT asc;

-- ȸ�� �߿��� '��'�� ���� ���� ȸ���� ��ȸ�Ͻÿ�.(��, ���̸� ������������ ����)
SELECT * FROM MEMBER; 
UPDATE MEMBER SET AGE=('21') WHERE NAME='�����';
SELECT * FROM MEMBER WHERE NAME LIKE '��%' ORDER BY AGE ASC;

-- HIT���� ���� ��� 2�� ���� ���ִ� ���
SELECT * FROM NOTICE ORDER BY HIT DESC, REGDATE DESC;

-- �����Լ� (SUM, MIN, MAX, COUNT, AVG)/where������ ��� �Ұ�
SELECT COUNT(TITLE) ���񰳼� FROM NOTICE;
delete notice where id='8';
insert into notice(id, regdate, hit, writer_id) values(8, sysdate, 3, 'newlec');

select * from notice;
select writer_id, count(id) from notice group by writer_id order by count(id) desc;
-- select�� �������
-- from -> connect by -> where -> group by -> having -> select -> order by

--ȸ���� �Խñ� ���� ��ȸ�Ͻÿ�. (��, �Խñ��� 2������ ���ڵ常 ����Ͻÿ�.)
select writer_id, count(id) from notice group by writer_id having count(id) < 2;


-- �����Լ�
select ROW_number() over (order by hit), id,title, writer_id, regdate, hit from notice;


select dense_rank() over (partition by writer_id order by hit desc), id,title, writer_id, regdate, hit 
from notice;
--order by hit;

--����ȸ(��������) : ���� �����ؾ��� �� ()�� ��� �����ٲ��ֱ�
select * 
from (select * from notice order by regdate desc) 
where rownum between 1 and 5;

-- ���̰� 30�̻��� ȸ�� ����� ��ȸ�Ͻÿ�
select * from member;
select * from member where age >=30;

-- ��ճ��� �̻��� ȸ���� ���Ͻÿ�
select * from member where  age >= (select avg(age) from member);

select * from notice;
select * from notice order by id asc;
commit;




