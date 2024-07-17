-- Quiz03

-- 판매원 데이터베이스

-- 판매원 테이블
create table salesperson(
    pname varchar2(20) primary key,
    age number,
    salary number
);

-- 주문 테이블
create table saleorder(
    onumber number,
    custname varchar2(30),
    salesperson varchar2(30),
    amount number,
    primary key(custname, salesperson),
    foreign key(custname) references salecustomer(cname),
    foreign key(salesperson) references salesperson(pname)
);

-- 고객 테이블
create table salecustomer(
    cname varchar(30) primary key,
    city varchar(50),
    industrytype varchar(30)
);

-- 모든 판매원의 이름과 급여 검색
select distinct pname,salary
from salesperson;

-- 나이가 30세 미만인 판매원의 이름 검색
select pname
from salesperson
where age<30;

-- 's'로 끝나는 도시에 사는 고객의 이름 검색
select cname
from salecustomer
where city like '%s';

-- 주문을 한 고객의 수(서로 다른 고객만)
select count(distinct custname)
from saleorder;

-- 판매원 각각에 대하여 주문의 수 검색
select salesperson ,count(*)
from saleorder
group by salesperson;

-- LA에 사는 고객으로부터 주문을 받은 판매원의 이름,나이 검색(부속질의)
select pname,age
from salesperson
where pname in (select salesperson
from saleorder
where custname in (select cname
from salecustomer
where city like 'LA'));

-- LA에 사는 고객으로부터 주문을 받은 판매원의 이름,나이 검색(조인)
select pname,age
from salesperson p, saleorder o, salecustomer c
where p.pname=o.salesperson
and o.custname=c.cname
and c.city like 'LA';

-- 두 번 이상 주문을 받은 판매원의 이름 검색
select salesperson
from saleorder
group by salesperson
having count(*)>=2;

-- 판매원 Tom의 봉급을 45,000원으로 변경
update salesperson
set salary=45000
where pname like 'Tom';

select * from salesperson;

















