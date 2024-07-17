-- chapter03-03

-- select문 예제
-- 기본 검색
-- 모든 도서의 이름과 가격을 검색
select bookname,price from book;
-- 대소문자를 구분하지 않는다.
-- SQL예약어는 대문자로, 테이블이나 속성이름은 소문자로 작성하지만 아주 엄격한 규칙은 아님

-- 모든 도서의 도서번호, 도서이름, 출판사, 가격을 검색
select bookid,bookname,publisher,price from book;

-- book테이블에 모든 열을 조회할 때  select절에 각 열에 이름을 쓰면 된다.
-- 또는 '*'(asterisk)을 쓰면 모든 열을 조회한다.
select *from book;
-- 열의 개수가 많거나 열의 이름을 모를 때 편리하게 사용할 수 있다.

-- 도서 테이블에서 모든 출판사를 검색
select publisher from book;
-- sql문은 기본적으로 중복을 제거하지 않는다.
-- 따라서 결과에 같은 값이 두 개 이상 나올 수 있다.
-- 중복을 제거하고 싶을 때는 distinct 키워드를 사용
select distinct publisher from book;

-- 조건 검색
-- 조건에 맞는 검색을 할 때는 where절을 사용
-- 비교 =, > , < , <= , >=  / price<20000
-- 범위 between / price between 10000 and 20000
-- 집합 in, not in / price in(10000,20000,30000)
-- 패턴 like / bookname like '축구의 역사'
-- null is null, is not null / price is null
-- 복합조건 and,or,nor / (price<20000) and (bookname like '축구의 역사')

-- 비교
-- 가격이 20000원 미만인 도서를 검색
select * from book where price<20000;

-- 범위
-- 가격이 10000원 이상 20000원 이하인 도서 검색
-- between 사용
select * from book where price between 10000 and 20000;

-- and 논리 연산자를 사용
select *from book where price>=10000 and price<=20000;

-- 집합
-- 두 개 이상의 값을 검색하려면 in 연산자와 not in 연산자를 사용
-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서 검색
select *from book where publisher in('굿스포츠','대한미디어');

-- 출판사가 '굿스포츠' 혹은 '대한미디어'사 아닌 도서 검색
select *from book where publisher not in('굿스포츠','대한미디어');

-- 패턴
-- 문자열의 패턴을 비교할 때 like 사용
-- 찾는 속성이 텍스트나 날짜 데이터를 포함하면 비교 값에는 반드시 영문 작은따옴표('')사용
-- 한글의 작은 따옴표를 사용하면 오류가 발생할 수 있다.

-- 별칭
-- select문에서 속성 다음에 as 키워드 사용

-- 모든 도서에서 책이름만 검색
select bookname from book;
select bookname as 책이름 from book;

-- 별칭 이름에 공백이 포함될 때는 ""(큰 따옴표)를 사용
select bookname as "책 이름" from book;

-- '축구의 역사'를 출간한 출판사를 검색
select bookname,publisher from book where bookname like '축구의 역사';

-- %(와일드문자) - 아무 문자열을 대신하는 키워드
-- 도서 이름에 '축구'가 포함된 도서를 검색
select bookname,publisher from book where bookname like '%축구%';

-- _(밑줄) - 특정 위치에 한 문자만 대신할 때 사용
-- 도서 이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서 검색
select * from book where bookname like '_구%';

-- 문자열 검색 시 like와 같이 사용하는 와일드 문자
-- + / 문자열을 연결 / '골프'+'바이블' : '골프 바이블'
-- % / 0개 이상의 문자열과 일치 / '%축구%' : 축구를 포함하는 문자열
-- [] / 한 개의 문자와 일치 / '[0-5]%' : 0~5사이 숫자로 시작하는 문자열
-- [^] / 한 개의 문자와 불일치 / /'[^0-5]%' : 0~5사이 숫자로 시작하지 않는 문자열
-- _ / 특정 위치의 한 개의 문자와 일치 / '_구%' : 두 번째 위치에 '구'가 들어가는 문자열

-- 복합조건 검색
-- 축구에 관한 도서 중 가격이 20000원 이상인 도서 검색
select *from book where bookname like '%축구%' and price>=20000;

-- 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색
select *from book where publisher='굿스포츠' or publisher='대한미디어';
select *from book where publisher in ('굿스포츠','대한미디어');

-- 검색 결과의 정렬
-- sql문의 실행 결과 행의 순서는 저장된 위치에 따라 결정
-- sql문의 실행 결과를 특정 순서대로 출력할 때 order by절을 사용

-- 도서를 이름순으로 검색
select *from book order by bookname;
-- 문자의 경우 정렬순서는 숫자, 영어, 한글 순으로 정렬

-- 도서를 가격 순으로 검색하고 가격이 같으면 이름 순으로 검색
select *from book order by price,bookname;
-- order by절에서 정렬을 원하는 열 이름을 순서대로 지정

-- 정렬의 기본은 오름차순,
-- 내림차순으로 정렬하여면 열 이름 다음에 desc 키워드 사용

-- 도서의 가격을 내림차순으로 정렬
-- 가격이 같다면 출판사의 오름차순으로 정렬하여 검색
select *from book order by price desc,publisher asc;

-- 오름차순을 나타내는 asc키워드는 default가 오름차순이기 때문에 생략이 가능
select *from book order by price asc;
select *from book order by price;




















