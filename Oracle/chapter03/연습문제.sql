-- ���� ����

-- ������ȣ�� 1�� ������ �̸�
select bookname
from book
where bookid=1;

-- ������ 20000�� �̻��� ������ �̸�
select bookname
from book
where price>=20000;

-- �������� �� ���ž�
-- ����ȣ 1
select sum(saleprice)
from orders
where custid=1;

-- �������� ������ ������ ��
select count(*)
from orders
where custid=1;

-- �������� ������ ������ ���ǻ��� �� 
select bookid
from orders
where custid=1;
--�������� ������ ������ ���̵� 1,3,2
select count(distinct publisher)
from book
where bookid in (1,3,2);

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select bookname,price
from book 
where bookid in (1,3,2);

select sum(price)
from book
where bookid in (1,3,2);

select sum(saleprice)
from orders
where custid=1;

-- ���缭�� ������ �� ����
select count(*)
from book;

-- ���缭���� ����ϴ� ���ǻ��� �� 
select count(distinct publisher)
from book;

-- ��� ���� �̸�, �ּ�
select name,address
from customer;

-- 2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ �ֹ���ȣ
select *
from orders
where orderdate between '20200704'and'20200707';

-- 2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ ������ �ֹ���ȣ
select *
from orders
where orderdate not between '20200704'and'20200707';

-- ���� '��'���� �� �̸�,�ּ�
select name,address
from customer
where name like '��%';

-- ���� '��'�� �̰� �̸��� '��'�� ������ ���� �̸�, �ּ�
select name,address
from customer
where name like '��%��';


