-- Quiz04

create table dept(
    deptno number(2) primary key,
    dname varchar2(10),
    loc varchar2(13)
);

create table emp(
    empno number(4) primary key,
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2),
    foreign key(deptno) references dept(deptno)
);

insert into dept values(10,'IT','4floor');
insert into dept values(20,'Marketing','3floor');
insert into dept values(30,'Styling','2floor');
insert into dept values(40,'Sales','1floor');
update dept set dname='Design' where deptno=30;
update dept set loc='Atlanta' where deptno=40;
insert into emp values(1,'Tom','����',1,'2020-09-01',750,5,10);
insert into emp values(2,'Sam','DB',1,'2020-09-10',1350,10,10);
insert into emp values(3,'Smith','����',1,'2020-09-11',1250,5,10);
insert into emp values(4,'Olivia','������',2,'2020-10-01',550,5,30);
insert into emp values(5,'Emma','������',2,'2020-06-01',800,15,30);
insert into emp values(6,'Michael','������',2,'2020-04-21',700,8,30);
insert into emp values(7,'Adam','������',3,'2020-04-21',650,6,20);
insert into emp values(8,'James','������',3,'2020-09-01',450,12,20);
insert into emp values(9,'Sophia','������',3,'2020-10-01',1200,10,20);
insert into emp values(10,'Oliver','����',2,'2020-11-01',400,10,30);
insert into emp values(11,'Amelia','������',3,'2020-10-01',1200,10,20);
insert into emp values(12,'Yuri','����',1,'2018-09-01',1750,5,10);
insert into emp values(7555,'Scott','DB',1,'2018-09-01',1000,5,10);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(13,'Sara','DB','2022-04-20',1100,5,10);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(14,'Victoria','����','2021-05-20',550,5,10);
insert into emp(empno,ename,job,hiredate,sal,deptno)
values(15,'Nicole','����','2018-04-20',350,30);
insert into emp(empno,ename,job,hiredate,sal,deptno)
values(16,'Rebecca','������','2021-08-01',300,30);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(17,'Nicole','����','2021-05-20',600,5,10);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(18,'Phyllis','����','2021-05-20',750,5,10);
select *from emp;
select *from dept;
delete from emp where empno=16;
update emp set empno=7492 where empno=8;
-- ����� �̸��� ���� ���(�Ӹ��� �ۼ�)
select ename as ����̸�, job as �������
from emp;

-- 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿�
select ename, sal
from emp
where deptno=30;

-- �����ȣ�� �̸�, ����޿�, ������ �޿���, 10% �λ�� �޿��� �����ȣ������ ���
select empno,ename,sal,sal*0.1 as ������, sal*1.1 as "�λ�� �޿�"
from emp
order by empno;

-- S�� �����ϴ� ��� ����� �μ���ȣ ���
select empno,ename,deptno
from emp
where ename like 'S%';

-- ��� ����� �ִ� �� �ּ� �޿�. �հ� �� ��� �޿��� ���
-- ���� �̸��� ���� MAX, MIN, SUM, AVG, �Ҽ��� ���� �ݿø��Ͽ� ������ ���
select max(sal) as MAX,
       min(sal) as MIN,
       sum(sal) as SUM,
       round(avg(sal)) as AVG
from emp;

-- �����̸��� �������� ������ ������ �ϴ� ����� ���� ���
-- �� �̸��� ���� ������ ������ �����

select job as ����, count(empno) as "������ �����"
from emp
group by job;

-- ����� �ִ� �޿��� �ּ� �޿��� ������ ���
select max(sal)-min(sal)
from emp;

-- 30�� �μ��� ��� ���� ����� �޿��� �հ�� ��� ���
select count(empno) as "��� ��",
       sum(sal) as "�޿��� �հ�",
       avg(sal) as "�޿��� ���"
from emp
where deptno=30;

-- ��� �޿��� ���� ���� �μ��� ��ȣ�� ���
select deptno
from emp
group by deptno
having avg(sal)=(
    select max(avg(sal))
    from emp 
    group by deptno);

-- ��������� �����ϰ� �� ������ ����� �� �޿��� 3,000 �̻���
-- �� ������ ���ؼ� ������� �� ������ ��� �޿��� ���, ��ձ޿��� ��������

select job, avg(sal)
from emp
group by job
having sum(sal)>=3000
order by job;

-- ��ü ��� ��� ���� ����� �ִ� ����� �� 

select count(*)
from emp
where mgr is not null;

-- emp ���̺��� �̸�, �޿�, Ŀ�̼� �ݾ�, �Ѿ��� ���Ͽ� �Ѿ��� ���� ������� ���
select ename, sal, comm, sal*12+comm as �Ѿ�
from emp
where comm is not null
order by �Ѿ� desc;

-- �� �μ����� ���� ������ �ϴ� ����� �ο� ���� ���Ͽ� �μ���ȣ, ���� �̸�, �ο� ���� ���
select deptno,job,count(empno)
from emp
group by deptno,job
order by deptno;

-- ����� �Ѹ� ���� �μ��� �̸��� ���
select dname
from dept
where dname not in (
    select dname
    from dept,emp
    where dept.deptno=emp.deptno
    group by dname);

-- ���� ������ �ϴ� ����� ���� 4�� �̻��� ������ �ο���
select job,count(*)
from emp
group by job
having count(*)>=4;

-- ��� ��ȣ�� 7400~7600�� ����� �̸� ���
select ename
from emp
where empno>=7400 and empno<=7600;

-- ����� �̸��� ����� �μ��̸��� ���
select ename, dname
from emp, dept
where emp.deptno=dept.deptno;

-- ����� �̸��� ������ �̸��� ���
select ename e1,ename e2
from emp
where emp.empno in (
select mgr
from emp);
-- Scott���� �޿��� ���� �޴� ����� �̸� ���
select ename
from emp
where sal>(
    select sal
    from emp
    where ename like 'Scott');
    
-- Scott�� ���ϴ� �μ���ȣ Ȥ�� DALLAS�� �ִ� �μ� ��ȣ ���
select dept.deptno
from emp,dept
where emp.deptno=dept.deptno
and emp.ename='Scott' or dept.loc='Dallas'
group by dept.deptno;
