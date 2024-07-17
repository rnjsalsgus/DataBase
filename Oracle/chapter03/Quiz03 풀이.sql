-- Quiz03 Ǯ��

-- [���� �����ͺ��̽�]

create table theater(
    ttid number primary key,
    ttname varchar2(30),
    location varchar2(50)
);

create table cinema(
    ttid number,
    cid number check (cid>=1 and cid<=10),
    moviename varchar2(30),
    price number check (price <=20000),
    seatnumber number,
    primary key(ttid,cid)
);

create table reservation(
    ttid number,
    cid number,
    custid number,
    seatnumber number unique,
    rdate date,
    primary key(ttid,cid,custid)
);

create table moviecustomer(
    custid number primary key,
    custname varchar2(30),
    addredd varchar2(50)
);

-- ������ ����
-- ���� ������
insert into theater(ttid,ttname,location)
values(1,'�Ե�','���');
insert into theater(ttid,ttname,location)
values(2,'�ް�','����');
insert into theater(ttid,ttname,location)
values(3,'����','���');

-- �󿵰� ������

insert into cinema(ttid,cid,moviename,price,seatnumber)
values(1,1,'����� ��ȭ',15000,48);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,1,'���� ��ȭ',7500,120);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,2,'��մ� ��ȭ',8000,110);

-- ���� ������

insert into reservation
values(3,2,3,15,'2020-09-01');
insert into reservation
values(3,1,4,16,'2020-09-01');
insert into reservation
values(1,1,9,48,'2020-09-01');

-- �� ������

insert into moviecustomer
values(3,'ȫ�浿','����');
insert into moviecustomer
values(4,'��ö��','���');
insert into moviecustomer
values(9,'�ڿ���','����');


-- �ܼ�����

-- ��� ������ �̸��� ��ġ �˻�

select ttname,location
from theater;

-- ��ǿ� �ִ� ������ �˻�
select *
from theater
where location like '���';

-- ��ǿ� ��� ���� �̸��� ������������ �˻�
select custname
from moviecustomer
where addredd like '���'
order by custname;

-- ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ����
select ttid,cid,moviename
from cinema
where price<=8000;

-- ������ ��ġ�� ���� �ּҰ� ���� ���� �˻�
select distinct c.custname, c.addredd
from moviecustomer c, theater t
where c.addredd like t.location;

-- ���� ����
-- ������ �� �˻�
select count(*)
from theater;

-- �󿵵Ǵ� ��ȭ�� ��� ����
select avg(price)
from cinema;

-- 2020-09-01�� ��ȭ�� ������ ���� �� 
select count(*)
from reservation
where rdate='2020-09-01';

-- �μ� ���ǿ� ����
-- ���� ���忡�� �󿵵� ��ȭ������ �˻�
select moviename
from cinema c
where c.ttid=(
    select ttid from theater where ttname like '����');
    
-- ���� ���忡�� ��ȭ�� �� ���� �̸� �˻�
select c.custname
from theater t,reservation r, moviecustomer c
where t.ttid=r.ttid
and r.custid=c.custid
and t.ttname like '����';

-- ���� ������ ��ü ������ �˻�

select sum(c.price)
from theater t,reservation r, cinema c
where t.ttid=c.ttid
and c.ttid=r.ttid and c.cid=r.cid
and t.ttname like '����';

select sum(c.price)
from cinema c
where c.ttid in (
select r.ttid
from reservation r, theater t
where t.ttid=r.ttid
and t.ttname like '����');

-- �׷� ����
-- ���庰 �󿵰� �� 

select ttid,count(*)
from cinema
group by ttid;

-- ��ǿ� �ִ� ������ �󿵰��� �˻�

select *
from theater t,cinema c
where t.ttid=c.ttid
and t.location like '���';

-- 2020-09-01�� ���庰 ��� ���� ���� �� �˻�
select ttid,count(custid)
from reservation
where rdate='2020-09-01'
group by ttid;

-- DML

-- �� ���̺� �����͸� �����ϴ� insert���� �ϳ��� ����

-- �󿵰� ������ ����
insert into cinema values(1,8,'���˵���4',15000,7);

-- �� ������ ����
insert into moviecustomer values(5,'�ǹ���','����');

-- ���� ������ ����
insert into reservation values(1,8,5,7,'2024-04-24');

-- ���� ������ ����
insert into theater values(4,'�Ե�','����');

-- ��ȭ ���� 10% �λ�
update cinema
set price=price*1.1;























