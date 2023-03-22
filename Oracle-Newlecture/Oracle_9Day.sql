-- ��
create view notice_view
as
SELECT N.ID, N.TITLE, N.WRITER_ID, M.NAME WRITER_NAME, COUNT(C.ID) COMMENT_CNT
FROM MEMBER M RIGHT OUTER JOIN NOTICE N ON M.ID = N.WRITER_ID
LEFT OUTER JOIN "COMMENT" C ON N.ID = C.NOTICE_ID
GROUP BY N.ID, N.TITLE, N.WRITER_ID, M.NAME;

select * from notice_view;

-- ������ ��ųʸ�
select * from member;
select * from notice;
select * from dict;

select * from user_tables;
select * from user_tab_columns where table_name='member';

--��������(������/��ƼƼ/�����̼�)

--������ ��������(NOT NULL / DEFAULT)
INSERT INTO notice (
 
    title,
    writer_id
) VALUES (
   
    '9��° �Խñ�',
    'newlec'
);
select * from notice order by regdate desc;


--������ ��������(�⺻ CHECK)
select * from member;
insert into member(id, pwd, name, phone) values('newlec1', '111', '����', '010-AAAA-2222');

--������ ��������(���Խ� �̿� CHECK)
alter table member
drop constraint member_phone_chk1;

select * from user_constraints
where table_name ='MEMBER';

alter table member 
add CONSTRAINT member_phone_chk1 check(regexp_like(phone, '^01[01]-\d{3,4}-\d{4}$'));
select * from member;

-- Entity ��������(Primary Key / Unique)

-- ������(Sequence)
insert into notice(title, writer_id)
values('������ ����2','newlec');

select notice_id_seq.nextval from dual;

