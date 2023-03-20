-- SELECT 구절과 정렬(ORDER BY)
-- SELECT 구절 : SELECT, FROM , WHERE, GROUP BY, HAVING, ORDER BY(순서 중요)

--ORDER BY
--ASC:오름차순(기몬), DSEC(내림차순)

UPDATE NOTICE SET TITLE='Service 계층 추가하기' WHERE TITLE ='Service 꼐층 추가하기';
SELECT * FROM NOTICE;
SELECT * FROM NOTICE ORDER BY HIT asc;

-- 회원 중에서 '김'씨 성을 가진 회원을 조회하시오.(단, 나이를 오름차순으로 정렬)
SELECT * FROM MEMBER; 
UPDATE MEMBER SET AGE=('21') WHERE NAME='김두한';
SELECT * FROM MEMBER WHERE NAME LIKE '김%' ORDER BY AGE ASC;

-- HIT수가 같은 경우 2차 정렬 해주는 방법
SELECT * FROM NOTICE ORDER BY HIT DESC, REGDATE DESC;

-- 집계함수 (SUM, MIN, MAX, COUNT, AVG)/where절에는 사용 불가
SELECT COUNT(TITLE) 제목개수 FROM NOTICE;
delete notice where id='8';
insert into notice(id, regdate, hit, writer_id) values(8, sysdate, 3, 'newlec');

select * from notice;
select writer_id, count(id) from notice group by writer_id order by count(id) desc;
-- select절 실행순서
-- from -> connect by -> where -> group by -> having -> select -> order by

--회원별 게시글 수를 조회하시오. (단, 게시글이 2이하인 레코드만 출력하시오.)
select writer_id, count(id) from notice group by writer_id having count(id) < 2;


-- 순위함수
select ROW_number() over (order by hit), id,title, writer_id, regdate, hit from notice;


select dense_rank() over (partition by writer_id order by hit desc), id,title, writer_id, regdate, hit 
from notice;
--order by hit;

--부조회(서브쿼리) : 먼저 진행해야할 것 ()로 묶어서 순서바꿔주기
select * 
from (select * from notice order by regdate desc) 
where rownum between 1 and 5;

-- 나이가 30이상인 회원 목록을 조회하시오
select * from member;
select * from member where age >=30;

-- 평균나이 이상인 회원을 구하시오
select * from member where  age >= (select avg(age) from member);

select * from notice;
select * from notice order by id asc;
commit;




