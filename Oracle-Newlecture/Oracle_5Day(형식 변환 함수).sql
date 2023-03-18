-- 형식 변환 함수
-- 숫자 <->  문자열 <-> 날짜

--NUMBER형식 -> 문자열(VARCHAR2) : 변환 TO_CHAR(NUMBER)
select trim(to_char(123456789.3, '999,999,999,999.99')) || '원' from dual;

--DATE형식 -> 문자열(VARCHAR2) : TO_CHAR(DATETIME, 날짜포맷)
--DATE형식은 문자열이 아님을 주의
select to_char(sysdate, 'yyyy/mm/dd pm hh24:mi') from dual;

--문자열형식(VARCHAR2) -> DATE형식 : TO_DATE(문자열, 날짜포맷)
select TO_date('2022-02-22 12:23:03', 'yyyy-mm-dd hh24:mi:ss') from dual;

select TO_TIMESTAMP('2022-02-22 12:23:03', 'yyyy-mm-dd hh24:mi:ss') from dual;

--문자열형식(VARCHAR2)-> NUMBER형식 : TO_NUMBER(문자열)
select to_number('2023') from dual;

select '2'+3 덧셈 from dual;
select to_number('2')+3 덧셈 from dual;

