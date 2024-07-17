-- chapter03-12

-- Quiz02풀이(테이블 생성)

-- 극장 테이블생성
create table theater(
    ttid number primary key,
    ttname varchar2(30),
    ttlocation varchar2(30)
);

-- 상영관 테이블생성
-- 가격은 20000원을 넘지 않아야 한다.
create table cinema(
    ttid number,
    cid number,
    moviename varchar2(40),
    movieprice number check (movieprice<=20000),
    chairnumber number,
    primary key(ttid,cid)
);

-- 예약 테이블생성
-- 상영관 번호는 1~10사이 
-- 같은 사람이 같은 좌석 번호를 두 번 예약하지 않아야 한다.
create table reservation(
    ttid number,
    cid number check (cid>=1) check (cid<=10),
    custid number,
    seatnumber number unique,
    rdate date,
    primary key(ttid,cid,custid)
);

-- 고객 테이블 생성
-- 문자열의 크기 - 바이트
-- varchar(20) - 유니코드는 한글자에 2byte 따라서 10글자까지 저장
create table customers(
    custid number primary key,
    custname varchar2(50),
    custaddr varchar2(300)
);

-- 판매원 데이터베이스
-- 판매원 테이블 생성
create table salesperson(
    name varchar2(100) primary key,
    age number,
    salary number
);

-- 주문 테이블 생성
create table order(
    onumber number,
    custname varchar2(50),
    salesperson varchar2(50),
    amount number,
    primary key(custname,salesperson),
    foreign key(custname) references customers(custname),
    foreign key(salesperson) references salespersons(name)
);

-- 고객 테이블 생성
create table customer(
    name varchar2(50) primary key,
    city varchar2(50),
    industrytype varchar2(50)
);

-- 기업 프로젝트 데이터베이스
-- 직원 테이블 생성
create table employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(50),
    deptno number
);

-- 부서테이블 생성
create table department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar2(10)
);

-- 프로젝트 테이블 생성
create table project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);

-- 작업 테이블 생성
create table works(
    empno number,
    projno number,
    hours_worked number,
    primary key(empno,projno),
    foreign key(empno) references employee(empno),
    foreign key(projno) references project(projno)
);
























