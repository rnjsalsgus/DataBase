-- chapter03-10

-- 데이터 정의어(DDL, Data Definition Language)
-- 데이터 정의하는 테이블의 구조를 만드는 create문
-- 구조를 변경하는 alter문, 구조를 삭제하는 drop문

-- create문
-- create문의 문법
-- create table 테이블명
-- ([속성이름 데이터타입
--  [null | not null | unique | default 기본값 | check 체크조건])

-- 다음과 같은 속성을 가진 NewBook 테이블을 생성
-- 정수형은 number사용 문자형은 가번형 문자타입인 varchar 사용
-- bookid(도서번호 - number),
-- bookname(도서이름 - varchar(20)
-- publisher(출판사 - varchar(20)
-- price(가격 - number)

-- 문자형 데이터타입 - char,varchar,varchar2
-- char(n) - n바이트를 가진 문자형 타입
-- 저장되는 문자의 길이가 n보다 작으면 나머지는 공백으로 채워서 
-- n바이트를 만들어 저장
-- ex) char(20)

-- varchar(n) - n바이트를 가진 문자형 타입
-- 저장되는 문자의 길이만큼만 기억장소를 차지하는 가변형이다.
-- ex) varchar(20)

-- varchar2(n) - varchar(n) 타입과 같지만 오라클에서 사용을 추천

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- 기본키를 지정

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookid)
);

-- 기본키 지정 두번째 방법
drop table newbook;

create table newbook(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- 두 개의 속성을 기본키로 지정
create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookname,publisher)
);

drop table newbook;

-- 제약사항 추가
-- bookname은 null값을 가질 수 없고, publisher는 같은 값이 있으면 안된다.
-- price의 값이 입력되지 않을 경우 기본값 10000원을 저장
-- 가격은 최소 1000원 이상으로 한다.
create table newbook(
    bookid number,
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price>=1000),
    primary key (bookname, publisher)
);

-- 다음과 같은 속성을 가진 newCustomer테이블을 생성
-- custid(고객번호) - number, 기본키
-- name - varchar2(40)
-- address(주소) - varchar(40)
-- phone(전화번호) - varchar(30)

create table newcustomer(
    custid number primary key,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30));

-- 다음과 같은 속성을 가진 neworders테이블을 생성
-- orderid(주문번호) - number, 기본키
-- custid(고객번호) - number, not null 제약조건
-- bookid(도서번호) - number, not null 제약조건
-- saleprice(판매가격) - number
-- orderdate(판매일자) - date

create table neworders(
    orderid number primary key,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date);
    
-- custid(고객번호) - number, not null 제약조건
-- 외래키(newcustomer.custid, 연쇄삭제)

drop table neworders
create table neworders(
    orderid number,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date,
    primary key(orderid),
    foreign key(custid) references newcustomer(custid) 
    on delete cascade
);

-- 외래키 제약조건을 명시할 때 주의할 점
-- 반드시 참조이블은 기본키여야 되는 테이블(부모 테이블)이 존재해야하며
-- 참조되는 테한다.

-- 외래키 지정시 on delete 옵션
-- cascade - 연쇄삭제 
-- set null - null값으로 바꾼다.
-- no action - 기본값으로 어떠한 동작도 취하지 않는다.

-- 속성 데이터타입의 종류
-- number(p,s) - 실수형 p자리 정수 부분, 소수부분 s자리
-- p,s 생략 시 기본값이 number(8,2)로 저장
-- char(n) - 문자형 고정길이, 문자를 지정하고 남은 공간은 공백으로 채운다.
-- varchar(n) - 문자형 가변길이, 4000바이트까지 저장
-- date - 날짜형, 연도 , 월, 일, 시간을 지정









