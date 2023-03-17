insert into member(id, pwd) values('test', '111');

UPDATE member set pwd='111', name='오공' where id ='dragon';


SELECT id "USER ID", name, pwd from member;
delete member where id ='test';

COMMIT;
rollback;

select hit+1 hit from notice;
select name, id, pwd from member;

insert into notice(HIT) values('1');
insert into notice(HIT) values('12');
insert into notice(HIT) values('9');
insert into notice(HIT) values('2');
insert into notice(HIT) values('23');

delete notice where hit in ('1','12','9','2','23');

select 1+'3' from dual; 
--더미테이블을 활용해서 화면에 출력
-- '+'는 숫자만 연산해주는 연산자
-- '||'는 문자열을 연산해주는 연산자

select * from notice where writer_id ='newlec';

select * from notice where HIT > 3;

select * from notice where content is null;

select * from notice where 0 <= hit AND hit <= 2;
select * from notice where hit between 0 and 2;

select * from notice where hit in (0,2,7);

select * from notice where hit not in (0,2,7);

select * from member;
delete member where name in ('박하나', '홍길동', '김이박', '이박수');
insert into member(name) values('박하나');
insert into member(name) values('존박');
insert into member(name) values('김이박');
insert into member(name) values('이박수');

select * from member where name like '_박';
select * from member where name not like '박%';
update member set name='김도박' where name='김이박'; 
select * from member where name like '%도%';

select * from notice;

insert into notice values(1, 'JDBC란 무엇인가?', 'newlec', 'aaa', sysdate, 1,'');
insert into notice values(2, 'JDBC 드라이버 다운로드 방법', 'dragon', 'aaa', sysdate,12,'');
insert into notice values(3, '파라미터를 가지는 문장 실행하기', 'good', 'aaa', sysdate,9,'');
insert into notice values(4, 'JSP에서 JDBC 사용하기', 'dragon', 'aaa', sysdate,2,'');
insert into notice values(5, 'Service 계층 추가하기', 'good', 'qqq', sysdate,23,'');

select * from notice where title like 'J%';
select * from notice where title like '%하기%';
select * from notice where title like '%S%';

commit;