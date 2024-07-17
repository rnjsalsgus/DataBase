-- Quiz

-- �������� �� ���ž�

select sum(saleprice)
from orders
where custid=1;

-- �������� ������ ������ ��

select count(*)
from orders
where custid=1;

-- �������� ������ ������ ���ǻ� ��

select count(publisher)
from book,orders
where book.bookid=orders.bookid and custid=1;

-- �������� ������ ������ �̸�, ����, ������ �ǸŰ��� ����

select bookname as �����̸�,
saleprice as ����,
price-saleprice as "������ �ǸŰ��� ����"
from book,orders 
where book.bookid=orders.bookid and custid=1;

-- �������� �������� ���� ���� �̸�
select bookname
from book
where bookid not in (select bookid from orders where custid=1);

-- ���� �̸��� ���� ���ž�

select name, sum(saleprice)
from customer,orders
where customer.custid=orders.custid
group by name;

-- ���� �̸��� ���� ������ �������
select name, bookname
from customer,book,orders
where orders.bookid=book.bookid and customer.custid=orders.custid
order by name;

-- ������ ���ݰ� �ǸŰ����� ���̰� ���� ���� ���� �ֹ�

select *
from orders,book
where orders.bookid=book.bookid 
and price-saleprice=(select max(price-saleprice) from book,orders where book.bookid=orders.bookid);
--group by orderid;

-- ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�

select name,avg(saleprice)
from orders,customer
where orders.custid=customer.custid
group by name
having avg(saleprice)>(select avg(saleprice)
                       from orders);
                       

-- �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�

select name
from customer
where custid in (select custid from orders where bookid in
(select bookid from book where publisher in (select publisher
from book,orders
where book.bookid=orders.bookid and custid=1))) and customer.name not like '������';


-- ���� �������� �ù踦 ������ ���� �ù迡 �ʿ��� ������ �ʿ��ϴ� �ù迡 �ʿ��� ������ �����Ͻÿ�

select name,address,phone,bookname
from customer,book,orders
where customer.custid=orders.custid
and book.bookid=orders.bookid
order by name;
  
select *
from customer, orders
where customer.custid=orders.custid
and saleprice>=10000;


select *
from customer, orders
where customer.custid=orders.custid
and saleprice<10000;






