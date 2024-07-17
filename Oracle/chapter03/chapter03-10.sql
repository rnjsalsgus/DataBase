-- chapter03-10

-- ������ ���Ǿ�(DDL, Data Definition Language)
-- ������ �����ϴ� ���̺��� ������ ����� create��
-- ������ �����ϴ� alter��, ������ �����ϴ� drop��

-- create��
-- create���� ����
-- create table ���̺��
-- ([�Ӽ��̸� ������Ÿ��
--  [null | not null | unique | default �⺻�� | check üũ����])

-- ������ ���� �Ӽ��� ���� NewBook ���̺��� ����
-- �������� number��� �������� ������ ����Ÿ���� varchar ���
-- bookid(������ȣ - number),
-- bookname(�����̸� - varchar(20)
-- publisher(���ǻ� - varchar(20)
-- price(���� - number)

-- ������ ������Ÿ�� - char,varchar,varchar2
-- char(n) - n����Ʈ�� ���� ������ Ÿ��
-- ����Ǵ� ������ ���̰� n���� ������ �������� �������� ä���� 
-- n����Ʈ�� ����� ����
-- ex) char(20)

-- varchar(n) - n����Ʈ�� ���� ������ Ÿ��
-- ����Ǵ� ������ ���̸�ŭ�� �����Ҹ� �����ϴ� �������̴�.
-- ex) varchar(20)

-- varchar2(n) - varchar(n) Ÿ�԰� ������ ����Ŭ���� ����� ��õ

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- �⺻Ű�� ����

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookid)
);

-- �⺻Ű ���� �ι�° ���
drop table newbook;

create table newbook(
    bookid number primary key,
    bookname varchar2(20),
    publisher varchar2(20),
    price number
);

-- �� ���� �Ӽ��� �⺻Ű�� ����
create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number,
    primary key(bookname,publisher)
);

drop table newbook;

-- ������� �߰�
-- bookname�� null���� ���� �� ����, publisher�� ���� ���� ������ �ȵȴ�.
-- price�� ���� �Էµ��� ���� ��� �⺻�� 10000���� ����
-- ������ �ּ� 1000�� �̻����� �Ѵ�.
create table newbook(
    bookid number,
    bookname varchar2(20) not null,
    publisher varchar2(20) unique,
    price number default 10000 check(price>=1000),
    primary key (bookname, publisher)
);

-- ������ ���� �Ӽ��� ���� newCustomer���̺��� ����
-- custid(����ȣ) - number, �⺻Ű
-- name - varchar2(40)
-- address(�ּ�) - varchar(40)
-- phone(��ȭ��ȣ) - varchar(30)

create table newcustomer(
    custid number primary key,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30));

-- ������ ���� �Ӽ��� ���� neworders���̺��� ����
-- orderid(�ֹ���ȣ) - number, �⺻Ű
-- custid(����ȣ) - number, not null ��������
-- bookid(������ȣ) - number, not null ��������
-- saleprice(�ǸŰ���) - number
-- orderdate(�Ǹ�����) - date

create table neworders(
    orderid number primary key,
    custid number not null,
    bookid number not null,
    saleprice number,
    orderdate date);
    
-- custid(����ȣ) - number, not null ��������
-- �ܷ�Ű(newcustomer.custid, �������)

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

-- �ܷ�Ű ���������� ����� �� ������ ��
-- �ݵ�� �����̺��� �⺻Ű���� �Ǵ� ���̺�(�θ� ���̺�)�� �����ؾ��ϸ�
-- �����Ǵ� ���Ѵ�.

-- �ܷ�Ű ������ on delete �ɼ�
-- cascade - ������� 
-- set null - null������ �ٲ۴�.
-- no action - �⺻������ ��� ���۵� ������ �ʴ´�.

-- �Ӽ� ������Ÿ���� ����
-- number(p,s) - �Ǽ��� p�ڸ� ���� �κ�, �Ҽ��κ� s�ڸ�
-- p,s ���� �� �⺻���� number(8,2)�� ����
-- char(n) - ������ ��������, ���ڸ� �����ϰ� ���� ������ �������� ä���.
-- varchar(n) - ������ ��������, 4000����Ʈ���� ����
-- date - ��¥��, ���� , ��, ��, �ð��� ����









