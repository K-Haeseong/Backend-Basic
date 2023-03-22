-- 뷰
create view notice_view
as
SELECT N.ID, N.TITLE, N.WRITER_ID, M.NAME WRITER_NAME, COUNT(C.ID) COMMENT_CNT
FROM MEMBER M RIGHT OUTER JOIN NOTICE N ON M.ID = N.WRITER_ID
LEFT OUTER JOIN "COMMENT" C ON N.ID = C.NOTICE_ID
GROUP BY N.ID, N.TITLE, N.WRITER_ID, M.NAME;

select * from notice_view;

-- 데이터 딕셔너리
select * from member;
select * from notice;
select * from dict;

select * from user_tables;
select * from user_tab_columns where table_name='member';

--제약조건(도메인/엔티티/릴레이션)

--도메인 제약조건(NOT NULL / DEFAULT)
INSERT INTO notice (
 
    title,
    writer_id
) VALUES (
   
    '9번째 게시글',
    'newlec'
);
select * from notice order by regdate desc;


--도메인 제약조건(기본 CHECK)
select * from member;
insert into member(id, pwd, name, phone) values('newlec1', '111', '뉴렉', '010-AAAA-2222');

--도메인 제약조건(정규식 이용 CHECK)
alter table member
drop constraint member_phone_chk1;

select * from user_constraints
where table_name ='MEMBER';

alter table member 
add CONSTRAINT member_phone_chk1 check(regexp_like(phone, '^01[01]-\d{3,4}-\d{4}$'));
select * from member;

-- Entity 제약조건(Primary Key / Unique)

-- 시퀀스(Sequence)
insert into notice(title, writer_id)
values('시퀀스 예제2','newlec');

select notice_id_seq.nextval from dual;

