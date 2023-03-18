-- 날짜 함수

-- 현재 시간을 얻는 함수
select sysdate, current_date, systimestamp, current_timestamp from dual;

-- 세션 시간과 포맷 변경
select sysdate, current_date from dual;
alter session set nls_date_format = 'yyyy-mm-dd hh24:mi:ss';
alter session set time_zone = '09:00';

-- 날짜 추출함수 EXTRACT(YEAR/MONTH/DAY/HOUR/MINUTE/SECOND FROM...)

-- 가입 회원 중에 비수기(2,3,11,12)월 달에 가입한 회원을 조회하시오.
update member set regdate='2023-01-12' where name='뉴렉';
update member set regdate='2023-02-12' where name='손오공';
update member set regdate='2023-03-12' where name='강호동';
update member set regdate='2022-04-12' where name='김두한';
update member set regdate='2022-05-12' where name='유재석';
update member set regdate='2022-06-12' where name='킹세종';
update member set regdate='2022-07-12' where name='김용만';
select * from member;

select extract(month from sysdate) || '월' from dual;
select * from member where extract(month from regdate) in (2,3,11,12);

-- 날짜를 누적하는 함수 ADD_MONTHS(날짜, 정수)
select add_months(sysdate,1) from dual;
select add_months(sysdate,-1) from dual;

-- 가입 회원 중에 가입한지 6개월이 안 되는 회원을 조회하시오.
select * from member where add_months(sysdate, -6) < regdate;
select * from member where add_months(sysdate, -6) >= regdate;

-- 날짜의 차이를 알아내는 함수 MONTHS_BETWEEN(날짜, 날짜)
select * from member where months_between(sysdate, regdate) < 6;
select months_between(sysdate, regdate) from member;

-- 다음 요일을 알려주는 함수 next_day(현재날짜, 다음요일)
select next_day(sysdate, '토요일') from dual;
select next_day(sysdate, '토') from dual;
select next_day(sysdate, '7') from dual; -- 일-1, 월-2, 화-3, 수-4 ...

-- 월의 마지막 일자를 알려주는 함수 LAST_DAY(날짜)
select last_day(sysdate) from dual;

-- 지정된 범위에서 날짜를 반올림하는 함수 ROUND / 자르는 함수 TRUNC(날짜, 포멧)

commit;