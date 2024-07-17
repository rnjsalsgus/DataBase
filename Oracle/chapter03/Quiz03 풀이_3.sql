-- Quiz03 풀이

-- 기업 프로젝트 데이터베이스

-- 직원 테이블 생성
create table b_employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(50),
    deptno number
);

-- 부서테이블 생성
create table b_department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar(10)
);
alter table b_department modify manager number;

-- 프로젝트 테이블 생성
create table b_project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);

-- 작업 테이블 생성
create table b_works(
    empno number,
    projno number,
    hours_worked number,
    primary key(empno,projno),
    foreign key(empno) references b_employee(empno),
    foreign key(projno) references b_project(projno)
);
-- 사원 데이터 삽입
insert into b_employee values(1,'남사원1','010-0000-0000','부산','m','사원',1);
insert into b_employee values(2,'남사원2','010-1111-0000','서울','m','사원',2);
insert into b_employee values(3,'여사원1','010-2222-0000','부천','f','사원',2);
insert into b_employee values(4,'여사원2','010-3333-0000','대구','f','사원',1);
insert into b_employee values(5,'김팀장','010-2323-0000','서울','m','팀장',1);
insert into b_employee values(6,'이팀장','010-1212-0000','인천','f','팀장',2);
insert into b_employee values(7,'남사원3','010-5555-0000','대전','m','사원',1);
insert into b_employee values(8,'남사원4','010-6666-0000','포항','m','사원',1);

update b_employee set position='부장' where empno=5;
update b_employee set position='과장' where empno=6;
update b_employee set name='홍길동' where empno=5;

-- 부서 데이터 삽입
insert into b_department values(1,'IT',5);
insert into b_department values(2,'마케팅',6);

-- 프로젝트 데이터 삽입
insert into b_project values(1,'데이터베이스구축',2);
insert into b_project values(2,'인트라넷구축',1);

-- 작업 데이터 삽입
insert into b_works values (2,1,100);
insert into b_works values (3,1,80);
insert into b_works values (6,1,103);

select * from b_department;

-- 모든 사원의 이름을 검색
select name
from b_employee;

-- 여자 사원의 이름을 검색
select name
from b_employee
where sex like 'f';

-- 팀장의 이름을 검색
select *
from b_employee e, b_department d
where e.empno=d.manager;

select *
from b_employee e, b_department d
where e.deptno=d.deptno and e.empno in (
    select manager from b_department);

-- IT 부서에서 일하는 사원의 이름, 주소 검색
select name, address
from b_department d, b_employee e
where d.deptno=e.deptno and d.deptname='IT';

-- 홍길동 팀장 부서에서 일하는 사원의 수 검색
select count(*)
from b_department d, b_employee e
where d.deptno=e.deptno and d.manager=(
    select empno
    from b_employee
    where name like '홍길동');
    
-- 사원들이 일한 시간 수를 부서별, 사원 이름별 오름차순으로 검색
select e.deptno,e.name,w.hours_worked
from b_works w, b_employee e
where w.empno=e.empno
order by e.deptno, name;

-- 2명 이상의 사원이 참여한 프로젝트의 번호, 이름, 사원의 수 검색
select projno,projname,count(empno) as "사원의 수"
from b_project p, b_employee e
where p.deptno=e.deptno
group by projno,projname
having count(empno)>=2;

select p.projno,p.projname,count(*) as 사원수
from b_project p, b_works w
where p.projno=w.projno
group by p.projno,p.projname
having count(*)>=2;

-- 3명 이상의 사원이 있는 부서의 사원 이름 검색
select deptno, name
from b_employee
where deptno in (
    select deptno
    from b_employee 
    group by deptno
    having count(*)>=3)
order by deptno;




















