-- Quiz03

-- �Ǹſ� �����ͺ��̽�

-- �Ǹſ� ���̺�
create table salesperson(
    pname varchar2(20) primary key,
    age number,
    salary number
);

-- �ֹ� ���̺�
create table saleorder(
    onumber number,
    custname varchar2(30),
    salesperson varchar2(30),
    amount number,
    primary key(custname, salesperson),
    foreign key(custname) references salecustomer(cname),
    foreign key(salesperson) references salesperson(pname)
);

-- �� ���̺�
create table salecustomer(
    cname varchar(30) primary key,
    city varchar(50),
    industrytype varchar(30)
);

-- ��� �Ǹſ��� �̸��� �޿� �˻�
select distinct pname,salary
from salesperson;

-- ���̰� 30�� �̸��� �Ǹſ��� �̸� �˻�
select pname
from salesperson
where age<30;

-- 's'�� ������ ���ÿ� ��� ���� �̸� �˻�
select cname
from salecustomer
where city like '%s';

-- �ֹ��� �� ���� ��(���� �ٸ� ����)
select count(distinct custname)
from saleorder;

-- �Ǹſ� ������ ���Ͽ� �ֹ��� �� �˻�
select salesperson ,count(*)
from saleorder
group by salesperson;

-- LA�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸�,���� �˻�(�μ�����)
select pname,age
from salesperson
where pname in (select salesperson
from saleorder
where custname in (select cname
from salecustomer
where city like 'LA'));

-- LA�� ��� �����κ��� �ֹ��� ���� �Ǹſ��� �̸�,���� �˻�(����)
select pname,age
from salesperson p, saleorder o, salecustomer c
where p.pname=o.salesperson
and o.custname=c.cname
and c.city like 'LA';

-- �� �� �̻� �ֹ��� ���� �Ǹſ��� �̸� �˻�
select salesperson
from saleorder
group by salesperson
having count(*)>=2;

-- �Ǹſ� Tom�� ������ 45,000������ ����
update salesperson
set salary=45000
where pname like 'Tom';

select * from salesperson;

















