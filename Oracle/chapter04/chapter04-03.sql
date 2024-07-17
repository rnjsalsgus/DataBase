-- chapter04-03

-- ��(View)
-- ���� �������� �ù����� �ϱ� ���� �ú��� �ʿ��� ������ ����
-- �Ź� ������ ������ �����̳� �μ����Ǹ� �ϴ� ���� ���ŷο�
-- �ù� ������ ����Ǿ� ������ ���Ŀ� �����ϰ� ������ ��ȸ�� �� �ִ�. 
-- ��� �ϳ� �̻��� ���̺��� ���Ͽ� ���� ������ ���̺�
-- select���� ���� ���� ���� ����� ������ ���̺�� �����Ͽ�
-- ���� ���̺�ó�� ����� �� �ֵ��� ���� �����ͺ��̽� ��ü

-- �� ����
-- �並 �����ϴ� ����
-- create view ���̸� [(���̸�[,...n])]
-- as sql��

-- book ���̺��� '�౸'��� ������ ���Ե� �ڷḸ �����ִ� �� ����
select *from book where bookname like '%�౸%';

-- select���� �̿��� �� ���ǹ� �ۼ�
create view vw_book
as select * from book where bookname like '%�౸%';
-- vw_book�̶�� �䰡 �����Ǹ� �Ϲ� ������ó�� ��밡��

-- ��� ���� �����Ͱ� ����Ǵ� ���� �ƴ϶� ���� ���ǰ� DBMS�� ����Ǵ� ��
-- book ���̺� '�౸'��� ������ ���ѵ� ������ ���� �߰��Ǹ�
-- �߰��� ������ ���� �信�� ��Ÿ����.
-- �߰��� �����̸��� '�౸'�� ���ԵǾ� ���� �ʴٸ� book���̺��� ����������
-- �信�� ��Ÿ���� �ʴ´�.

-- '�౸'��� ������ ���Ե� �ڷ� �˻�
-- �並 �̿�
select *from vw_book;

-- �ּҿ� '���ѹα�'�� �����ϴ� ����� ������ �並 ����� ��ȸ
-- ���� �̸��� vw_customer�� ����
create view vw_customer
as select * from customer where address like '%���ѹα�%';
select * from vw_customer;

-- orders���̺��� ���̸��� �����̸��� �ٷ� Ȯ���� �� �ִ� �並 ������ ��,
-- '�迬��'���� ������ ������ �ֹ���ȣ,�����̸�,�ֹ����� �˻�
select o.orderid,c.custid,b.bookid,b.bookname,o.saleprice,o.orderdate
from customer c, book b, orders o
where c.custid=o.custid and b.bookid=o.bookid;

create view vw_orders(orderid,custid,name,bookid,bookname,saleprice,orderdate)
as select o.orderid,c.custid,c.name,b.bookid,b.bookname,o.saleprice,o.orderdate
   from customer c, book b, orders o
   where c.custid=o.custid and b.bookid=o.bookid;

select orderid,bookname,saleprice from vw_orders
where name like '�迬��';

-- ���� ����
-- ����
-- create or replace veiw ���̸�[(���̸�[,...])]
-- as select��

-- vw_customer �ּҰ� '���ѹα�'�� ��
-- �ش� ���� '����'�� �ּҷ� ���� ������ ����
-- phone �Ӽ��� �ʿ�����Ƿ� �������� �ʴ´�.

create or replace view vw_customer(custid,name,address)
as select c.custid,c.name,c.address from customer c where address like '%����%';

-- ���� ����
-- drop view ���̸�[,....]

-- vw_customer�� ����
drop view vw_customer;


















