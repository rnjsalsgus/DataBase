-- Quiz02

-- 테이블 생성

create table theater(
    theaterid number,
    thertername varchar2(20),
    location varchar2(20),
    primary key(theaterid)
);

create table hall(
    theaterid number,
    hallid number check(1<=hallid and hallid<=10),
    moviename varchar(20),
    price varchar(20) check(price<=20000),
    seats number,
    primary key(theaterid, hallid)
);

create table reservation(
    theaterid number,
    hallid number,
    custid number,
    seatid number unique,
    reserdate date,
    primary key(theaterid, hallid, custid)
);

create table customer1(
    custid number,
    name varchar(20),
    address varchar(20),
    primary key(custid)
);

create table salesperson(
    name varchar(20),
    age number,
    salary number,
    primary key(name)
);

create table order1(
    orderid number,
    custname varchar2(20),
    salesperson varchar(20),
    amount number,
    primary key(custname,salesperson),
    foreign key(custname) references customer2(name),
    foreign key(salesperson) references salesperson(name)
);

create table customer2(
    name varchar(20),
    ciry varchar(20),
    industrytype varchar(20),
    primary key(name)
);

create table employee(
    empno number,
    name varchar(20),
    phoneno number,
    address varchar(20),
    sex varchar(20),
    position varchar(20),
    deptno number,
    primary key(empno)
);

create table department(
    deptno number,
    deptname varchar(20),
    manager varchar(20),
    primary key(deptno)
);

create table project(
    projno number,
    projname varchar(20),
    deptno number,
    primary key(projno)
);

create table works(
    empno number,
    projno number,
    hoursworked number,
    primary key(empno,projno),
    foreign key(empno) references employee(empno),
    foreign key(projno) references project(projno)
);





