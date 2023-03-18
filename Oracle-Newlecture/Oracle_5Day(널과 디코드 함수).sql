-- NULL 관련 함수
-- NVL(NULL, 대체값) : 반환 값이 NULL일 경우에 대체 값을 제공 
select name,age from member;
update member set age='' where name in ('킹세종','손오공');
select nvl(age, 0) from member;

-- NVL2(입력값,NOTNULL 대체값, NULL대체값) : NVL2(NVL에서 조건을 하나 더 확장)
select nvl2(age, Trunc(age/10)*10 || '대', 0) from member;

-- NULLIF(값1, 값2) : 두 값이 같은 경우 NULL 그렇지 않은 경우 첫 번째 값 반환
select name, age from member;
select name, NULLIF(age,19) from member;

-- 조건에 따른 값 선택하기 DECODE(기준값, 비교값, 출력값, 비교값, 출력값)
select name,gender, pwd from member;
update member set gender='남성';
update member set gender='여성' where pwd='222';

select name,gender, decode(gender,'남성', 1, 2) from member;

select * from member;