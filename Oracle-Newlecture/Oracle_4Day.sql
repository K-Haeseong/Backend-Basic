-- https://regexlib.com/CheatSheet.aspx : 정규식 사이트
select * from notice;

insert into notice values ('6', '전화번호로 연락주시기 바랍니다. 010-2212-3432', 'queset', '연락처를 남깁니다.', sysdate, '2', '');
insert into notice values ('7', '선반-접시-그릇 이 세가지요~~', 'okay', 'soso', sysdate, '4', '');

select * from notice where regexp_like(title,'01[016-9]-\d{3,4}-\d{4}');
-- 정규식 시작  : ^, 정규식 끝    : $, '^---$' : 정규표현식 내용과 딱 맞는것만 찾음(앞뒤에 내용추가 될경우 찾기 불가능)
-- '01[016-9]-\d{3,4}-\d{4}' : 이런식으로 제거 해야 앞뒤에 다른 내용이 있어도 찾을 수있음
-- {}:반복개수, []:포함시킬 내용, \d:숫자들어옴, \D:숫자들어오면 X, \w : 문자들어옴
-- * : (문자/숫자)0개이상, + : (문자/숫자)1개이상, | : 단어를 하나로 묶어서 or 연산자 기능(org|com|net)
-- where regexp_like 정규식으로 작성된 것으로 조회할 때 사용

select * from notice where rownum between 1 and 5;

select * from (select ROWNUM num, notice.* from notice) where num between 5 and 7;

select * from member;

update member set name='김두한', id='kim', pwd='111', age='29' where name='김두한';
update member set name='유재석', id='yoo', pwd='123', age='40' where name='존박';
update member set name='킹세종', id='king', pwd='222', age='100' where name='김도박';
update member set name='김용만', id='yong', pwd='333', age='29' where name='이박수';
update member set name='뉴렉', age='35' where id='newlec';
update member set name='손오공', age='25', pwd='222' where id='dragon';
insert into member values ('kang', '111', '강호동', '','','','','','35');

select distinct age from member;

commit;


