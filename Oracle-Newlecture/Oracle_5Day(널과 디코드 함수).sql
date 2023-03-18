-- NULL ���� �Լ�
-- NVL(NULL, ��ü��) : ��ȯ ���� NULL�� ��쿡 ��ü ���� ���� 
select name,age from member;
update member set age='' where name in ('ŷ����','�տ���');
select nvl(age, 0) from member;

-- NVL2(�Է°�,NOTNULL ��ü��, NULL��ü��) : NVL2(NVL���� ������ �ϳ� �� Ȯ��)
select nvl2(age, Trunc(age/10)*10 || '��', 0) from member;

-- NULLIF(��1, ��2) : �� ���� ���� ��� NULL �׷��� ���� ��� ù ��° �� ��ȯ
select name, age from member;
select name, NULLIF(age,19) from member;

-- ���ǿ� ���� �� �����ϱ� DECODE(���ذ�, �񱳰�, ��°�, �񱳰�, ��°�)
select name,gender, pwd from member;
update member set gender='����';
update member set gender='����' where pwd='222';

select name,gender, decode(gender,'����', 1, 2) from member;

select * from member;