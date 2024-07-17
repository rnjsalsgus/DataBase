-- chapter04_Quiz02
 
-- �ǸŰ����� 20000�� �̻��� ������ ������ȣ, �����̸�,���̸�, ���ǻ�, �ǸŰ����� �����ִ� 
-- highorders �並 ����

create view highorders(bookid,bookname,name,publisher,saleprice)
as select b.bookid,b.bookname,c.name,b.publisher,o.saleprice
   from book b,customer c ,orders o 
   where b.bookid=o.bookid
   and c.custid=o.custid and o.saleprice>=20000;

-- ������ �並 �̿��Ͽ� �Ǹŵ� ������ �̸��� ���� �̸��� ����ϴ� SQL�� �ۼ�
select bookname,name
from highorders;

-- highorders�並 ����, �ǸŰ��� �Ӽ��� �����ϴ� ����� ����
-- ������ sql�� �ٽ� ����
create or replace view highorders(bookid,bookname,name,publisher,saleprice)
as select b.bookid,b.bookname,c.name,b.publisher,o.saleprice
   from book b,customer c ,orders o 
   where b.bookid=o.bookid and c.custid=o.custid;

-- ������ ���� ������ �̸��� �˻�
select ename
from emp
where mgr is null;

-- ����� �̸��� �μ��� �̸��� �˻�(����/ ��Į�� �μ����� ���)
-- ����
select ename,dname
from emp e,dept d
where e.deptno=d.deptno;

-- ��Į�� �μ�����
select ename , (select dname from dept d where e.deptno=d.deptno)
from emp e;

-- CHICAGO�� �ٹ��ϴ� ����� �̸��� ���̽ÿ�(����/�ζ��� ��/��ø����/exists���)
-- ����
select *
from dept;

select ename
from emp,dept
where emp.deptno=dept.deptno and loc like 'Chicago';

-- �ζ��� ��
create view vw_emp
as select e.ename,d.loc
from emp e,dept d where e.deptno=d.deptno;

select *
from vw_emp where loc like 'Chicago';

-- ��ø����
select ename
from emp
where emp.deptno=(
    select deptno
    from dept
    where loc like 'Chicago');
    
-- exists���
select ename
from emp
where exists (select * from dept where loc like 'Chicago'
              and emp.deptno=dept.deptno);

-- �ڱ� �μ��� ��պ��� �޿��� ���� ������ �̸��� �˻�

select ename 
from emp e1
where sal>(select avg(sal) from emp e2 where e1.deptno=e2.deptno);

