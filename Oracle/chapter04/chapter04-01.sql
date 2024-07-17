-- chapter04-01

-- sql 고급
-- 내장함수
-- sql 내장 함수
-- sql 내장함수는 다음과 같이 select 절과 where절, update절 등에서
-- 모두 사용 가능

-- select 함수명(인자,인자)
-- from 테이블명
-- where 열이름=함수명(인자,인자...)

-- update 테이블명
-- set 열이름=함수명(인자,인자)

-- 오라클에서 제공하는 내장 함수
-- 숫자 함수
-- sql문에서는 수학의 기본적인 사칙연산 가능(+,-,*,/,%)
-- 여러 연산자 중 사용 빈도가 높은 것을 내장 함수 형태로 제공

-- abs - 숫자의 절대값을 나타냄
-- 78과 -78의 절대값
select abs(78),abs(-78)
from dual;
-- dual 테이블은 실존하는 테이블이 아니라 오라클에서 일시적인
-- 연산 작업에 사용하기 위해 만든 가상테이블

-- round(숫자,m) - m자리를 기준으로 숫자 반올림
-- 4.875를 숫자 첫째짜리까지 출력
select round(4.875,1)
from dual;

-- 숫자 함수의 연산
-- 인자의 숫자 대신 열이름도 사용할 수 있고 여러함수를 복합적으로
-- 사용할 수 있다.
-- 고객별 평균 주문 금액을 백원단위로 반올림한 값을 구하시오

select custid,round(avg(saleprice),-2) as "평균금액"
from orders
group by custid;

-- 문자함수
-- 문자 데이터 타입을 가공한 결과를 반환
-- replace 함수
-- replace(s1,s2,s3) 
-- 대상 문자열 - s1, s1의 지정한 문자열 - s2, 원하는 문자열 - s3

-- 도서 제목에 야구가 포함된 도서를 '농구'로 변경한 후 도서 목록을 검색
select bookid, replace(bookname,'야구','농구'),publisher,price
from book;

-- length함수
-- length(s) - 대상 문자열s의 글자 수를 반환
-- lengthb - 바이트 단위로 반환
-- 굿스포츠에서 출간한 도서의 제목과 제목의 글자 수, 바이트 수를 검색
select bookname, length(bookname),lengthb(bookname)
from book where publisher like '굿스포츠';

-- substr(시작자리,끝자리)- 대상 문자열의 지정된 자리에서부터 지정된 길이만큼 잘라서 반환
-- 마당 서점의 고객 중에서 같은 성을 가진 인원의 수 검색
select substr(name,1,1),count(*)
from customer
group by substr(name,1,1);

insert into customer values(5,'박세리','대한민국 서울',null);

-- 날짜 시간 함수
-- 날짜 시간 함수의 종류
-- to_date(char,datetime)
-- datetime - 날짜와 시간을 나타내는 인수
-- char - 문자나 문자열
-- 문자형(char) 데이터를 date형으로 반환

-- to_char(date,datetime)
-- date형 데이터를 문자열로 변환

-- 마당 서점의 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 검색
select orderid, orderdate+10
from orders;

-- 날짜형 데이터는 -와+를 사용하여 원하는 날짜로부터 이전과 이후를 계산할 수 있다
-- sysdate함수는 데이터베이스에 설정된 현재 날짜와 시간을 반환
-- systimestamp 함수는 현재 날짜, 시간과 함께 초 이하의 시간과 서버의 timezone까지 출력

-- DBMS 서버에 설정된 현재 날짜와 시간, 요일을 확인
select sysdate,to_char(sysdate,'yyyy/mm/dd/ dy hh24:mi:ss')
from dual;

select * from orders;
insert into orders values(11,1,1,6000,sysdate);

-- null 값 처리
-- null 값에 대한 연산과 집계함수

-- 집계 함수를 사용할 때 null 값이 포함된 행에 대한 주의사항
-- 1. null+숫자연산의 결과는 null
-- 2. 집계함수를 계산할 때 null이 포함된 행은 집계에서 제외
-- 3. 집계함수에 적용되는 행이 하나도 없으면 sum,avg함수 null이 되고
-- count함수의 결과는 0

create table mybook(
    bookid number primary key,
    price number
);

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook values(3,null);

select * from mybook;

-- 1. null+숫자연산의 결과는 null
select price+100 from mybook where bookid=3;

-- 2. 집계함수를 계산할 때 null이 포함된 행은 집계에서 제외
select count(*),count(price),sum(price),avg(price)
from mybook;

-- 3. 집계함수에 적용되는 행이 하나도 없으면 sum,avg함수 null이 되고
-- count함수의 결과는 0
select sum(price),avg(price),count(*) 
from mybook where bookid>=4;

-- null값을 확인하는 방법 - is null, is not null
-- mybook 테이블의 prioce가 null 값 찾기
select * from mybook where price is null;

-- mybook 테이블의 price가 null이 아닌 값 찾기
select * from mybook where price is not null;

-- nvl 함수
-- null 값을 다른 값으로 대체하여 연산하거나 다른 값으로 출력
-- null값을 임의의 다른 값으로 변경할 수 있다. 
-- nvl(속성, 값)
-- 속싱이 null이면 값으로 대체한다.

-- 이름,전화번호가 포함된 고객목록을 검색
-- 단, 전화번호가 없는 고객은 '연락처없음'으로 표시
select * from customer;
select name, nvl(phone,'연락처없음') from customer;

-- rownum문법
-- 오라클 내부적으로 생성되는 가상 칼럼, sql조회 결과의 순번을 나타낸다.

-- 고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명만 검색
select rownum, custid, name, phone from customer
where rownum<=2;

-- rownum 사용 시 주의사항
-- 가나다순으로 정리된 고객목록에서 고객번호, 이름, 전화번호를 앞의 두 명 검색
select rownum,custid,name,phone from customer where rownum<=2 order by name;
-- 검색되는 순서를 잘보고 사용

-- select문 처리 순서 
-- 1. from customer - customer테이블을 읽어들임
-- 2. where rownum<=2 - 오라클이 데이터를 읽은 순서대로 두 개의 투플 선택
-- 3. select rownum,custid,name,phone - 속성 열을 선택
-- 4. order by name - 이름순으로 정렬

-- 부속질의 사용
select rownum 순번,custid,name,phone
from (select custid,name,phone
      from customer order by name)
where rownum<=2;














