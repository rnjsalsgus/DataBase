-- Quiz03 풀이

-- [극장 데이터베이스]

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

-- 데이터 삽입
-- 극장 데이터
insert into theater(ttid,ttname,location)
values(1,'롯데','잠실');
insert into theater(ttid,ttname,location)
values(2,'메가','강남');
insert into theater(ttid,ttname,location)
values(3,'대한','잠실');

-- 상영관 데이터

insert into cinema(ttid,cid,moviename,price,seatnumber)
values(1,1,'어려운 영화',15000,48);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,1,'멋진 영화',7500,120);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,2,'재밌는 영화',8000,110);

-- 예약 데이터

insert into reservation
values(3,2,3,15,'2020-09-01');
insert into reservation
values(3,1,4,16,'2020-09-01');
insert into reservation
values(1,1,9,48,'2020-09-01');

-- 고객 데이터

insert into moviecustomer
values(3,'홍길동','강남');
insert into moviecustomer
values(4,'김철수','잠실');
insert into moviecustomer
values(9,'박영희','강남');


-- 단순질의

-- 모든 극장의 이름과 위치 검색

select ttname,location
from theater;

-- 잠실에 있는 극장을 검색
select *
from theater
where location like '잠실';

-- 잠실에 사는 고객의 이름을 오름차순으로 검색
select custname
from moviecustomer
where addredd like '잠실'
order by custname;

-- 가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목
select ttid,cid,moviename
from cinema
where price<=8000;

-- 극장의 위치와 고객의 주소가 같은 고객을 검색
select distinct c.custname, c.addredd
from moviecustomer c, theater t
where c.addredd like t.location;

-- 집계 질의
-- 극장의 수 검색
select count(*)
from theater;

-- 상영되는 영화의 평균 가격
select avg(price)
from cinema;

-- 2020-09-01에 영화를 관람한 고객의 수 
select count(*)
from reservation
where rdate='2020-09-01';

-- 부속 질의와 조인
-- 대한 극장에서 상영된 영화제목을 검색
select moviename
from cinema c
where c.ttid=(
    select ttid from theater where ttname like '대한');
    
-- 대한 극장에서 영화를 본 고객의 이름 검색
select c.custname
from theater t,reservation r, moviecustomer c
where t.ttid=r.ttid
and r.custid=c.custid
and t.ttname like '대한';

-- 대한 극장의 전체 수입을 검색

select sum(c.price)
from theater t,reservation r, cinema c
where t.ttid=c.ttid
and c.ttid=r.ttid and c.cid=r.cid
and t.ttname like '대한';

select sum(c.price)
from cinema c
where c.ttid in (
select r.ttid
from reservation r, theater t
where t.ttid=r.ttid
and t.ttname like '대한');

-- 그룹 질의
-- 극장별 상영관 수 

select ttid,count(*)
from cinema
group by ttid;

-- 잠실에 있는 극장의 상영관을 검색

select *
from theater t,cinema c
where t.ttid=c.ttid
and t.location like '잠실';

-- 2020-09-01에 극장별 평균 관람 고객의 수 검색
select ttid,count(custid)
from reservation
where rdate='2020-09-01'
group by ttid;

-- DML

-- 각 테이블에 데이터를 삽입하는 insert문을 하나씩 실행

-- 상영관 데이터 삽입
insert into cinema values(1,8,'범죄도시4',15000,7);

-- 고객 데이터 삽입
insert into moviecustomer values(5,'권민현','마포');

-- 예약 데이터 삽입
insert into reservation values(1,8,5,7,'2024-04-24');

-- 극장 데이터 삽입
insert into theater values(4,'롯데','서면');

-- 영화 가격 10% 인상
update cinema
set price=price*1.1;























