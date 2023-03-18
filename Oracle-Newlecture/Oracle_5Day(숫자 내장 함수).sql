-- 절대값을 구하는 함수 ABS(n)
select abs(35), abs(-35) from dual;

-- 음수/양수를 알려주는 함수 SIGN(n)
select sign(35), sign(-35) from dual;

-- 숫자의 반올림 값을 알려주는 함수 ROUND(n,i)
select round(34.456789), round(34.56789) from dual;
select round(12.3456789,2) , round(12.3456789,3) from dual;

-- 숫자의 나머지 값을 반환하는 함수 MOD(n1, n2)
select trunc(17/5) 몫, mod(17,5) 나머지 from dual;

--숫자의 제곱을 구하는 함수 power(n1, n2) / 제곱근을 구하는 함수 sqrt(n)
select power(5, 2), sqrt(25)from dual;