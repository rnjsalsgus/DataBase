-- chapter06-01

-- summer 테이블 생성하고 데이터 삽입

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100,'fortran',20000);
insert into summer values(150,'pascal',15000);
insert into summer values(200,'c',10000);
insert into summer values(250,'fortran',20000);

select *from summer;

-- select문을 이용한 조회 작업
-- 학생의 학번 sid, 수강하는 과목은 class, 수강 과놈ㄱ의 수강료는 price
-- 계정학기를 듣는 학생의 학번과 수강과목
select sid,class from summer;

-- 수강료가 가장 비싼 과목
select distinct class from summer
where price=(select max(price) from summer);

-- 삭제 이상
-- 200번 학생의 계절학기 수강신청을 취소
delete summer where sid=200;

select *from summer;

-- c 강좌 수강료를 조회
select price as "c 수강료" from summer where class like 'c';

-- 200번 학생이 수강신청을 취소하여 관련 투플을 삭제
-- 200번 학생의 수강신청은 잘 취소가 되었지만
-- c강좌의 수강료를 조회할 수 없게 되었다.
-- 학생의 수강신청을 취소하면서 수강료도 함께 삭제
-- 삭제 이상 발생


insert into summer values(200,'c',10000);

-- 삽입 이상
-- 계절학기에 새로운 자바 강좌를 개설
-- 자바강좌 삽입

insert into summer values(null,'java',25000);

-- 전체 데이터 조회
select *from summer;

-- 수강한 학생의 총수를 조회
select count(*) from summer;
-- 수강한 학생의 총 수가 4명이지만 5라는 결과로 조회

-- 테이블 데이터가 많을 때 전체 데이터를 전부 파악하여
-- sql문을 만들어야 하는 단점이 있다.
select count(sid) from summer;
-- 삽입 이상
-- 자바 강좌 새로 개설, 수강료25000원, 신청학생은 아직 없음
-- 자바 강좌를 추가하기 위해 insert문을 사용하는데 
-- 신청한 학생이 없어 학번에는 null 값이 입력
-- null 값은 집계 함수 사용 시 원하지 않는 결과를 만들어냄

-- fortran 강좌의 수강료를 20000원에서 15000원으로 수정
update summer set price=15000 where class like 'fortran' and sid=100;

-- fortran 수강료 조회
select price from summer where class like 'fortran';
-- 2건이 조회되어 데이터 불일치 문제 발생

-- 수정이상
-- fortran 강좌의 수갈요가 20000원에서 15000원으로 변경되어 update문으로 수정
-- update문은 조건에 맞는 값을 일괄 수정하지만, 
-- 조건을 잘못 사용하면 데이터 불일치 문제가 발생

-- 수정된 계정학기 수강 테이블
-- 테이블 구조를 수정하여 이상현상이 발생하지 않도록 만든다
-- summer 테이블은 summer_price와 summer_enroll 테이블로 분리
-- summer_price 테이블은 과목에 대한 수강료 정보를 저장
-- summer_enroll 테이블은 학생들의 수강신청 정보를 저장

create table summer_price(
    class varchar2(20),
    price integer
);

insert into summer_price values('fortran',20000);
insert into summer_price values('pascal',15000);
insert into summer_price values('c',10000);

-- summer_enroll 테이블 생성
create table summer_enroll(
    sid integer,
    class varchar(20)
);

insert into summer_enroll values(100,'fortran');
insert into summer_enroll values(150,'pascal');
insert into summer_enroll values(200,'c');
insert into summer_enroll values(250,'fortran');

-- 200번 학생의 계절학기 수강 신청을 취소
-- c 강좌 수강료 조회
select price from summer_price where class='c';
-- 수강취소
delete from summer_enroll where sid=200;
select *from summer_enroll;
-- c 강좌 수강료 조회
select price from summer_price where class='c';
-- 삭제 이상 없음
-- 200번 학생의 수강신청 취소도 잘 처리되었고,
-- 연쇄삭제 현상을 나타나지 않음
-- c강좌의 수강료는 조회 가능\

-- 계절 학기의 새로운 자바 강좌 개설
insert into summer_price values('java',25000);
select *from summer_price;
-- 삽입 이상 없음
-- 아직 신청한 학생은 없지만, null값을 입력할 필요가 없어 삽입이상 발생 없음

-- fortran강좌의 수강료를 20000원에서 15000원으로 수정
update summer_price set price=15000 where class like 'fortran';
select *from summer_price;
select price from summer_price where class like 'fortran';
-- 수정 이상 없음
-- fortran과목의 수강료는 하나만 저장되어 있으므로 수정 후 데이터의
-- 불일치를 우려할 필요가 없음

-- 테이블의 분리를 통해 이상현상을 해결할 수 있음

















