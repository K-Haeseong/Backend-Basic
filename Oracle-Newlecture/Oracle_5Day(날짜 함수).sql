-- ��¥ �Լ�

-- ���� �ð��� ��� �Լ�
select sysdate, current_date, systimestamp, current_timestamp from dual;

-- ���� �ð��� ���� ����
select sysdate, current_date from dual;
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
alter session set time_zone = '09:00';

-- ��¥ �����Լ� EXTRACT(YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM...)

-- ���� ȸ�� �߿� �����(2,3,11,12)�� �޿� ������ ȸ���� ��ȸ�Ͻÿ�.
update member set regdate='2023-01-12' where name='����';
update member set regdate='2023-02-12' where name='�տ���';
update member set regdate='2023-03-12' where name='��ȣ��';
update member set regdate='2022-04-12' where name='�����';
update member set regdate='2022-05-12' where name='���缮';
update member set regdate='2022-06-12' where name='ŷ����';
update member set regdate='2022-07-12' where name='��븸';
select * from member;

select extract(month from sysdate) || '��' from dual;
select * from member where extract(month from regdate) in (2,3,11,12);

-- ��¥�� �����ϴ� �Լ� ADD_MONTHS(��¥, ����)
select add_months(sysdate,1) from dual;
select add_months(sysdate,-1) from dual;

-- ���� ȸ�� �߿� �������� 6������ �� �Ǵ� ȸ���� ��ȸ�Ͻÿ�.
select * from member where add_months(sysdate, -6) < regdate;
select * from member where add_months(sysdate, -6) >= regdate;

-- ��¥�� ���̸� �˾Ƴ��� �Լ� MONTHS_BETWEEN(��¥, ��¥)
select * from member where months_between(sysdate, regdate) < 6;
select months_between(sysdate, regdate) from member;

-- ���� ������ �˷��ִ� �Լ� next_day(���糯¥, ��������)
select next_day(sysdate, '�����') from dual;
select next_day(sysdate, '��') from dual;
select next_day(sysdate, '7') from dual; -- ��-1, ��-2, ȭ-3, ��-4 ...

-- ���� ������ ���ڸ� �˷��ִ� �Լ� LAST_DAY(��¥)
select last_day(sysdate) from dual;

-- ������ �������� ��¥�� �ݿø��ϴ� �Լ� ROUND / �ڸ��� �Լ� TRUNC(��¥, ����)

commit;