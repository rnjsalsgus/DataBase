-- chapter03-05

-- �� �� �̻��� ���̺��� sql����
-- �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
-- sql�� ���� ���� ���̺��� �̿��Ͽ� �����ϴ� �� ���� ����� ����
-- 1. ����(join)
-- 2. �μ�����(subquery)

-- Join
-- �� ���� ���̺��� �����Ѵ�.
-- ������ �� ���̺��� ���� �ٸ� ���̺��� �࿡ �����Ͽ�
-- �� �� �̻��� ���̺��� �����ϴ� ����

-- customer ���̺��� order ���̺�� ���� ���� ����
select *
from customer, orders
group by custid;
-- ���� 5�� X �ֹ��� 10���̹Ƿ� �� 50���� ��

select *from customer;
select *from orders;

-- Ex) ������ custid�� 1�̹Ƿ� orders���̺��� custid�� 1�� �Ͱ� ����

-- ���� ���� �ֹ��� ���� �����͸� ��� �˻�
select *
from customer,orders
where customer.custid=orders.custid;

-- order by���� �̿��Ͽ� ����
-- ���� ���� �ֹ��� ���� �����͸� ������ �����Ͽ� �˻�
select *
from customer,orders
where customer.custid=orders.custid
order by customer.custid;

-- ������ ����ϸ� �� �� �̻��� ���̺��� �Ϻ� ���̴��� ���� �� �ִ�. 
-- ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
select name, saleprice
from customer,orders
where customer.custid=orders.custid;

-- ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͽ� �˻�
select name, sum(saleprice)
from customer,orders
where customer.custid=orders.custid
group by customer.name
order by customer.name;

-- 3�� �̻��� ���̺��� join �� �� �ִ�.
select *from orders;

-- ���缭���� �ֹ��� ������ �� ������ å �������� ��� �˻�
select *
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid;

-- ���� �̸��� ���� �ֹ��� ������ �̸��� �˻�
select customer.name, book.bookname
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid;

-- ������ 20000���� ������ �ֹ��� ���� �̸��� ������ �̸��� �˻�
select customer.name, book.bookname
from customer,orders,book
where customer.custid=orders.custid and orders.bookid=book.bookid and book.price=20000;

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ��� �˻�
-- ���� ����, �ܺ� ���� 
select customer.name,saleprice
from customer left outer join orders
on customer.custid=orders.custid;

-- join ����
-- ��������

-- select �Ӽ���
-- from ���̺�,���̺�
-- where �������� and �˻�����

-- select �Ӽ���
-- from ���̺�1 inner join ���̺�1 on ��������
-- where �˻�����;

-- �ܺ� ����

-- select �Ӽ���
-- from ���̺�1 {left | right | full[outer]} join ���̺�2 on ��������
-- where �˻�����

-- ����Ŭ +��ȣ�� �ܺ������� ������ �� �ִ�.
-- ���� �ܺ������� ��� (+) ��ȣ�� ���������� �����ʿ� 
-- ������ �ܺ������� ���(+)�� ���ʿ� ���δ�.

-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻�
select customer.name,saleprice
from customer,orders
where customer.custid=orders.custid(+);