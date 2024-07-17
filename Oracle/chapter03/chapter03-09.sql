-- chapter03-09

-- ���� ����
-- ���̺� -> ������ ���� ���̺� ���� ���� ������ �̿��Ͽ� ������, ������
-- �������� ���� �� �ִ�. 

-- sql���� ���� ����
-- ������ union
-- ������ minus
-- ������ intersect

-- ������ �ֹ����� ���� ���� �̸��� �˻�
select name
from customer
minus
select name
from customer
where custid in (select custid from orders);

-- exists
-- ��� �μ����ǹ� ����
-- ���ǿ� �´� ������ �����ϸ� ����� ����
-- not exists �μ����ǹ��� ��� ���� ���ǿ� �������� ���� ���� ��


-- �ֹ��� �ִ� ���� �̸��� �ּҸ� �˻�
select name,address
from customer c
where exists (
    select *
    from orders o
    where c.custid=o.custid);

