-- chapter03-13

-- 데이터 조작어 삽입,수정,삭제
-- 프로그램의 기본기능 CRUD(create,read,update,delete)
-- 만들어진 테이블의 투플(행)을 삽입, 삭제, 수정

-- insert문 (삽입)
-- 테이블에 새로운 투플을 삽입하는 명령

-- insert문의 문법
-- insert into 테이블명([속성리스트])
-- values(값리스트);

-- book테이블에 새로운 도서 '스포츠 의학' 삽입
-- '스포츠 의학'은 한솔의학서적에서 출간, 가격은 90000원

select * from book;

insert into book(bookid,bookname,publisher,price)
values(11,'스포츠 의학','한솔의학서적',90000);

-- 새로운 투플을 삽입할 때 속성의 이름은 생략할 수 있다.
-- 이 때 데이터의 입력 순서는 속성의 순서와 일치해야 한다.

insert into book
values(12,'스포츠 의학','한솔의학서적',90000);

-- 속성의 이름의 순서를 바꾸게 되면 데이터의 순서도 바꾸면 된다.
insert into book(bookid,bookname,price,publisher)
values(13,'스포츠 의학',90000,'한솔의학서적');

-- 몇 개의 속성만 입력해야 한다면 해당되는 속성만 명시하면 된다.
-- book 테이블에 새로운 도서 '스포츠 의학'을 삽입
-- '스포츠 의학'은 '한솔의학서적'에서 출간, 가격은 미정
insert into book(bookid,bookname,publisher)
values(14,'스포츠 의학','한솔의학서적');

-- insert문은 select문을 사용하여 작성 가능
-- 한꺼번에 여러개의 투플을 삽입하는 방법

-- 수입도서 목록(imported_book)을 테이블에 모두 삽입
select * from imported_book;

insert into book(bookid,bookname,publisher,price)
    select bookid,bookname,publisher,price
    from imported_book;

-- 데이터베이스 이름 규칙
-- 새로운 단어가 조합될 때 언더바를 쓰는 것이 일반적
-- ex) imported_book
-- 데이터베이스 접속 라이브러리에서 importedBook카멜표기법으로 돼있는 이름을
-- 언더바로 자동변환 기능이 대부분 있다.


-- update문
-- 특정 속성의 값을 수정하는 명령

-- update문의 문법
-- update 테이블명
-- set 속성이름1 = 값1 ,[속성이름2 = 값2]....
-- [where <검색조건>]

-- customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경
update customer
set address='대한민국 부산'
where custid=5;

select * from customer;

-- update문은 다른 테이블의 속성값을 이용하여 변경 가능

-- customer 테이블에서 '박세리' 고객의 주소를 '김연아' 고객의 주소로 변경
update customer
set address=(select address from customer where name like '김연아')
where name like '박세리';

-- update문 작성 시 주의사항
update customer1
set address='대한민국 서울';
-- 모든 고객의 주소가 '대한민국 서울'로 변경
-- update문은 일반적으로 특정 값만 변경하기 때문에 where문의 유무를 주의해야한다.


-- delete문
-- 테이블에 있는 기존 투플을 삭제하는 명령

-- delete문의 문법
-- delete from 테이블명
-- [where <검색조건>]
-- delete문은 검색 조건에 해당하는 투플을 삭제
-- 검색 조건이 없으면 모든 투플을 삭제(주의사항)
-- delete문 역시 where절의 유무를 주의해야 한다.

-- customer 테이블에서 고객번호가 5인 고객을 삭제
delete from customer
where custid=5;

select * from customer;

-- 모든 고객을 삭제
delete from customer;
-- 오류가 발생
-- orders 테이블에서 custname,custid속성을 외래키로 참조
-- 제약이 해제되거나 orders 테이블이 삭제되지 않으면 삭제가 중지된다.








