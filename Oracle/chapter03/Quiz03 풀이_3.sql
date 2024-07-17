-- Quiz03 Ǯ��

-- ��� ������Ʈ �����ͺ��̽�

-- ���� ���̺� ����
create table b_employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(50),
    deptno number
);

-- �μ����̺� ����
create table b_department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar(10)
);
alter table b_department modify manager number;

-- ������Ʈ ���̺� ����
create table b_project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);

-- �۾� ���̺� ����
create table b_works(
    empno number,
    projno number,
    hours_worked number,
    primary key(empno,projno),
    foreign key(empno) references b_employee(empno),
    foreign key(projno) references b_project(projno)
);
-- ��� ������ ����
insert into b_employee values(1,'�����1','010-0000-0000','�λ�','m','���',1);
insert into b_employee values(2,'�����2','010-1111-0000','����','m','���',2);
insert into b_employee values(3,'�����1','010-2222-0000','��õ','f','���',2);
insert into b_employee values(4,'�����2','010-3333-0000','�뱸','f','���',1);
insert into b_employee values(5,'������','010-2323-0000','����','m','����',1);
insert into b_employee values(6,'������','010-1212-0000','��õ','f','����',2);
insert into b_employee values(7,'�����3','010-5555-0000','����','m','���',1);
insert into b_employee values(8,'�����4','010-6666-0000','����','m','���',1);

update b_employee set position='����' where empno=5;
update b_employee set position='����' where empno=6;
update b_employee set name='ȫ�浿' where empno=5;

-- �μ� ������ ����
insert into b_department values(1,'IT',5);
insert into b_department values(2,'������',6);

-- ������Ʈ ������ ����
insert into b_project values(1,'�����ͺ��̽�����',2);
insert into b_project values(2,'��Ʈ��ݱ���',1);

-- �۾� ������ ����
insert into b_works values (2,1,100);
insert into b_works values (3,1,80);
insert into b_works values (6,1,103);

select * from b_department;

-- ��� ����� �̸��� �˻�
select name
from b_employee;

-- ���� ����� �̸��� �˻�
select name
from b_employee
where sex like 'f';

-- ������ �̸��� �˻�
select *
from b_employee e, b_department d
where e.empno=d.manager;

select *
from b_employee e, b_department d
where e.deptno=d.deptno and e.empno in (
    select manager from b_department);

-- IT �μ����� ���ϴ� ����� �̸�, �ּ� �˻�
select name, address
from b_department d, b_employee e
where d.deptno=e.deptno and d.deptname='IT';

-- ȫ�浿 ���� �μ����� ���ϴ� ����� �� �˻�
select count(*)
from b_department d, b_employee e
where d.deptno=e.deptno and d.manager=(
    select empno
    from b_employee
    where name like 'ȫ�浿');
    
-- ������� ���� �ð� ���� �μ���, ��� �̸��� ������������ �˻�
select e.deptno,e.name,w.hours_worked
from b_works w, b_employee e
where w.empno=e.empno
order by e.deptno, name;

-- 2�� �̻��� ����� ������ ������Ʈ�� ��ȣ, �̸�, ����� �� �˻�
select projno,projname,count(empno) as "����� ��"
from b_project p, b_employee e
where p.deptno=e.deptno
group by projno,projname
having count(empno)>=2;

select p.projno,p.projname,count(*) as �����
from b_project p, b_works w
where p.projno=w.projno
group by p.projno,p.projname
having count(*)>=2;

-- 3�� �̻��� ����� �ִ� �μ��� ��� �̸� �˻�
select deptno, name
from b_employee
where deptno in (
    select deptno
    from b_employee 
    group by deptno
    having count(*)>=3)
order by deptno;




















