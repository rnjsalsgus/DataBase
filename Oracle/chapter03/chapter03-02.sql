-- 데이터 조작어 - 검색
-- select문 문법
-- sql의 select문은 데이터를 검색하는 기본 문장
-- 특별히 질의어(query)라고 부른다.
-- select문은 검색 결과를 테이블 형태로 출력
-- ex) 10000원 이상인 도서의 이름과 출판사를 보이시오
select bookname,publisher from book where price>=10000;

select bookname,publisher 
from book 
where price>=10000;

-- select문의 기본문법
-- select [all | distinct] 속성이름 
-- from 테이블명
-- [where 검색조건];
-- [group by 속성이름];
-- [having 검색조건];
-- [order by 속성이름 [desc]];
-- [] - 생략가능 sql예약어들은 선택적으로 사용할 수 있다.
-- | - 선택 가능한 문법들 중 한 개를 사용할 수 있다. 