-- chapter04-03

-- 뷰(View)
-- 마당 서점에서 택배배송을 하기 위해 택베에 필요한 정보만 추출
-- 매번 질의할 때마다 조인이나 부속질의를 하는 것은 번거로움
-- 택배 정보만 저장되어 있으면 이후에 간편하게 정보를 조회할 수 있다. 
-- 뷰는 하나 이상의 테이블을 합하여 만든 가상의 테이블
-- select문을 통해 얻은 최종 결과를 가상의 테이블로 정의하여
-- 실제 테이블처럼 사용할 수 있도록 만든 데이터베이스 개체

-- 뷰 생성
-- 뷰를 생성하는 문법
-- create view 뷰이름 [(열이름[,...n])]
-- as sql문

-- book 테이블에서 '축구'라는 문구가 포함된 자료만 보여주는 뷰 생성
select *from book where bookname like '%축구%';

-- select문을 이용해 뷰 정의문 작성
create view vw_book
as select * from book where bookname like '%축구%';
-- vw_book이라는 뷰가 생성되며 일반 데이터처럼 사용가능

-- 뷰는 실제 데이터가 저장되는 것이 아니라 뷰의 정의가 DBMS에 저장되는 것
-- book 테이블에 '축구'라는 문구가 포한된 도서가 새로 추가되면
-- 추가된 데이터 역시 뷰에도 나타난다.
-- 추가된 도서이름에 '축구'가 포함되어 있지 않다면 book테이블에는 존재하지만
-- 뷰에는 나타나지 않는다.

-- '축구'라는 문구가 포함된 자료 검색
-- 뷰를 이용
select *from vw_book;

-- 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회
-- 뷰의 이름은 vw_customer로 설정
create view vw_customer
as select * from customer where address like '%대한민국%';
select * from vw_customer;

-- orders테이블에서 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후,
-- '김연아'고객이 구입한 도서의 주문번호,도서이름,주문액을 검색
select o.orderid,c.custid,b.bookid,b.bookname,o.saleprice,o.orderdate
from customer c, book b, orders o
where c.custid=o.custid and b.bookid=o.bookid;

create view vw_orders(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select o.orderid,c.custid,c.name,b.bookid,b.bookname,o.saleprice,o.orderdate
   from customer c, book b, orders o
   where c.custid=o.custid and b.bookid=o.bookid;

select orderid,bookname,saleprice from vw_orders
where name like '김연아';

-- 뷰의 수정
-- 문법
-- create or replace veiw 뷰이름[(열이름[,...])]
-- as select문

-- vw_customer 주소가 '대한민국'인 고객
-- 해당 뷰의 '영국'을 주소로 가진 고객으로 변경
-- phone 속성은 필요없으므로 포함하지 않는다.

create or replace view vw_customer(custid,name,address)
as select c.custid,c.name,c.address from customer c where address like '%영국%';

-- 뷰의 삭제
-- drop view 뷰이름[,....]

-- vw_customer를 삭제
drop view vw_customer;


















