-- ���� ��ȯ �Լ�
-- ���� <->  ���ڿ� <-> ��¥

--NUMBER���� -> ���ڿ�(VARCHAR2) : ��ȯ TO_CHAR(NUMBER)
select trim(to_char(123456789.3, '999,999,999,999.99')) || '��' from dual;

--DATE���� -> ���ڿ�(VARCHAR2) : TO_CHAR(DATETIME, ��¥����)
--DATE������ ���ڿ��� �ƴ��� ����
select to_char(sysdate, 'yyyy/mm/dd pm hh24:mi') from dual;

--���ڿ�����(VARCHAR2) -> DATE���� : TO_DATE(���ڿ�, ��¥����)
select TO_date('2022-02-22 12:23:03', 'yyyy-mm-dd hh24:mi:ss') from dual;

select TO_TIMESTAMP('2022-02-22 12:23:03', 'yyyy-mm-dd hh24:mi:ss') from dual;

--���ڿ�����(VARCHAR2)-> NUMBER���� : TO_NUMBER(���ڿ�)
select to_number('2023') from dual;

select '2'+3 ���� from dual;
select to_number('2')+3 ���� from dual;

