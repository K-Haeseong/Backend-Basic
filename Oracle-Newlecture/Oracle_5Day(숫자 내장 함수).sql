-- ���밪�� ���ϴ� �Լ� ABS(n)
select abs(35), abs(-35) from dual;

-- ����/����� �˷��ִ� �Լ� SIGN(n)
select sign(35), sign(-35) from dual;

-- ������ �ݿø� ���� �˷��ִ� �Լ� ROUND(n,i)
select round(34.456789), round(34.56789) from dual;
select round(12.3456789,2) , round(12.3456789,3) from dual;

-- ������ ������ ���� ��ȯ�ϴ� �Լ� MOD(n1, n2)
select trunc(17/5) ��, mod(17,5) ������ from dual;

--������ ������ ���ϴ� �Լ� power(n1, n2) / �������� ���ϴ� �Լ� sqrt(n)
select power(5, 2), sqrt(25)from dual;