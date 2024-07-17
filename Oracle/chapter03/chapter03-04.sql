-- chapter03-04

-- 집계 함수와 group by 검색
-- 집계
-- 도서 판매의 총액, 일별 판매량 등 집계된 정보
-- 집계하기 위해서는 group by문을 사용하고 구체적은 집계 내용은 집계 함수를 사용

-- 집계 함수
-- sum / sum([all | distinct] 속성이름); / 합계
-- avg / avg([all | distinct] 속성이름); / 평균
-- count / count([all | distinct] 속성이름); / 개수
-- max / max([all | distinct] 속성이름); / 최대값
-- min / min([all | distinct] 속성이름); / 최소값

-- 고객의 주문한 도서의 총 판매액을 검색
desc orders;
select *from orders;
select sum(saleprice) from orders;

-- sql문에서 sum(saleprice)은 저장된 데이터를 가공하여 얻는 새로운 결과 열이기 때문에 
-- 결과 테이블에 별도의 이름 없이 'sum(saleprice)'라 출력
-- 의미있는 열 이름을 출력하고 싶으면 as 키워드를 사용하여 열 이름을 부여
select sum(saleprice) as 총매출 from orders;
select sum(saleprice) 총매출 from orders;
select sum(saleprice) "전체 매출" from orders;
-- 최근 버전의 DBMS에서는 as키워드를 생략할 수 있다.

-- 2번 김연아 고객이 주문한 도서의 총 판매액을 검색
select sum(saleprice) from orders where custid=2;

-- 집계 함수는 여러 개를 혼합하여 쓸 수 있다.

-- 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 검색
select sum(saleprice) as total,
    avg(saleprice) as average,
    min(saleprice) as minimum,
    max(saleprice) as maximun from orders;
    
-- 집계 함수 count는 행의 개수를 검색
-- count() ()안에는 * 혹은 속성이름을 사용
-- 해당 속성의 투플의 개수를 검색
-- 투플의 개수 -> 카디널리티
-- count(*) - 전체 투플의 수를 검색(특정 속성의 null값은 제외)
-- count(publisher) -> 출판사의 수를 검색, null값은 제외
-- count(distinct publisher)는 중복을 제거한 출판사의 수를 검색(null값은 제외)

-- 마당 서점의 도서판매 건수를 검색
select count(*) from orders;

-- group by 검색
-- sql문에서 group by절을 사용하면 같은 속성값끼리 그룹화할 수 있다.

-- 고객별로 주문한 도서의 총수량과 총판매액을 검색
select *from orders order by custid;

select custid,count(*) as 도서수량,sum(saleprice) as 총액
from orders
group by custid;

-- having절은 group by절의 결과에서 나타나는 그룹을 제한하는 역할

-- 가격이 8000원 이상인 도서를 구매한 고객에 대하여
-- 고객별 주문 도서의 총수량을 검색
-- 단, 2권이상 구매한 고객만 검색
select custid, count(*) as 도서수량
from orders
where saleprice>=8000
group by custid
having count(*)>=2;

-- group by와 havin절 사용시 주의 사항
-- group by로 투플을 그룹으로 묶은 후 select절에는 group by에서 
-- 사용한 속성과 집계함수만 넣을 수 있다.
select sum(saleprice),custid -- 맞는 예
from orders
group by custid;

select sum(saleprice),bookid -- 틀린 예
from orders
group by custid;

-- where절과 having절이 같이 포함된 sql문은 검색조건이 모호해질 수 있다.
-- having절 주의 사항
-- having절은 반드시 group by절과 같이 사용해야 한다.
-- where절보다 뒤에 작성해야 한다.
-- 검색조건에는 집계함수(sum,avg,count,min,max)를 작성해야 한다.

-- group by 절이 포한된 sql문의 실행 순서
select custid,count(*) as 도서수량 ---- 5
from orders --------------------------- 1
where saleprice>=8000 ----------------- 2
group by custid ----------------------- 3
having count(*)>1 --------------------- 4
order by custid; ---------------------- 6

select bookid,bookname
from book
where bookid=1;

select bookname,price
from book 
where price>=20000;

select custid,sum(saleprice) as 총구매액
from orders
where custid=1
group by custid;

select custid,count(*) as 도서수량
from orders
group by custid
having custid=1;

select custid,count(publisher) as 출판사수
from book join orders
on book.bookid=orders.bookid
group by custid
having custid=1;

select bookname as 책이름,
price as 정가,
price-saleprice as 가격차이
from book join orders
on book.bookid=orders.bookid
where custid=1;

select *from orders;
select count(*)
from book;

select count(distinct publisher)
from book;

select name, address
from customer;

select orderid
from orders
where orderdate between'2020/07/04'and'2020/07/07';

select orderid
from orders
where orderdate<'2020/07/04' or orderdate>'2020/07/07';

select name,address
from customer
where name like '김%';

select name,address
from customer
where name like '김%아';






















