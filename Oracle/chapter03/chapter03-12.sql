-- chapter03-12

-- Quiz02Ǯ��(���̺� ����)

-- ���� ���̺����
create table theater(
    ttid number primary key,
    ttname varchar2(30),
    ttlocation varchar2(30)
);

-- �󿵰� ���̺����
-- ������ 20000���� ���� �ʾƾ� �Ѵ�.
create table cinema(
    ttid number,
    cid number,
    moviename varchar2(40),
    movieprice number check (movieprice<=20000),
    chairnumber number,
    primary key(ttid,cid)
);

-- ���� ���̺����
-- �󿵰� ��ȣ�� 1~10���� 
-- ���� ����� ���� �¼� ��ȣ�� �� �� �������� �ʾƾ� �Ѵ�.
create table reservation(
    ttid number,
    cid number check (cid>=1) check (cid<=10),
    custid number,
    seatnumber number unique,
    rdate date,
    primary key(ttid,cid,custid)
);

-- �� ���̺� ����
-- ���ڿ��� ũ�� - ����Ʈ
-- varchar(20) - �����ڵ�� �ѱ��ڿ� 2byte ���� 10���ڱ��� ����
create table customers(
    custid number primary key,
    custname varchar2(50),
    custaddr varchar2(300)
);

-- �Ǹſ� �����ͺ��̽�
-- �Ǹſ� ���̺� ����
create table salesperson(
    name varchar2(100) primary key,
    age number,
    salary number
);

-- �ֹ� ���̺� ����
create table order(
    onumber number,
    custname varchar2(50),
    salesperson varchar2(50),
    amount number,
    primary key(custname,salesperson),
    foreign key(custname) references customers(custname),
    foreign key(salesperson) references salespersons(name)
);

-- �� ���̺� ����
create table customer(
    name varchar2(50) primary key,
    city varchar2(50),
    industrytype varchar2(50)
);

-- ��� ������Ʈ �����ͺ��̽�
-- ���� ���̺� ����
create table employee(
    empno number primary key,
    name varchar2(50),
    phoneno varchar2(20),
    address varchar2(100),
    sex char(1),
    position varchar2(50),
    deptno number
);

-- �μ����̺� ����
create table department(
    deptno number primary key,
    deptname varchar2(50),
    manager varchar2(10)
);

-- ������Ʈ ���̺� ����
create table project(
    projno number primary key,
    projname varchar2(50),
    deptno number
);

-- �۾� ���̺� ����
create table works(
    empno number,
    projno number,
    hours_worked number,
    primary key(empno,projno),
    foreign key(empno) references employee(empno),
    foreign key(projno) references project(projno)
);
























