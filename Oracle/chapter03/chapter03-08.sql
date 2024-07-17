--Quiz 풀이

-- 박지성의 총 구매액

select sum(saleprice)
from orders, customer
where customer.custid=orders.custid and customer.name like '박지성';

-- 박지성이 구매한 도서의 수

select count(*)
from orders o, customer c
where c.custid=o.custid and c.name like '박지성';

-- 박지성이 구매한 도서의 출판사 수 

select count(distinct publisher)
from customer c, orders o, book b
where c.custid=o.custid and o.bookid=b.bookid and c.name like '박지성';

-- 박지성이 구매한 도서의 이름,가격, 정가와 판매가격 차이

select bookname, price, price-saleprice
from customer c,orders o,book b
where c.custid=o.custid
and o.bookid=b.bookid
and c.name like '박지성';

-- 박지성이 구매하지 않은 도서의 이름

select distinct b.bookname
from book b,orders o,customer c
where b.bookid=o.bookid
and c.custid=o.custid
and c.name!='박지성';

-- 고객의 이름과 고객별 구매액

select name, sum(saleprice)
from customer c,orders o
where c.custid=o.custid
group by name;

-- 고객의 이름과 고객이 구매한 도서목록

select c.name, b.bookname
from customer c,orders o, book b
where c.custid=o.custid
and o.bookid=b.bookid;

-- 도서의 가격과 판매가격의 차이가 가장 많은 주문

select *
from book b, orders o
where b.bookid=o.bookid
and price-saleprice=(
    select max(price-saleprice)
    from book b,orders o
    where b.bookid=o.bookid);

-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름

select name,avg(saleprice)
from customer c, orders o
where c.custid=o.custid
group by name
having avg(saleprice)>( -- 도서 판매액 평균
    select avg(saleprice)
    from orders
);

-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

select name
from book b, customer c, orders o
where c.custid=o.custid
and b.bookid=o.bookid
and c.name not like '박지성'
and publisher in (
    select b.publisher 
    from book b,orders o,customer c 
    where b.bookid=o.bookid 
    and o.custid=c.custid
    and c.name like '박지성');

-- 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름

select c.name,count(distinct b.publisher)
from customer c,book b,orders o
where c.custid=o.custid
and b.bookid=o.bookid
group by c.name
having count(distinct b.publisher)>=2;

select name
from book b,orders o,customer c
where b.bookid=o.bookid
and o.custid=c.custid
group by name
having count(distinct b.publisher)>=2;

-- 전체 고객의 30% 이상이 구매한 도서

select b1.bookname
from book b1
where (
    (select count(b2.bookid)
    from book b2, orders o
    where b2.bookid=o.bookid
    and b1.bookid=b2.bookid)>=0.3*(
        select count(*)
        from customer)
);


