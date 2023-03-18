--���ڿ� �����Լ� substr(���ڿ�, ������ġ, ����)
select substr('hello',1,3)from dual;
select substr('hello',3)from dual;
select substrb('hello',3)from dual;

select substrb(name,3) from member;

select * from member;

update member set birthday='2000/03/14' where name='����';
update member set birthday='2000/04/14' where name='�տ���';
update member set birthday='2000/05/14' where name='��ȣ��';
update member set birthday='2000/06/14' where name='�����';
update member set birthday='2000/07/14' where name='���缮';
update member set birthday='2000/08/14' where name='ŷ����';
update member set birthday='2000/09/14' where name='��븸';


update member set member.phone='010-1234-1111';
update member set member.phone='011-2222-3333' where name='��ȣ��';
update member set member.phone='011-4444-3333' where name='����';
update member set member.phone='011-6666-3333' where name='���缮';


--��� �л��� �̸��� ��� ������ ��ȸ�Ͻÿ�
select * from member;

select name, substr(birthday,6,2) from member;
select name, substr(birthday,6,2) Month from member;


--ȸ�� �߿��� ��ȭ��ȣ�� 011���� �����ϴ� ȸ���� ��� ������ ����Ͻÿ�.
select * from member;

select * from member where regexp_like(phone,'011-\w+');
select * from member where phone like '011%';
select * from member where substr(phone,1,3)='011';

--ȸ�� �߿��� ���� ���� 7,8,9���� ȸ���� ��� ������ ����Ͻÿ�.
select * from member;

select * from  member where substr(birthday,6,2) in ('07','08','09');
select * from  member where substr(birthday,7,1) between 7 and 9;

--��ȭ��ȣ�� ������� ���� ȸ�� �߿��� ���� ���� 7,8,9���� ȸ���� ��� ������ ���
select * from member;
update member set phone='' where substr(birthday,6,2) in ('07','09');

select * from member where phone is null and substr(birthday,6,2) in ('07','08','09');

--���ڿ� �����Լ� CONCAT (����� ||����ϱ�)

--���ڿ� Ʈ���Լ� LTRIM(���� ���� �����), RTRIM(������ ���� �����), TRIM(���� ���� �����)

--���ڿ� �빮�� �Ǵ� �ҹ��ڷ� ���� UPPER/LOWER
--(ȸ���� ���̵� ��/�ҹ��� ������ �ʰ� ��ȸ�� �� ���)
select lower('NewLec') from dual;
select upper('NewLec') from dual;

select * from member;
select * from member where id = lower('NewLec');

COMMIT;
--���ڿ� ��ġ�Լ� REPLACE(���ڿ�, ã�� ���ڿ�, �ٲ� �� ���ڿ�)
-- TRANSLATE : ���ڰ� �ϳ��� ��Ī �Ǿ� �ٲ�
select replace('where we are','we', 'you') from dual;
select TRANSLATE('where we are','we', 'you') from dual;

--ȸ���� �̸��� �ּҸ� ��ȸ�Ͻÿ�.(��, �ּҴ� ��ĭ ���� ����Ͻÿ�)
select * from member;

update member set member.address='����Ư���� ������';
update member set member.address='��⵵ ������ �д籸' where pwd like '%3%';

select name, replace(member.address,' ', '')from member;

--���ڿ� �е��Լ�(���ڿ�, ��±��ڼ�, ���鿡 ä�� ����)
select lpad('hello', 5) from dual; --�е� ������ ��� ä������ ���ڰ� ����
select lpad('hello', 5, '0') from dual; --�е� ������ ��� ä������ ���ڰ� ����
select lpad('hello', 10, '0') from dual; --���� ��ĭ�� ���� ä��
select rpad('hello', 10, '0') from dual; --������ ��ĭ�� ���� ä��

-- ù ���ڸ� �빮�ڷ� �ٲٴ� �Լ� INITCAP(���ڿ�)
select initcap('the important thing is ...') from dual;
select initcap('the im����ġportant t������hing is ...') from dual;


-- ���ڿ� �˻� �Լ� INSTR(���ڿ�, �˻����ڿ�, ��ġ, ã�� ��)
select instr('ALL WE NEED TO IS JUST TO...', 'TO')from dual;
select instr('ALL WE NEED TO IS JUST TO...', 'TO', 15)from dual;
select instr('ALL WE NEED TO IS JUST TO...', 'TO', 1, 2)from dual;

-- ȸ���� ��ȭ��ȣ���� �� ��° ���(-) ���ڰ� �����ϴ� ��ġ�� ����Ͻÿ�.
select instr(phone,'-', 1, 2) from member;

-- ȸ���� ��ȭ��ȣ���� ù ��° ���(-) ���ڿ� �� ��° ���(-) ���ڰ� ������ ������?
select instr(phone,'-', 1, 2)- instr(phone,'-', 1, 1) -1 from member; 

-- ȸ���� ��ȭ��ȣ���� ù ��°�� �� ��° ������ ������ ����Ͻÿ�.
select substr(phone, instr(phone,'-', 1, 1)+1, instr(phone,'-', 1, 2)- instr(phone,'-', 1, 1)-1) from member;


-- ���ڿ��� ���̸� ��� �Լ� LENGTH
select length('where we are') from dual;

-- ��� ȸ���� �ڵ��� ��ȣ�� ��ȣ�� ���ڿ� ���̸� ��ȸ�Ͻÿ�.
select phone, length(phone) from member;

-- ����'-'�� ���� ȸ������ ��ȭ��ȣ�� ���̸� ����Ͻÿ�.
select length(replace(phone,'-','')) from member;


-- �ڵ尪�� ��ȯ�ϴ� �Լ� ASCII
select ascii('A') from dual;

-- �ڵ尪���� ���ڸ� ��ȯ�ϴ� �Լ� CHR
select chr(65) from dual;

select * from member;
commit;