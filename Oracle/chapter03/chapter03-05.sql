-- chapter03-05

-- 두 개 이상의 테이블에서 sql질의
-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
-- sql은 여러 개의 테이블을 이용하여 질의하는 두 가지 방법을 제공
-- 1. 조인(join)
-- 2. 부속질의(subquery)

-- Join
-- 두 개의 테이블을 연결한다.
-- 조인은 한 테이블의 행을 다른 테이블의 행에 연결하여
-- 두 개 이상의 테이블을 결합하는 연산

-- customer 테이블을 order 테이블과 조건 없이 연결
select *
from customer, orders
group by custid;
-- 고객이 5명 X 주문이 10건이므로 총 50개의 행

select *from customer;
select *from orders;

-- Ex) 박지성 custid가 1이므로 orders테이블에서 custid가 1인 것과 연결

-- 고객과 고객이 주문에 관한 데이터를 모두 검색
select *
from customer,orders
where customer.custid=orders.custid;

-- order by절을 이용하여 정렬
-- 고객과 고객의 주문에 관한 데이터를 고객별로 정렬하여 검색
select *
from customer,orders
where customer.custid=orders.custid
order by customer.custid;

-- 조인을 사용하면 두 개 이상의 데이블에서 일부 테이더만 얻을 수 있다. 
-- 고객의 이름과 고객이 주문한 도서의 판매가격을 검색
select name, saleprice
from customer,orders
where customer.custid=orders.custid;

-- 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하여 검색
select name, sum(saleprice)
from customer,orders
where customer.custid=orders.custid
group by customer.name
order by customer.name;

-- 3개 이상의 테이블을 join 할 수 있다.
select *from orders;

-- 마당서점에 주문된 내역을 고객 정보와 책 정보까지 모두 검색
select *
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid;

-- 고객의 이름과 고객이 주문한 도서의 이름을 검색
select customer.name, book.bookname
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid;

-- 가격이 20000원인 도서를 주문한 고객의 이름과 도서의 이름을 검색
select customer.name, book.bookname
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid and book.price=20000;

-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격 검색
-- 내부 조인, 외부 조인 
select customer.name,saleprice
from customer left outer join orders
on customer.custid=orders.custid;

-- join 문법
-- 내부조인

-- select 속성들
-- from 테이블,테이블
-- where 조인조건 and 검색조건

-- select 속성들
-- from 테이블1 inner join 테이블1 on 조인조건
-- where 검색조건;

-- 외부 조인

-- select 속성들
-- from 테이블1 {left | right | full[outer]} join 테이블2 on 조인조건
-- where 검색조건

-- 오라클 +기호로 외부조인을 수행할 수 있다.
-- 왼쪽 외부조인인 경우 (+) 기호를 조인조건의 오른쪽에 
-- 오른쪽 외부조인인 경우(+)를 왼쪽에 붙인다.

-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 검색
select customer.name,saleprice
from customer,orders
where customer.custid=orders.custid(+);