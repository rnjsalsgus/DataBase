-- ���б� �����ͺ��̽�

-- �л�����, �а�, ��������, ��������, ������û ���̺�

-- �л�����(id,�̸�,�ּ�,����ȣ,�г�,�̸���,�а�)
create table student(
    stu_id number primary key,
    stu_name varchar2(50) not null,
    stu_add varchar(150) not null,
    stu_phone varchar2(50) not null ,
    grade number not null,
    stu_email varchar(100) not null unique,
    major_id number
);

-- �л� ������ ����
insert into student values(1,'�ǹ���','�λ�','010-0000-0000',3,'kwon001@naver.com',1);
insert into student values(2,'������','�λ�','010-0000-1111',1,'lee001@naver.com',4);
insert into student values(3,'�����','�Ⱦ�','010-1111-0000',2,'kim001@naver.com',2);
insert into student values(4,'������','����','010-2222-1111',2,'kang001@naver.com',3);
insert into student values(5,'���缷','â��','010-0000-2222',4,'kim002@naver.com',5);
insert into student values(6,'������','�λ�','010-1000-0000',1,'lee002@naver.com',5);
insert into student values(7,'����ȣ','�λ�','010-0100-1111',1,'park001@naver.com',4);
insert into student values(8,'������','����','010-1211-0000',3,'kim003@naver.com',3);
insert into student values(9,'���ؿ�','�뱸','010-2232-1111',2,'park002@naver.com',3);
insert into student values(10,'�赵��','�Ⱦ�','010-0010-2222',4,'kim004@naver.com',5);
insert into student values(11,'���ؼ�','����','010-0001-0000',3,'lee003@naver.com',2);
insert into student values(12,'��ǿ�','����','010-0001-1211',1,'kim005@naver.com',1);
insert into student values(13,'������','â��','010-1112-1000',3,'kim006@naver.com',2);
insert into student values(14,'�ڿ���','�뱸','010-2221-1115',2,'park003@naver.com',1);
insert into student values(15,'�ּ���','����','010-0005-2622',4,'choi001@naver.com',5);
insert into student values(16,'������','����','010-0050-0200',3,'lee004@naver.com',1);
insert into student values(17,'�̿���','�ϻ�','010-0100-1118',1,'lee005@naver.com',4);
insert into student values(18,'������','����','010-1111-0070',2,'cha001@naver.com',2);
insert into student values(19,'�輭��','�λ�','010-2232-1171',2,'kim007@naver.com',3);
insert into student values(20,'�ֽ���','����','010-0004-2292',4,'choi002@naver.com',5);

select *from student;

-- ��������(id,�̸�,�ּ�,����ȣ,�̸���,�а�)
create table professor(
    pro_id number primary key,
    pro_name varchar2(50) not null,
    pro_add varchar2(150) not null,
    pro_phone varchar2(50) not null,
    pro_email varchar(100) not null unique,
    major_id number
);

-- ���������� ����
insert into professor values(1,'�����','����','010-1234-5678','kim001@gmail.com',1);
insert into professor values(2,'�Ǽ���','�λ�','010-2345-6789','kwon002@naver.com',1);
insert into professor values(3,'�̵���','�λ�','010-3456-7890','lee002@naver.com',2);
insert into professor values(4,'�ֿ���','â��','010-4567-8901','choi001@gmail.com',3);
insert into professor values(5,'�սÿ�','�뱸','010-5678-9012','son001@gmail.com',3);
insert into professor values(6,'������','����','010-1564-5678','cha001@gmail.com',4);
insert into professor values(7,'������','���','010-2385-6789','park004@naver.com',5);
insert into professor values(8,'������','�λ�','010-3446-7890','kim008@naver.com',2);
insert into professor values(9,'�̽���','â��','010-4562-8901','lee003@gmail.com',5);
insert into professor values(10,'�̾Ƹ�','�뱸','010-5778-9012','lee004@gmail.com',4);

select *from professor;

-- �а�����(id, �̸�)
create table major(
    major_id number primary key,
    major_name varchar(200) not null
);

-- �а� ������ ����
insert into major values(1,'��ǻ�Ͱ��а�');
insert into major values(2,'�����а�');
insert into major values(3,'�ؾ���а�');
insert into major values(4,'���а�');
insert into major values(5,'���ڰ��а�');

select *from major;

-- ��������(id, �����̸�, ��米��)
create table class(
    class_id number primary key,
    class_name varchar(300) not null,
    pro_id number
);

select *from class;

-- �������� ������ ����
insert into class values(1,'java����',1);
insert into class values(2,'DataBase',1);
insert into class values(3,'phython',2);
insert into class values(4,'�Ϲݹ�����',5);
insert into class values(5,'���ڿ���',5);
insert into class values(6,'�˰���',2);
insert into class values(7,'���������',4);
insert into class values(8,'���ڱ���',7);
insert into class values(9,'������',10);
insert into class values(10,'�繫����',10);
insert into class values(11,'�����а���',8);

select *from class;

-- ������û(����, ��û�л�)
create table application(
    class_id number,
    stu_id number,
    foreign key(class_id) references class(class_id),
    foreign key(stu_id) references student(stu_id)
);
select class_id,count(*)from application group by class_id;

-- ������û �����ͻ���

insert into application values(1,1);
insert into application values(1,15);
insert into application values(1,2);

insert into application values(2,7);
insert into application values(2,11);

insert into application values(3,3);
insert into application values(3,4);
insert into application values(3,9);

insert into application values(4,15);
insert into application values(4,18);
insert into application values(4,12);
insert into application values(4,5);
insert into application values(4,6);
insert into application values(4,11);

insert into application values(6,9);
insert into application values(6,2);

insert into application values(7,1);
insert into application values(7,3);
insert into application values(7,5);
insert into application values(7,7);
insert into application values(7,9);
insert into application values(7,13);
insert into application values(7,15);

insert into application values(9,4);
insert into application values(9,8);
insert into application values(9,6);
insert into application values(9,12);

insert into application values(10,1);
insert into application values(10,14);
insert into application values(10,13);
insert into application values(10,6);
insert into application values(10,9);
insert into application values(10,7);

insert into application values(11,5);
insert into application values(11,14);
insert into application values(11,12);
insert into application values(11,9);
insert into application values(11,7);
insert into application values(11,5);
insert into application values(11,1);
insert into application values(11,3);

select *from application;
-- SQL��

-- 1.'�Ϲݹ�����'�� ��米�� ����
update class set pro_id=2 where class_name like '�Ϲݹ�����';
select * from class;

-- 2.'�ǹ���'�л� �а� ���ڰ��а��� ����
update student set major_id=
              (select major_id from major 
               where major_name like '���ڰ��а�')
where stu_name like '�ǹ���';

-- 3.���ڿ��� ���� ����
delete from class where class_name like '���ڿ���';
select *from class;

-- 4.������ 0���� ���� ����
delete from class where class_name=
        (select class_name
         from class c left join application a on c.class_id=a.class_id
         where stu_id is null);

-- 5.�а� �̸� ��ȸ
select major_name from major;

-- 6.�а� �̸��� '����'�� ���� �а� ��ȸ
select major_name
from major
where major_name like '%����%';

-- 7.�ּҰ� '�λ�'�� �л� ��ȸ
select *
from student s
where s.stu_add like '�λ�';

-- 8.3�г� �л� ��ȸ
select *
from student s
where s.grade=3;

-- 9.'���ڰ��а�'�� ���� ��ȸ
select *
from professor p, major m
where p.major_id=m.major_id and major_name like '���ڰ��а�';

-- 10.'���а�'�� �л� �̸� ��ȸ
select stu_name
from student s, major m
where s.major_id=m.major_id
and major_name like '���а�';

-- 11.'��ǻ�Ͱ��а�' ���� �� �ּҰ� '�λ�'�� ���� ��ȸ
select *
from professor p
where p.pro_add like '�λ�' and p.major_id=
    (select major_id from major 
    where major_name like '��ǻ�Ͱ��а�');
    
-- 12.�� ���� �ο� �� ��ȸ
select substr(stu_name,1,1) "��",count(*) "�ο� ��"
from student
group by substr(stu_name,1,1)
order by substr(stu_name,1,1);

-- 13.�а��� �л��� �� ��ȸ
select m.major_name "���� �̸�",count(*) "�л� ��"
from major m,student s
where m.major_id=s.major_id
group by m.major_name;

-- 14.��ǻ�� ���а� �л��� �� 
select m.major_name "���� �̸�",count(*) "�л� ��"
from major m,student s
where m.major_id=s.major_id and m.major_name like '��ǻ�Ͱ��а�'
group by m.major_name;

-- 15.�ο��� ���� ���� �а� �̸� ��ȸ
select major_name
from major m,student s
where m.major_id=s.major_id
group by major_name
having count(*)=(select max(count(*))from major m,student s 
                 where m.major_id=s.major_id
                 group by m.major_id);

-- 16.�����а� �л� �� 3�г� ��ȸ
select *
from student s, major m
where s.major_id=m.major_id and major_name like '�����а�'
and s.grade=3;

-- 17.'������'�л��� ���� �а� �л��� ��ȸ(������ ����)
select *
from student s1
where stu_name not like '������' and s1.major_id=(select s2.major_id
                from student s2
                where s2.stu_name like '������');

-- 18.java ���ʸ� �����ϴ� ������ ���� ��ȸ
select *
from professor p
where p.pro_id=(select pro_id from class where class_name like 'java����');

-- 19.������û�� �� �л� ��ȸ
select stu_name
from student s,application a
where s.stu_id=a.stu_id
group by stu_name;

-- 20.���Ǻ� ������û�� �л��� �� ��ȸ
select class_name "���Ǹ�", count(*) "�л��� ��"
from class c join application a on c.class_id=a.class_id
join student s on a.stu_id=s.stu_id
group by class_name;

-- 21.�л��� ������ ���� �� ��ȸ
select stu_name "�л��̸�", count(*) "���� ��"
from student s, application a
where s.stu_id=a.stu_id
group by stu_name;

-- 22.������ ���� �� ��ȸ
select pro_name,count(*)
from professor p, class c
where p.pro_id=c.pro_id
group by pro_name;

-- 23.��û�� ���ǰ� 3�� �̻��� �л� ��ȸ
select stu_name "�л��̸�"
from student s, application a
where s.stu_id=a.stu_id
group by stu_name
having count(*)>=3;

-- 24.java���� ������ �л��� �� ��ȸ
select class_name "���Ǹ�", count(*) "�л��� ��"
from class c join application a on c.class_id=a.class_id
join student s on a.stu_id=s.stu_id
where c.class_name like 'java����'
group by class_name;

-- 25.��û�� �л��� ���帹�� ���ǿ� �л��� ��ȸ
select c.class_name,count(*) "�л� ��"
from class c, application a
where c.class_id=a.class_id
group by c.class_name
having count(*)=(select max(count(*))
                from class c, application a
                where c.class_id=a.class_id
                group by c.class_id);

-- 26.'�Ǽ���'������ �����ϴ� �����̸� ��ȸ
select class_name
from class c, professor p
where c.pro_id=p.pro_id and p.pro_name like '�Ǽ���';

-- 27.�����ο��� 0���� �����̸� ��ȸ
select class_name
from class c left join application a on c.class_id=a.class_id
where stu_id is null;

-- 28.���Ǹ� ���� �ʴ� ������ ���� ��ȸ
select *
from professor p left join class c on p.pro_id=c.pro_id
where class_id is null;

-- 29.'�Ϲݹ�����'�� ������ �л��̸� ��ȸ
select s.stu_name
from student s, application a, class c
where s.stu_id=a.stu_id and a.class_id=c.class_id
and c.class_name like '�Ϲݹ�����';

-- 30.�г⺰ �л��� ��(�������� ����) ��ȸ
select grade "�г�",count(*) "�л� ��"
from student
group by grade
order by count(*);

-- 31.������û�� ���� ���� �л� ���� ��ȸ
select *
from student s left join application a on s.stu_id=a.stu_id
where class_id is null;

-- 32.�ؾ���а� ������ �� ���Ǹ� ���� �ʴ� ���� ��ȸ
select *
from professor p left join class c on p.pro_id=c.pro_id
where class_id is null and p.pro_name in
    (select p.pro_name from professor p, major m 
     where p.major_id=m.major_id and major_name like '�ؾ���а�');

-- 33.������û�� ���� ���� �л� �� '���а�'�л� ��ȸ
select *
from student s left join application a on s.stu_id=a.stu_id
join major m on s.major_id=m.major_id
where class_id is null and m.major_name like '���а�';

-- '34.�����а���'�� ������ �л� �� 2�г� �л� ��ȸ
select *
from student s, application a, class c
where s.stu_id=a.stu_id and a.class_id=c.class_id
and c.class_name like '�����а���' and s.grade=2;

-- 35.'���������'�� ������ �л����� �����ټ����� ������ ���� 3�� ��ȸ
select rownum,stu_name
from student s,application a,class c
where s.stu_id=a.stu_id and a.class_id=c.class_id
and c.class_name like '���������' 
and rownum<=3;

-- �� ����
create view vw_student(id,name,grade,m_name,address)
as select s.stu_id,s.stu_name,s.grade,m.major_name,s.stu_add 
from student s, major m
where s.major_id=m.major_id and m.major_name like '���ڰ��а�';

-- �並 ����� sql��

-- 36.�並 ����Ͽ� '���ڰ��а�' �л��� �̸�, �г� ��ȸ
select name, grade from vw_student;

-- 37.�並 ����Ͽ� '���ڰ��а�' �л� �� �ּҰ� '�λ�'�� �л� ���� ��ȸ
select * from vw_student where address like '�λ�';

-- vw_student�� �а��� '�ؾ���а�'�� ����
create or replace view vw_student(id,name,grade,m_name,address)
as select s.stu_id,s.stu_name,s.grade,m.major_name,s.stu_add 
from student s, major m
where s.major_id=m.major_id and m.major_name like '�ؾ���а�';

select * from vw_student;

-- vw_student �� ����
drop view vw_student;
commit;

