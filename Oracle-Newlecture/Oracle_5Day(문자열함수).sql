--문자열 추출함수 substr(문자열, 시작위치, 길이)
select substr('hello',1,3)from dual;
select substr('hello',3)from dual;
select substrb('hello',3)from dual;

select substrb(name,3) from member;

select * from member;

update member set birthday='2000/03/14' where name='뉴렉';
update member set birthday='2000/04/14' where name='손오공';
update member set birthday='2000/05/14' where name='강호동';
update member set birthday='2000/06/14' where name='김두한';
update member set birthday='2000/07/14' where name='유재석';
update member set birthday='2000/08/14' where name='킹세종';
update member set birthday='2000/09/14' where name='김용만';


update member set member.phone='010-1234-1111';
update member set member.phone='011-2222-3333' where name='강호동';
update member set member.phone='011-4444-3333' where name='뉴렉';
update member set member.phone='011-6666-3333' where name='유재석';


--모든 학생의 이름과 출생 월만을 조회하시오
select * from member;

select name, substr(birthday,6,2) from member;
select name, substr(birthday,6,2) Month from member;


--회원 중에서 전화번호가 011으로 시작하는 회원의 모든 정보를 출력하시오.
select * from member;

select * from member where regexp_like(phone,'011-\w+');
select * from member where phone like '011%';
select * from member where substr(phone,1,3)='011';

--회원 중에서 생년 월이 7,8,9월인 회원의 모든 정보를 출력하시오.
select * from member;

select * from  member where substr(birthday,6,2) in ('07','08','09');
select * from  member where substr(birthday,7,1) between 7 and 9;

--전화번호를 등록하지 않은 회원 중에서 생년 월이 7,8,9월인 회원의 모든 정보를 출력
select * from member;
update member set phone='' where substr(birthday,6,2) in ('07','09');

select * from member where phone is null and substr(birthday,6,2) in ('07','08','09');

--문자열 덧셈함수 CONCAT (참고로 ||기억하기)

--문자열 트림함수 LTRIM(왼쪽 공백 지우기), RTRIM(오른쪽 공백 지우기), TRIM(양쪽 공백 지우기)

--문자열 대문자 또는 소문자로 변경 UPPER/LOWER
--(회원의 아이디를 대/소문자 가리지 않고 조회할 때 사용)
select lower('NewLec') from dual;
select upper('NewLec') from dual;

select * from member;
select * from member where id = lower('NewLec');

COMMIT;
--문자열 대치함수 REPLACE(문자열, 찾는 문자열, 바뀌어서 들어갈 문자열)
-- TRANSLATE : 글자가 하나씩 매칭 되어 바뀜
select replace('where we are','we', 'you') from dual;
select TRANSLATE('where we are','we', 'you') from dual;

--회원의 이름과 주소를 조회하시오.(단, 주소는 빈칸 없이 출력하시오)
select * from member;

update member set member.address='서울특별시 강남구';
update member set member.address='경기도 성남시 분당구' where pwd like '%3%';

select name, replace(member.address,' ', '')from member;

--문자열 패딩함수(문자열, 출력글자수, 공백에 채울 글자)
select lpad('hello', 5) from dual; --패딩 영역이 없어서 채워지는 문자가 없음
select lpad('hello', 5, '0') from dual; --패딩 영역이 없어서 채워지는 문자가 없음
select lpad('hello', 10, '0') from dual; --왼쪽 빈칸에 문자 채움
select rpad('hello', 10, '0') from dual; --오른쪽 빈칸에 문자 채움

-- 첫 글자를 대문자로 바꾸는 함수 INITCAP(문자열)
select initcap('the important thing is ...') from dual;
select initcap('the im에이치portant t오케이hing is ...') from dual;


-- 문자열 검색 함수 INSTR(문자열, 검색문자열, 위치, 찾을 수)
select instr('ALL WE NEED TO IS JUST TO...', 'TO')from dual;
select instr('ALL WE NEED TO IS JUST TO...', 'TO', 15)from dual;
select instr('ALL WE NEED TO IS JUST TO...', 'TO', 1, 2)from dual;

-- 회원의 전화번호에서 두 번째 대시(-) 문자가 존재하는 위치를 출력하시오.
select instr(phone,'-', 1, 2) from member;

-- 회원의 전화번호에서 첫 번째 대시(-) 문자와 두 번째 대시(-) 문자가 사이의 간격은?
select instr(phone,'-', 1, 2)- instr(phone,'-', 1, 1) -1 from member; 

-- 회원의 전화번호에서 첫 번째와 두 번째 사이의 국번을 출력하시오.
select substr(phone, instr(phone,'-', 1, 1)+1, instr(phone,'-', 1, 2)- instr(phone,'-', 1, 1)-1) from member;


-- 문자열의 길이를 얻는 함수 LENGTH
select length('where we are') from dual;

-- 모든 회원의 핸드폰 번호와 번호의 문자열 길이를 조회하시오.
select phone, length(phone) from member;

-- 문자'-'를 없앤 회원들의 전화번호의 길이를 출력하시오.
select length(replace(phone,'-','')) from member;


-- 코드값을 반환하는 함수 ASCII
select ascii('A') from dual;

-- 코드값으로 문자를 반환하는 함수 CHR
select chr(65) from dual;

select * from member;
commit;