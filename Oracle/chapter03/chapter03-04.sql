-- chapter03-04

-- ���� �Լ��� group by �˻�
-- ����
-- ���� �Ǹ��� �Ѿ�, �Ϻ� �Ǹŷ� �� ����� ����
-- �����ϱ� ���ؼ��� group by���� ����ϰ� ��ü���� ���� ������ ���� �Լ��� ���

-- ���� �Լ�
-- sum / sum([all | distinct] �Ӽ��̸�); / �հ�
-- avg / avg([all | distinct] �Ӽ��̸�); / ���
-- count / count([all | distinct] �Ӽ��̸�); / ����
-- max / max([all | distinct] �Ӽ��̸�); / �ִ밪
-- min / min([all | distinct] �Ӽ��̸�); / �ּҰ�

-- ���� �ֹ��� ������ �� �Ǹž��� �˻�
desc orders;
select *from orders;
select sum(saleprice) from orders;

-- sql������ sum(saleprice)�� ����� �����͸� �����Ͽ� ��� ���ο� ��� ���̱� ������ 
-- ��� ���̺� ������ �̸� ���� 'sum(saleprice)'�� ���
-- �ǹ��ִ� �� �̸��� ����ϰ� ������ as Ű���带 ����Ͽ� �� �̸��� �ο�
select sum(saleprice) as �Ѹ��� from orders;
select sum(saleprice) �Ѹ��� from orders;
select sum(saleprice) "��ü ����" from orders;
-- �ֱ� ������ DBMS������ asŰ���带 ������ �� �ִ�.

-- 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� �˻�
select sum(saleprice) from orders where custid=2;

-- ���� �Լ��� ���� ���� ȥ���Ͽ� �� �� �ִ�.

-- ���� �ֹ��� ������ ���Ǹž�, ��հ�, ������, �ְ��� �˻�
select sum(saleprice) as total,
    avg(saleprice) as average,
    min(saleprice) as minimum,
    max(saleprice) as maximun from orders;
    
-- ���� �Լ� count�� ���� ������ �˻�
-- count() ()�ȿ��� * Ȥ�� �Ӽ��̸��� ���
-- �ش� �Ӽ��� ������ ������ �˻�
-- ������ ���� -> ī��θ�Ƽ
-- count(*) - ��ü ������ ���� �˻�(Ư�� �Ӽ��� null���� ����)
-- count(publisher) -> ���ǻ��� ���� �˻�, null���� ����
-- count(distinct publisher)�� �ߺ��� ������ ���ǻ��� ���� �˻�(null���� ����)

-- ���� ������ �����Ǹ� �Ǽ��� �˻�
select count(*) from orders;

-- group by �˻�
-- sql������ group by���� ����ϸ� ���� �Ӽ������� �׷�ȭ�� �� �ִ�.

-- ������ �ֹ��� ������ �Ѽ����� ���Ǹž��� �˻�
select *from orders order by custid;

select custid,count(*) as ��������,sum(saleprice) as �Ѿ�
from orders
group by custid;

-- having���� group by���� ������� ��Ÿ���� �׷��� �����ϴ� ����

-- ������ 8000�� �̻��� ������ ������ ���� ���Ͽ�
-- ���� �ֹ� ������ �Ѽ����� �˻�
-- ��, 2���̻� ������ ���� �˻�
select custid, count(*) as ��������
from orders
where saleprice>=8000
group by custid
having count(*)>=2;

-- group by�� havin�� ���� ���� ����
-- group by�� ������ �׷����� ���� �� select������ group by���� 
-- ����� �Ӽ��� �����Լ��� ���� �� �ִ�.
select sum(saleprice),custid -- �´� ��
from orders
group by custid;

select sum(saleprice),bookid -- Ʋ�� ��
from orders
group by custid;

-- where���� having���� ���� ���Ե� sql���� �˻������� ��ȣ���� �� �ִ�.
-- having�� ���� ����
-- having���� �ݵ�� group by���� ���� ����ؾ� �Ѵ�.
-- where������ �ڿ� �ۼ��ؾ� �Ѵ�.
-- �˻����ǿ��� �����Լ�(sum,avg,count,min,max)�� �ۼ��ؾ� �Ѵ�.

-- group by ���� ���ѵ� sql���� ���� ����
select custid,count(*) as �������� ---- 5
from orders --------------------------- 1
where saleprice>=8000 ----------------- 2
group by custid ----------------------- 3
having count(*)>1 --------------------- 4
order by custid; ---------------------- 6

select bookid,bookname
from book
where bookid=1;

select bookname,price
from book 
where price>=20000;

select custid,sum(saleprice) as �ѱ��ž�
from orders
where custid=1
group by custid;

select custid,count(*) as ��������
from orders
group by custid
having custid=1;

select custid,count(publisher) as ���ǻ��
from book join orders
on book.bookid=orders.bookid
group by custid
having custid=1;

select bookname as å�̸�,
price as ����,
price-saleprice as ��������
from book join orders
on book.bookid=orders.bookid
where custid=1;

select *from orders;
select count(*)
from book;

select count(distinct publisher)
from book;

select name, address
from customer;

select orderid
from orders
where orderdate between'2020/07/04'and'2020/07/07';

select orderid
from orders
where orderdate<'2020/07/04' or orderdate>'2020/07/07';

select name,address
from customer
where name like '��%';

select name,address
from customer
where name like '��%��';






















