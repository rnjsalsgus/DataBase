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
insert into emp values(1,'Tom','개발',1,'2020-09-01',750,5,10);
insert into emp values(2,'Sam','DB',1,'2020-09-10',1350,10,10);
insert into emp values(3,'Smith','개발',1,'2020-09-11',1250,5,10);
insert into emp values(4,'Olivia','마케팅',2,'2020-10-01',550,5,30);
insert into emp values(5,'Emma','마케팅',2,'2020-06-01',800,15,30);
insert into emp values(6,'Michael','마케팅',2,'2020-04-21',700,8,30);
insert into emp values(7,'Adam','디자인',3,'2020-04-21',650,6,20);
insert into emp values(8,'James','디자인',3,'2020-09-01',450,12,20);
insert into emp values(9,'Sophia','디자인',3,'2020-10-01',1200,10,20);
insert into emp values(10,'Oliver','섭외',2,'2020-11-01',400,10,30);
insert into emp values(11,'Amelia','디자인',3,'2020-10-01',1200,10,20);
insert into emp values(12,'Yuri','개발',1,'2018-09-01',1750,5,10);
insert into emp values(7555,'Scott','DB',1,'2018-09-01',1000,5,10);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(13,'Sara','DB','2022-04-20',1100,5,10);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(14,'Victoria','개발','2021-05-20',550,5,10);
insert into emp(empno,ename,job,hiredate,sal,deptno)
values(15,'Nicole','섭외','2018-04-20',350,30);
insert into emp(empno,ename,job,hiredate,sal,deptno)
values(16,'Rebecca','마케팅','2021-08-01',300,30);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(17,'Nicole','개발','2021-05-20',600,5,10);
insert into emp(empno,ename,job,hiredate,sal,comm,deptno)
values(18,'Phyllis','개발','2021-05-20',750,5,10);
select *from emp;
select *from dept;
delete from emp where empno=16;
update emp set empno=7492 where empno=8;
-- 사원의 이름과 업무 출력(머리글 작성)
select ename as 사원이름, job as 사원업무
from emp;

-- 30번 부서에 근무하는 모든 사원의 이름과 급여
select ename, sal
from emp
where deptno=30;

-- 사원번호와 이름, 현재급여, 증가된 급여분, 10% 인상된 급여를 사원번호순으로 출력
select empno,ename,sal,sal*0.1 as 증가액, sal*1.1 as "인상된 급여"
from emp
order by empno;

-- S로 시작하는 모든 사원과 부서번호 출력
select empno,ename,deptno
from emp
where ename like 'S%';

-- 모든 사원의 최대 및 최소 급여. 합계 및 평균 급여를 출력
-- 열의 이름은 각각 MAX, MIN, SUM, AVG, 소수점 이하 반올림하여 정수로 출력
select max(sal) as MAX,
       min(sal) as MIN,
       sum(sal) as SUM,
       round(avg(sal)) as AVG
from emp;

-- 업무이름과 업무별로 동일한 업무를 하는 사원의 수를 출력
-- 열 이름은 각각 업무와 업무별 사원수

select job as 업무, count(empno) as "업무별 사원수"
from emp
group by job;

-- 사원의 최대 급여와 최소 급여의 차액을 출력
select max(sal)-min(sal)
from emp;

-- 30번 부서의 사원 수와 사원들 급여의 합계와 평균 출력
select count(empno) as "사원 수",
       sum(sal) as "급여의 합계",
       avg(sal) as "급여의 평균"
from emp
where deptno=30;

-- 평균 급여가 가장 높은 부서의 번호를 출력
select deptno
from emp
group by deptno
having avg(sal)=(
    select max(avg(sal))
    from emp 
    group by deptno);

-- 세일즈맨을 제외하고 각 업무별 사원의 총 급여가 3,000 이상인
-- 각 업무에 대해서 업무명과 각 업무별 평균 급여를 출력, 평균급여의 내림차순

select job, avg(sal)
from emp
group by job
having sum(sal)>=3000
order by job;

-- 전체 사원 가운데 직속 상관이 있는 사원의 수 

select count(*)
from emp
where mgr is not null;

-- emp 테이블에서 이름, 급여, 커미션 금액, 총액을 구하여 총액이 많은 순서대로 출력
select ename, sal, comm, sal*12+comm as 총액
from emp
where comm is not null
order by 총액 desc;

-- 각 부서별로 같은 업무를 하는 사람의 인원 수를 구하여 부서번호, 업무 이름, 인원 수를 출력
select deptno,job,count(empno)
from emp
group by deptno,job
order by deptno;

-- 사원이 한명도 없는 부서의 이름을 출력
select dname
from dept
where dname not in (
    select dname
    from dept,emp
    where dept.deptno=emp.deptno
    group by dname);

-- 같은 업무를 하는 사람의 수가 4명 이상인 업무와 인원수
select job,count(*)
from emp
group by job
having count(*)>=4;

-- 사원 번호가 7400~7600인 사원의 이름 출력
select ename
from emp
where empno>=7400 and empno<=7600;

-- 사원의 이름과 사원의 부서이름을 출력
select ename, dname
from emp, dept
where emp.deptno=dept.deptno;

-- 사원의 이름과 팀장의 이름을 출력
select ename e1,ename e2
from emp
where emp.empno in (
select mgr
from emp);
-- Scott보다 급여를 많이 받는 사람의 이름 출력
select ename
from emp
where sal>(
    select sal
    from emp
    where ename like 'Scott');
    
-- Scott이 일하는 부서번호 혹은 DALLAS에 있는 부서 번호 출력
select dept.deptno
from emp,dept
where emp.deptno=dept.deptno
and emp.ename='Scott' or dept.loc='Dallas'
group by dept.deptno;
