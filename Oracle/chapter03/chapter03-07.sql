-- chapter03-07

-- �μ� ����
-- sql�� ���� �� �ٸ� sql���� �ۼ�

-- Ex) ������ ���� ��� ������ �̸� �˻�

-- ���� ��� ���� ���ϱ�
select max(price)
from book;
-- ���� ��� �������� ������ �̸� ���ϱ�
select bookname
from book
where price=35000;

-- �μ� ���Ǹ� ����Ͽ� ���ļ� �ۼ�
-- ���� ��� ������ �̸��� �˻�
select bookname
from book
where price=(select max(price) from book);

-- ()�� ��� sql���� ��ø��Ű�� ���� �μ� ����(subquery)�� �Ѵ�.
-- �μ����Ǵ� ���ǰ� ��ø�Ǿ� �ִٴ� �ǹ̿��� ��ø����(nested query)��� �Ѵ�.

-- ���� ����
select bookname --------------------- 2
from book
where price=
(select max(price) from book); ------ 1
-- where���� �μ����Ǹ� ���� ó���ϰ� ��ü���Ǹ� ó��

-- �μ����Ǵ� sql��
-- sql���� ����� ���̺�
-- ���̺��� ����� �� ���� �� �ϳ�
-- 1. ������-���Ͽ�(1 x 1)
-- 2. ������-���Ͽ�(n x 1)
-- 3. ������-���߿�(1 x n)
-- 4. ������-���߿�(n x n)

-- �μ������� ����� ������-���Ͽ��� ���� ���� ���� ��ȯ�ϸ� 
-- in Ű���带 ���

-- Ex) ������ ������ ���� �ִ� ���� �̸��� �˻�
-- ������ ������ ���� �ִ� �� ��ȸ
select custid
from orders;

select name 
from customer
where custid in (1,2,3,4);

-- �μ� ���Ǹ� ����Ͽ� �˻�
select name
from customer
where custid in (select custid from orders);

-- �� �� �̻��� ��ø�� �μ�����
-- ���ѹ̵��� ������ ������ ������ ���� �̸��� �˻�
select name
from customer
where custid in (select custid
                 from orders
                 where bookid in(select bookid 
                                 from book 
                                 where publisher='���ѹ̵��'));
-- ���� ������ ���� �μ����Ǹ� ���� �����ϰ� �� ����� �̿��Ͽ�
-- ���� �μ� ���Ǹ� ����

-- ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ �˻�
select b1.bookname
from book b1
where b1.price>(select avg(b2.price) from book b2 where b1.publisher=b2.publisher);
-- ���̺��� ��Ī�� �ټ� �ִ�.




