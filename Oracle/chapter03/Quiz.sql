-- Quiz

-- 박지성의 총 구매액

select sum(saleprice)
from orders
where custid=1;

-- 박지성이 구매한 도서의 수

select count(*)
from orders
where custid=1;

-- 박지성이 구매한 도서의 출판사 수

select count(publisher)
from book,orders
where book.bookid=orders.bookid and custid=1;

-- 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격 차이

select bookname as 도서이름,
saleprice as 가격,
price-saleprice as "정가와 판매가격 차이"
from book,orders 
where book.bookid=orders.bookid and custid=1;

-- 박지성이 구매하지 않은 도서 이름
select bookname
from book
where bookid not in (select bookid from orders where custid=1);

-- 고객의 이름과 고객별 구매액

select name, sum(saleprice)
from customer,orders
where customer.custid=orders.custid
group by name;

-- 고객의 이름과 고객이 구매한 도서목록
select name, bookname
from customer,book,orders
where orders.bookid=book.bookid and customer.custid=orders.custid
order by name;

-- 도서의 가격과 판매가격의 차이가 가장 많이 나는 주문

select *
from orders,book
where orders.bookid=book.bookid 
and price-saleprice=(select max(price-saleprice) from book,orders where book.bookid=orders.bookid);
--group by orderid;

-- 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름

select name,avg(saleprice)
from orders,customer
where orders.custid=customer.custid
group by name
having avg(saleprice)>(select avg(saleprice)
                       from orders);
                       

-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름

select name
from customer
where custid in (select custid from orders where bookid in
(select bookid from book where publisher in (select publisher
from book,orders
where book.bookid=orders.bookid and custid=1))) and customer.name not like '박지성';


-- 마당 서점에서 택배를 보내기 위해 택배에 필요한 정보가 필요하다 택배에 필요한 정보만 추출하시오

select name,address,phone,bookname
from customer,book,orders
where customer.custid=orders.custid
and book.bookid=orders.bookid
order by name;
  
select *
from customer, orders
where customer.custid=orders.custid
and saleprice>=10000;


select *
from customer, orders
where customer.custid=orders.custid
and saleprice<10000;






