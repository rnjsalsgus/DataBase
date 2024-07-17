-- Quiz03

create table theater(
    ttid number primary key,
    ttname varchar2(30),
    location varchar2(50)
);

create table cinema(
    ttid number,
    cid number check (cid>=1 and cid<=10),
    moviename varchar2(30),
    price number check (price <=20000),
    seatnumber number,
    primary key(ttid,cid)
);

create table reservation(
    ttid number,
    cid number,
    custid number,
    seatnumber number unique,
    rdate date,
    primary key(ttid,cid,custid)
);

create table moviecustomer(
    custid number primary key,
    custname varchar2(30),
    addredd varchar2(50)
);

insert into theater(ttid,ttname,location)
values(1,'롯데','잠실');
insert into theater(ttid,ttname,location)
values(2,'메가','강남');
insert into theater(ttid,ttname,location)
values(3,'대한','잠실');

insert into cinema(ttid,cid,moviename,price,seatnumber)
values(1,1,'어려운 영화',15000,48);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,1,'멋진 영화',7500,120);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,2,'재밌는 영화',8000,110);


insert into reservation
values(3,2,3,15,'2020-09-01');
insert into reservation
values(3,1,4,16,'2020-09-01');
insert into reservation
values(1,1,9,48,'2020-09-01');

insert into moviecustomer
values(3,'홍길동','강남');
insert into moviecustomer
values(4,'김철수','잠실');
insert into moviecustomer
values(9,'박영희','강남');

-- 모든 극장의 이름과 위치를 검색
select ttname,location
from theater;

-- 잠실에 있는 극장 검색
select *
from theater
where location like '잠실';

-- 잠실에 사는 고객의 이름을 오름차순으로 보이시오
select custname
from moviecustomer
where addredd like '잠실';
    
-- 가격이 8000원 이하인 영화의 극장번호, 상영관 번호, 영화제목을 검색
select ttid, cid, moviename
from cinema
where price<=8000;

-- 극장위치와 고객의 주소가 같은 고객을 보이시오
select custid,custname,addredd
from theater t,moviecustomer m
where t.location=m.addredd
group by custid,custname,addredd;

-- 극장의 수
select count(*) as "극장의 수"
from theater;

-- 상영되는 영화의 평균 가격
select avg(price) as "영화 평균 가격"
from cinema;

-- 2020-09-01에 영화를 관람한 고객의 수
select count(custid) as "영화관람 고객의 수"
from reservation
where rdate='2020-09-01';

-- '대한'극장에서 상영한 영화 제목 검색
select moviename
from theater t,cinema c
where t.ttid=c.ttid and t.ttname like '대한';

-- '대한'극장에서 영화를 본 고객의 이름 검색
select custname
from theater t, reservation r, moviecustomer m
where t.ttid=r.ttid
and r.custid=m.custid
and t.ttname like '대한';

-- '대한'극장의 전체 수입
select sum(price)
from theater t, cinema c, reservation r
where r.ttid=c.ttid
and c.ttid=t.ttid
and r.cid=c.cid
and ttname like '대한';

-- 극장별 상영관 수
select ttname,count(cid) as "상영관 수"
from theater t,cinema c
where t.ttid=c.ttid
group by ttname;

-- '잠실'에 있는 극장의 상영관 검색
select *
from theater t,cinema c
where t.ttid=c.ttid
and t.location like '잠실';

-- 2020-09-01의 극장별 평균 관람 고객 수 검색
select ttname,avg(cid)
from theater t,reservation r, moviecustomer m
where r.custid=m.custid
and t.ttid=r.ttid
and r.rdate='2020-09-01'
group by ttname;

-- 2020-09-01 가장 많은 고객이 관람한 영화 검색
select moviename
from cinema c,reservation r
where c.ttid=r.ttid
and c.cid=r.cid
and r.rdate='2020-09-01';

-- 영화 가격을 10% 인상
update cinema
set price=price*1.1;

-- 판매원 데이터베이스

create table salesperson(
    pname varchar2(20) primary key,
    age number,
    salary number
);

insert into salesperson
values('Tom',28,200);
insert into salesperson
values('Chris',45,350);
insert into salesperson
values('Louise',21,150);
insert into salesperson
values('Olivia',31,250);
insert into salesperson
values('Emma',36,450);

create table saleorder(
    onumber number,
    custname varchar2(30),
    salesperson varchar2(30),
    amount number,
    primary key(custname, salesperson),
    foreign key(custname) references salecustomer(cname),
    foreign key(salesperson) references salesperson(pname)
);

insert into saleorder
values(1,'Amelia','Emma',1.99);
insert into saleorder
values(2,'Sophia','Olivia',0.99);
insert into saleorder
values(3,'Adam','Louise',2.99);
insert into saleorder
values(4,'Oliver','Chris',4.99);
insert into saleorder
values(5,'James','Tom',7.99);
insert into saleorder
values(6,'Sam','Tom',5.99);
insert into saleorder
values(7,'Oliver','Louise',2.99);
insert into saleorder
values(8,'Adam','Emma',3.99);
insert into saleorder
values(9,'Adam','Chris',3.99);


create table salecustomer(
    cname varchar(30) primary key,
    city varchar(50),
    industrytype varchar(30)
);

insert into salecustomer
values('James','Atlanta','doctor');
insert into salecustomer
values('Oliver','Boston','police');
insert into salecustomer
values('Adam','Chicago','teacher');
insert into salecustomer
values('Sophia','Dallas','army');
insert into salecustomer
values('Amelia','Houston','youtuber');
insert into salecustomer
values('Smith','LA','actor');
insert into salecustomer
values('Sam','LA','actuary');



-- 모든 판매원의 이름과 급여를 검색
select pname,salary
from salesperson;

-- 나이가 30세 미만인 판매원의 이름 검색
select pname
from salesperson
where age<30;

-- 'S'로 끝나는 도시에 사는 고객의 이름 검색
select cname
from salecustomer
where city like '%s';

-- 주문을 한 고객의 수(서로 다른 고객만) 검색
select count(distinct cname)
from salecustomer c,saleorder o
where c.cname=o.custname;

-- 판매원 각각에 대하여 주문의 수를 검색
select pname, count(onumber)
from salesperson p,saleorder o
where p.pname=o.salesperson
group by pname;

-- 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이(조인)
select pname,age
from salesperson p,saleorder o,salecustomer c
where p.pname=o.salesperson
and o.custname=c.cname
and c.city like 'LA';

-- 'LA'에 사는 고객으로부터 주문을 받은 판매원의 이름과 나이(부속질의)
    
select pname,age
from salesperson
where pname in (
    select salesperson
    from saleorder
    where custname in (
        select cname
        from salecustomer
        where city like 'LA'));

-- 두 번 이상 주문을 받은 판매원의 이름 검색

select o.salesperson
from  saleorder o
group by salesperson
having count(salesperson)>=2;

-- 판매원 TOM의 봉급을 45000원으로 변경
update salesperson
set salary=salary-(salary*0.98)+0.5
where pname like 'Tom';









    
    
    