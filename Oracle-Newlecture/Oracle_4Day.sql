-- https://regexlib.com/CheatSheet.aspx : ���Խ� ����Ʈ
select * from notice;

insert into notice values ('6', '��ȭ��ȣ�� �����ֽñ� �ٶ��ϴ�. 010-2212-3432', 'queset', '����ó�� ����ϴ�.', sysdate, '2', '');
insert into notice values ('7', '����-����-�׸� �� ��������~~', 'okay', 'soso', sysdate, '4', '');

select * from notice where regexp_like(title,'01[016-9]-\d{3,4}-\d{4}');
-- ���Խ� ����  : ^, ���Խ� ��    : $, '^---$' : ����ǥ���� ����� �� �´°͸� ã��(�յڿ� �����߰� �ɰ�� ã�� �Ұ���)
-- '01[016-9]-\d{3,4}-\d{4}' : �̷������� ���� �ؾ� �յڿ� �ٸ� ������ �־ ã�� ������
-- {}:�ݺ�����, []:���Խ�ų ����, \d:���ڵ���, \D:���ڵ����� X, \w : ���ڵ���
-- * : (����/����)0���̻�, + : (����/����)1���̻�, | : �ܾ �ϳ��� ��� or ������ ���(org|com|net)
-- where regexp_like ���Խ����� �ۼ��� ������ ��ȸ�� �� ���

select * from notice where rownum between 1 and 5;

select * from (select ROWNUM num, notice.* from notice) where num between 5 and 7;

select * from member;

update member set name='�����', id='kim', pwd='111', age='29' where name='�����';
update member set name='���缮', id='yoo', pwd='123', age='40' where name='����';
update member set name='ŷ����', id='king', pwd='222', age='100' where name='�赵��';
update member set name='��븸', id='yong', pwd='333', age='29' where name='�̹ڼ�';
update member set name='����', age='35' where id='newlec';
update member set name='�տ���', age='25', pwd='222' where id='dragon';
insert into member values ('kang', '111', '��ȣ��', '','','','','','35');

select distinct age from member;

commit;


