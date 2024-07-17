-- chapter04-02

-- �μ� ����
-- �Ϲ������� �����Ͱ� �뷮�� ��� �����͸� ��� ���ļ� �����ϴ� ���κ���
-- �ʿ��� �����͸� ã�Ƽ� ������ �ִ� �μ������� ������ �� ����.

-- ���缭�� ������ �ֹ��� ���� �̸��� �˻�
-- �� �̸��� �ֹ� ������ ������ orders���̺�� customer���̺��� ����

-- join�� ����� ���
-- customer���̺�� orders���̺��� ������ �� �ʿ��� �����͸� ����

-- �μ����� ����� ���
-- customer���̺��� ������ ���� ����ȣ�� ã�� ã�� ����ȣ�� ��������
-- orders���̺��� Ȯ��

-- �μ����Ǵ� sql�� �ȿ� �ٸ� sql���� ��ø�� ����
-- �� ����(main query, �ܺ�����)�� �μ�����(sub query, ��������)�� ����
-- select �μ����� from �μ����� where �μ�����
-- ��ø ���� / where�� / nested sub query, predicate query
-- where���� ����� ���� ���Ǹ� ����� ������Ű�� ���� ���
-- ��Į�� �μ����� / select�� / scalar subquery
-- select ������ ���Ǹ� ���� ���� ��ȯ�ϱ� ������ ��Į�� �μ����Ƕ� �Ѵ�.

-- ��ø���� - where �μ�����
-- ��ø���� �������� ����
-- �񱳿����� / = < > <= >= 
-- ���� / in, not in
-- ���� / all, some(any)
-- ���� / exists, not exists

-- �� ������
-- �μ� ���� ����� �ݵ�� ���� ��, ���� ���� ��ȯ�ؾ� �Ѵ�.
-- ó�� ������ �� ������ ��� �� �Ӽ��� ���� �μ� ������ ��� ����
-- �� �����ڿ� �ۿ��Ͽ� ���̸� �� ������ �ش� ���� ���

-- ��� �ֹ� �ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� �˻�

select orderid,saleprice
from orders
where saleprice<=(select avg(saleprice) from orders);

-- �� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ������� ���ؼ�
-- �ֹ���ȣ, ����ȣ, �ݾ��� �˻�
select orderid,custid,saleprice
from orders
where saleprice>=(select avg(saleprice)from orders);

-- in, not in
-- in�� �� ������ �Ӽ����� �μ����ǿ��� ������ ��� ���տ� �ִ��� Ȯ��
-- in �����ڿ��� ��밡���� �μ����Ǵ� ����� ���� ��, ���� ���� ��ȯ�� �� �ִ�.
-- where���� ���Ǵ� �μ������� ��� ���հ� ���� �ϳ��� ������ ��,
-- not in �����ڴ� ���� �������� ������ ���� �ȴ�.

-- ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� �˻�
select sum(saleprice) from orders 
where custid in (
select custid from customer where address like '���ѹα�%');

-- all, some(any)
-- all, some(any) �����ڴ� �񱳿����ڿ� �Բ� ���
-- all�� ���, some�� ���(�ּ��� �ϳ���)�� �ǹ�
-- any�� some�� ������ ���
-- ���� ����
-- ���̸� (�񱳿�����)([all | some | any](�μ�����)

-- 3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ�
select orderid,saleprice from orders
where saleprice>all(select saleprice from orders where custid=3);

-- exists, not exists
-- ���� ������, �������� ���� ���θ� Ȯ��
-- �� ���ǿ��� �μ������� ������ �Ӽ��� ���� ������ �μ������� ������ 
-- �����Ͽ� ���� �����ϸ� ���� �ǰ� �� ���Ǵ� �ش� ���� �����͸� ���
-- not exists�� �ݴ�� ����
-- ���� ����
-- where [not] exists (�μ�����)
-- exists �����ڴ� ���ʿ� ���� ������� �ʴ´�.
-- �ݵ�� �μ����ǿ� �������� ���̸��� �����Ǿ�� �Ѵ�.

-- exists �����ڸ� ����Ͽ� '���ѹα�'�� �����ϴ� ������
-- �Ǹ��� ������ ���Ǹž��� �˻�\
select sum(saleprice) from orders o
where exists (select * from customer c where address like '���ѹα�%'
and c.custid=o.custid);

-- ��Į�� �μ����� - select �μ�����
-- ��Į�� �μ����Ǵ� select������ ���Ǵ� �μ����Ƿ� �μ������� �������
-- ���� ��, ���� ���� ������ ��ȯ
-- ��Į�� = �ϳ��� ���ڷθ� ǥ�õǴ� ��

-- ���缭���� ���� �Ǹž��� �˻�(���̸��� ���� �Ǹž� ���)


select (select name from customer c where c.custid=o.custid),sum(saleprice) from orders o group by custid;

-- ��Į�� �μ����Ǵ� select���� �Բ� update�������� ����� �� �ִ�.
-- orders ���̺� ���ο� �Ӽ��� �����̸��� �߰�
alter table orders add bookname varchar2(40);
select *from orders;

-- ��� ������ ���Ͽ� �����̸��� ����
update orders set bookname="�ǰ� ����" where bookid=1;
-- �̷��� ������ ��� ������ ���Ͽ� ������ ó���ؾ� �ϹǷ� ��ȿ����

-- ��Į�� �μ����Ǹ� ����ϸ� �����̸��� �ϰ� ������ �� �ִ�.
-- orders ���̺� �� �ֹ��� �´� �����̸��� �Է�
update orders set bookname=(select bookname from book where book.bookid=orders.bookid);
select *from orders;

-- �ζ��� �� - from���� �μ����� ���
-- ��� ���� ���̺�κ��� �Ͻ������� ������� ������ ���̺��� ���Ѵ�.

-- �� ��ȣ�� 2������ ���� �Ǹž��� �˻�(�� �̸��� �Ǹž� ���)
select c.name,sum(o.saleprice)
from (select custid, name
      from customer where custid<=2) c, orders o
where c.custid=o.custid
group by c.name;

-- customer ���̺��� �ʿ��� �����͸� �̾� ���ν�ų �� �����Ƿ� 
-- ó�� ������ ���� �� �ִ�.

























