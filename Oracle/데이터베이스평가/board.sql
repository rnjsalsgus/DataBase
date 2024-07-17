-- ī�� �Խ��� �����ͺ��̽�

-- ����� ���̺�
create table board_user(
    id varchar2(50) primary key,
    name varchar2(50) not null,
    password varchar2(300) not null,
    phone varchar2(100),
    email varchar2(100) not null unique
);

-- ����� ���̺� ������ ����
insert into board_user values('U001','�ǹ���','a552266','010-0000-0000','kwon001@naver.com');
insert into board_user values('U002','������','a72539','010-0000-1111','lee001@naver.com');
insert into board_user values('U003','�����','qwe123','010-1111-0000','kim001@naver.com');
insert into board_user values('U004','������','q1w2e3r4','010-2222-1111','kang001@naver.com');
insert into board_user values('U005','���缷','753ggdd2','010-0000-2222','kim002@naver.com');

-- �Խ��� ���̺�
create table board(
    board_id number primary key,
    title varchar2(300) default '�ӽ�����',
    content long not null,
    user_id varchar2(50),
    create_date timestamp default systimestamp
);

alter table board modify(create_date date default current_date);
alter session set nls_date_format='yyyy-mm-dd hh:mi:ss';

insert into board(board_id,title,content,user_id)
values(1,'hello','hello everyone','U001');
insert into board(board_id,title,content,user_id)
values(2,'hi','hi everyone','U001');
insert into board(board_id,title,content,user_id)
values(3,'goodmorning','goodmorning everyone','U001');
insert into board(board_id,title,content,user_id)
values(4,'goodafternoon','goodafternoon everyone','U002');
insert into board(board_id,title,content,user_id)
values(5,'goodbye','goodbye everyone','U002');
insert into board(board_id,title,content,user_id)
values(6,'bye','bye everyone','U004');
insert into board(board_id,title,content,user_id)
values(7,'goodevening','goodevening everyone','U004');
insert into board(board_id,title,content,user_id)
values(8,'Welcome','Welcome everyone','U004');
insert into board(board_id,title,content,user_id)
values(9,'indroduce','my name is Kang','U004');
insert into board(board_id,title,content,user_id)
values(10,'�ȳ�','�ȳ��ϼ��� ��ε�','U005');
insert into board(board_id,title,content,user_id)
values(11,'���ɸ޴�','�޴� ��õ ���ּ���','U005');
insert into board(board_id,title,content,user_id)
values(12,'�߽�','�߽� ��õ ��','U005');
insert into board(board_id,title,content,user_id)
values(13,'������õ','����޴� ��õ','U005');
insert into board(board_id,title,content,user_id)
values(14,default,'�ݰ����ϴ� ������','U005');

select * from board;

-- ��� ���̺�
create table reply(
    id number primary key,
    re_content varchar2(300),
    create_date date default sysdate,
    user_id varchar2(50),
    board_id number,
    foreign key(user_id) references board_user(id),
    foreign key(board_id) references board(board_id)
);

insert into reply(id,re_content,user_id,board_id) values(1,'hi','U003',1);
insert into reply(id,re_content,user_id,board_id) values(2,'hello','U002',1);
insert into reply(id,re_content,user_id,board_id) values(3,'goodmorning','U002',2);
insert into reply(id,re_content,user_id,board_id) values(4,'bye','U001',5);
insert into reply(id,re_content,user_id,board_id) values(5,'�ȳ��ϼ���','U001',7);
insert into reply(id,re_content,user_id,board_id) values(6,'goodmorning','U005',3);
insert into reply(id,re_content,user_id,board_id) values(7,'����','U005',11);
insert into reply(id,re_content,user_id,board_id) values(8,'ġŲ�̿�','U005',13);
insert into reply(id,re_content,user_id,board_id) values(9,'����','U002',12);
insert into reply(id,re_content,user_id,board_id) values(10,'�ݰ�����','U002',9);
insert into reply(id,re_content,user_id,board_id) values(11,'�������','U001',8);
insert into reply(id,re_content,user_id,board_id) values(12,'�ʹ�','U004',11);
insert into reply(id,re_content,user_id,board_id) values(13,'���ڸ���','U005',13);
insert into reply(id,re_content,user_id,board_id) values(14,'�ݰ����ϴ�','U004',14);
insert into reply(id,re_content,user_id,board_id) values(15,'�ݰ�����','U002',14);
insert into reply(id,re_content,user_id,board_id) values(16,'�������','U001',14);

select * from reply;
-- sql��

-- 1.board���̺��� ��¥ ������Ÿ��,���� ����
alter table board modify(create_date date default sysdate);
alter session set nls_date_format='yyyy-mm-dd hh:mi:ss';

-- 2. board_id�� 10���� �� ���� ����
update board set title='�ȳ��ϼ���!' where board_id=10;

-- 3. ��� ���̺� ����
drop table reply;

-- 4. ����� 0���� �Խñ� ����
delete from board where board_id in (
    select b.board_id from board b left join reply r on b.board_id=r.board_id
    where r.id is null);

-- 5. ��ü ����� ��ȸ
select *from board_user;

-- 6. �Խñ� ��ü ��� ��ȸ
select title,create_date from board;

-- 7. �Խñ� ����� �� ����
select sum(count(*))
from reply r
group by r.id;

-- 8. �Խñۺ� ��� ����(���� �������� ��������) ��ȸ
select b.title,count(*)
from board b, reply r where b.board_id=r.board_id
group by b.title
order by count(*) desc;

-- 9.����� ���� ���� �Խñ� ��ȸ
select b.title,count(*) "��� ��"
from board b,reply r where b.board_id=r.board_id
group by b.title
having count(*)=(select max(count(*))
                from board b, reply r
                where b.board_id=r.board_id
                group by b.board_id);

-- 10.����ں� �ۼ��� �Խñ� ��
select u.id, u.name, count(*) "�Խñ� ��"
from board_user u,board b where u.id=b.user_id
group by u.id,u.name;

-- 11.�Խñ��� �ۼ����� ���� ����� ��ȸ
select u.id,u.name
from board_user u left join board b on u.id=b.user_id
where b.board_id is null;

-- 12. 'U005' ����ڰ� �ۼ��� �Խñ� ��� ��ȸ
select u.id,b.title
from board_user u,board b where u.id=b.user_id
and u.id='U005';

-- 13.����ں� ��� ���� ��ȸ
select u.id,u.name,count(*)
from board_user u,reply r where u.id=r.user_id
group by u.id,u.name;

-- 14.'U002'������ �ۼ��� ��� ��� ��ȸ
select re_content
from board_user u, reply r where u.id=r.user_id
and u.id='U002';

-- 15. ����� 3�� �̻� �ۼ��� ����� ��ȸ
select u.id,u.name
from board_user u,reply r where u.id=r.user_id
group by u.id,u.name
having count(*)>=3;

-- 16. ����� ���帹�� �ۼ��� ����� ��ȸ
select u.name,count(*) "��� ��"
from board_user u, reply r where u.id=r.user_id
group by u.name
having count(*)=(select max(count(*)) from board_user u, reply r where u.id=r.user_id
                 group by u.id);

-- 17. �Խñ� ������ �ӽ������� �Խñ��� �� ����� ��ȸ                
select u.id,u.name
from board_user u,board b where u.id=b.user_id
and b.title='�ӽ�����';

-- 18. ����� ���� ���� �Խñ��� �ۼ��� �������ȸ
select u.id,u.name
from board_user u, board b where u.id=b.user_id
group by u.id,u.name,b.title
having b.title=(select b.title
                from board b,reply r where b.board_id=r.board_id
                group by b.title
                having count(*)=(select max(count(*))
                                 from board b, reply r
                                 where b.board_id=r.board_id
                                 group by b.board_id));

-- 19. �Խñ��� �ۼ����� ���� ����ڰ� �ۼ��� ��� ��ȸ

select r.id,r.re_content
from reply r,board_user u where r.user_id=u.id
and u.id=(select u.id from board_user u left join board b on u.id=b.user_id
          where b.board_id is null)
group by r.id,r.re_content;

-- 20. '���缷' ����ڿ� �ۼ��� ��� ���� ���� ����� ��ȸ
select u.name
from board_user u, reply r where u.id=r.user_id and u.name not like '���缷'
group by u.name
having count(*)=(select count(*) from board_user u,reply r 
                where u.id=r.user_id and u.name like '���缷'
                group by u.id);
                
-- 21. ����� ���� ���� �ۼ��� ����ڰ� �Խ��� �Խñ� ��� ��ȸ
select b.board_id,b.title,u.name
from board b,board_user u where b.user_id=u.id
and u.id=(select u.id
          from board_user u, reply r where u.id=r.user_id
          
          group by u.id
          having count(*)=(select max(count(*)) from board_user u,reply r 
                           where u.id=r.user_id
                           group by u.id));

















