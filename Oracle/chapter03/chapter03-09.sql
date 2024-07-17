-- chapter03-09

-- 집합 연산
-- 테이블 -> 투플의 집합 테이블 간의 집합 연산을 이용하여 합집합, 차집합
-- 교집합을 구할 수 있다. 

-- sql에서 집합 연산
-- 합집합 union
-- 차집합 minus
-- 교집합 intersect

-- 도서를 주문하지 않은 고객의 이름을 검색
select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

-- exists
-- 상관 부속질의문 형식
-- 조건에 맞는 투플이 존재하면 결과에 포함
-- not exists 부속질의문의 모든 행이 조건에 만족하지 않을 때만 참


-- 주문이 있는 고객의 이름과 주소를 검색
select name,address
from customer c
where exists (
    select *
    from orders o
    where c.custid=o.custid);

