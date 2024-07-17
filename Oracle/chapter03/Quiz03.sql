-- Quiz03

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

insert into theater(ttid,ttname,location)
values(1,'�Ե�','���');
insert into theater(ttid,ttname,location)
values(2,'�ް�','����');
insert into theater(ttid,ttname,location)
values(3,'����','���');

insert into cinema(ttid,cid,moviename,price,seatnumber)
values(1,1,'����� ��ȭ',15000,48);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,1,'���� ��ȭ',7500,120);
insert into cinema(ttid,cid,moviename,price,seatnumber)
values(3,2,'��մ� ��ȭ',8000,110);


insert into reservation
values(3,2,3,15,'2020-09-01');
insert into reservation
values(3,1,4,16,'2020-09-01');
insert into reservation
values(1,1,9,48,'2020-09-01');

insert into moviecustomer
values(3,'ȫ�浿','����');
insert into moviecustomer
values(4,'��ö��','���');
insert into moviecustomer
values(9,'�ڿ���','����');

-- ��� ������ �̸��� ��ġ�� �˻�
select ttname,location
from theater;

-- ��ǿ� �ִ� ���� �˻�
select *
from theater
where location like '���';

-- ��ǿ� ��� ���� �̸��� ������������ ���̽ÿ�
select custname
from moviecustomer
where addredd like '���';
    
-- ������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰� ��ȣ, ��ȭ������ �˻�
select ttid, cid, moviename
from cinema
where price<=8000;

-- ������ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�
select custid,custname,addredd
from theater t,moviecustomer m
where t.location=m.addredd
group by custid,custname,addredd;

-- ������ ��
select count(*) as "������ ��"
from theater;

-- �󿵵Ǵ� ��ȭ�� ��� ����
select avg(price) as "��ȭ ��� ����"
from cinema;

-- 2020-09-01�� ��ȭ�� ������ ���� ��
select count(custid) as "��ȭ���� ���� ��"
from reservation
where rdate='2020-09-01';

-- '����'���忡�� ���� ��ȭ ���� �˻�
select moviename
from theater t,cinema c
where t.ttid=c.ttid and t.ttname like '����';

-- '����'���忡�� ��ȭ�� �� ���� �̸� �˻�
select custname
from theater t, reservation r, moviecustomer m
where t.ttid=r.ttid
and r.custid=m.custid
and t.ttname like '����';

-- '����'������ ��ü ����
select sum(price)
from theater t, cinema c, reservation r
where r.ttid=c.ttid
and c.ttid=t.ttid
and r.cid=c.cid
and ttname like '����';

-- ���庰 �󿵰� ��
select ttname,count(cid) as "�󿵰� ��"
from theater t,cinema c
where t.ttid=c.ttid
group by ttname;

-- '���'�� �ִ� ������ �󿵰� �˻�
select *
from theater t,cinema c
where t.ttid=c.ttid
and t.location like '���';

-- 2020-09-01�� ���庰 ��� ���� �� �� �˻�
select ttname,avg(cid)
from theater t,reservation r, moviecustomer m
where r.custid=m.custid
and t.ttid=r.ttid
and r.rdate='2020-09-01'
group by ttname;

-- 2020-09-01 ���� ���� ���� ������ ��ȭ �˻�
select moviename
from cinema c,reservation r
where c.ttid=r.ttid
and c.cid=r.cid
and r.rdate='2020-09-01';

-- ��ȭ ������ 10% �λ�
update cinema
set price=price*1.1;

-- �Ǹſ� �����ͺ��̽�

create table salesperson(
    pname varchar2(20) primary key,
    age number,
    salary number
);

insert into salesperson
values('Tom',28,200);
insert into salesperson
values('Chris',45,350);
insert into salesperson
values('Louise',21,150);
insert into salesperson
values('Olivia',31,250);
insert into salesperson
values('Emma',36,450);

create table saleorder(
    onumber number,
    custname varchar2(30),
    salesperson varchar2(30),
    amount number,
    primary key(custname, salesperson),
    foreign key(custname) references salecustomer(cname),
    foreign key(salesperson) references salesperson(pname)
);

insert into saleorder
values(1,'Amelia','Emma',1.99);
insert into saleorder
values(2,'Sophia','Olivia',0.99);
insert into saleorder
values(3,'Adam','Louise',2.99);
insert into saleorder
values(4,'Oliver','Chris',4.99);
insert into saleorder
values(5,'James','Tom',7.99);
insert into saleorder
values(6,'Sam','Tom',5.99);
insert into saleorder
values(7,'Oliver','Louise',2.99);
insert into saleorder
values(8,'Adam','Emma',3.99);
insert into saleorder
values(9,'Adam','Chris',3.99);


create table salecustomer(
    cname varchar(30) primary key,
    city varchar(50),
    industrytype varchar(30)
);

insert into salecustomer
values('James','Atlanta','doctor');
insert into salecustomer
values('Oliver','Boston','police');
insert into salecustomer
values('Adam','Chicago','teacher');
insert into salecustomer
values('Sophia','Dallas','army');
insert into salecustomer
values('Amelia','Houston','youtuber');
insert into salecustomer
values('Smith','LA','actor');
insert into salecustomer
values('Sam','LA','actuary');



-- ��� �Ǹſ��� �̸��� �޿��� �˻�
select pname,salary
from salesperson;

-- ���̰� 30�� �̸��� �Ǹſ��� �̸� �˻�
select pname
from salesperson
where age<30;

-- 'S'�� ������ ���ÿ� ��� ���� �̸� �˻�
select cname
from salecustomer
where city like '%s';

-- �ֹ��� �� ���� ��(���� �ٸ� ����) �˻�
select count(distinct cname)
from salecustomer c,saleorder o
where c.cname=o.custname;

-- �Ǹſ� ������ ���Ͽ� �ֹ��� ���� �˻�
select pname, count(onumber)
from salesperson p,saleorder o
where p.pname=o.salesperson
group by pname;

-- 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ����(����)
select pname,age
from salesperson p,saleorder o,salecustomer c
where p.pname=o.salesperson
and o.custname=c.cname
and c.city like 'LA';

-- 'LA'�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸��� ����(�μ�����)
    
select pname,age
from salesperson
where pname in (
    select salesperson
    from saleorder
    where custname in (
        select cname
        from salecustomer
        where city like 'LA'));

-- �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸� �˻�

select o.salesperson
from  saleorder o
group by salesperson
having count(salesperson)>=2;

-- �Ǹſ� TOM�� ������ 45000������ ����
update salesperson
set salary=salary-(salary*0.98)+0.5
where pname like 'Tom';









    
    
    