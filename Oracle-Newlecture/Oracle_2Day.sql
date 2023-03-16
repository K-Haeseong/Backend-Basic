CREATE TABLE NOTICE
( 
    ID  NUMBER,
    TITLE NVARCHAR2(100),
    WRITER_ID   NVARCHAR2(50),
    CONTENT     CLOB,
    REGATE  TIMESTAMP,
    HIT NUMBER,
    FILES   NVARCHAR2(1000)
    );
    
    
CREATE  TABLE  "COMMENT" 
(
    ID  NUMBER,
        CONTENT NVARCHAR2(2000),
        REGDATE TIMESTAMP,
        WRITER_ID   NVARCHAR2(50),
        NOTICE_ID   NUMBER
 );
 
 CREATE TABLE ROLE
 (
    ID  VARCHAR2(50),
    DISCRIPTION   NVARCHAR2(500)
 );
 
 CREATE TABLE MEMBER_ROLE
 (
    MEMBER_ID   NVARCHAR2(50),
    ROLE_ID     VARCHAR2(50)
 );
 
INSERT INTO MEMBER(ID, PWD) VALUES('newlec', '111');
INSERT INTO MEMBER(ID, PWD) VALUES('test', '111');
select*from member;
select id "USER ID", name, pwd from member;

update member set pwd='333', name='¼Õ¿À°ø' where id='dragon';
delete member where id='test';


 
 