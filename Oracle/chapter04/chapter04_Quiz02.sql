-- chapter04_Quiz02
 
-- 판매가격이 20000원 이상인 도서의 도서번호, 도서이름,고객이름, 출판사, 판매가격을 보여주는 
-- highorders 뷰를 생성

create view highorders(bookid,bookname,name,publisher,saleprice)
as select b.bookid,b.bookname,c.name,b.publisher,o.saleprice
   from book b,customer c ,orders o 
   where b.bookid=o.bookid
   and c.custid=o.custid and o.saleprice>=20000;

-- 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 SQL문 작성
select bookname,name
from highorders;

-- highorders뷰를 변경, 판매가격 속성을 삭제하는 명령을 수행
-- 삭제후 sql문 다시 실행
create or replace view highorders(bookid,bookname,name,publisher,saleprice)
as select b.bookid,b.bookname,c.name,b.publisher,o.saleprice
   from book b,customer c ,orders o 
   where b.bookid=o.bookid and c.custid=o.custid;

-- 팀장이 없는 직원의 이름을 검색
select ename
from emp
where mgr is null;

-- 사원의 이름과 부서의 이름을 검색(조인/ 스칼라 부속질의 사용)
-- 조인
select ename,dname
from emp e,dept d
where e.deptno=d.deptno;

-- 스칼라 부속질의
select ename , (select dname from dept d where e.deptno=d.deptno)
from emp e;

-- CHICAGO에 근무하는 사원의 이름을 보이시오(조인/인라인 뷰/중첩질의/exists사용)
-- 조인
select *
from dept;

select ename
from emp,dept
where emp.deptno=dept.deptno and loc like 'Chicago';

-- 인라인 뷰
create view vw_emp
as select e.ename,d.loc
from emp e,dept d where e.deptno=d.deptno;

select *
from vw_emp where loc like 'Chicago';

-- 중첩질의
select ename
from emp
where emp.deptno=(
    select deptno
    from dept
    where loc like 'Chicago');
    
-- exists사용
select ename
from emp
where exists (select * from dept where loc like 'Chicago'
              and emp.deptno=dept.deptno);

-- 자기 부서의 평균보다 급여가 많은 직원의 이름을 검색

select ename 
from emp e1
where sal>(select avg(sal) from emp e2 where e1.deptno=e2.deptno);

