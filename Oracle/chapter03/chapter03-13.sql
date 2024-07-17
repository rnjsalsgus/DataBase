-- chapter03-13

-- ������ ���۾� ����,����,����
-- ���α׷��� �⺻��� CRUD(create,read,update,delete)
-- ������� ���̺��� ����(��)�� ����, ����, ����

-- insert�� (����)
-- ���̺� ���ο� ������ �����ϴ� ���

-- insert���� ����
-- insert into ���̺��([�Ӽ�����Ʈ])
-- values(������Ʈ);

-- book���̺� ���ο� ���� '������ ����' ����
-- '������ ����'�� �Ѽ����м������� �Ⱓ, ������ 90000��

select * from book;

insert into book(bookid,bookname,publisher,price)
values(11,'������ ����','�Ѽ����м���',90000);

-- ���ο� ������ ������ �� �Ӽ��� �̸��� ������ �� �ִ�.
-- �� �� �������� �Է� ������ �Ӽ��� ������ ��ġ�ؾ� �Ѵ�.

insert into book
values(12,'������ ����','�Ѽ����м���',90000);

-- �Ӽ��� �̸��� ������ �ٲٰ� �Ǹ� �������� ������ �ٲٸ� �ȴ�.
insert into book(bookid,bookname,price,publisher)
values(13,'������ ����',90000,'�Ѽ����м���');

-- �� ���� �Ӽ��� �Է��ؾ� �Ѵٸ� �ش�Ǵ� �Ӽ��� ����ϸ� �ȴ�.
-- book ���̺� ���ο� ���� '������ ����'�� ����
-- '������ ����'�� '�Ѽ����м���'���� �Ⱓ, ������ ����
insert into book(bookid,bookname,publisher)
values(14,'������ ����','�Ѽ����м���');

-- insert���� select���� ����Ͽ� �ۼ� ����
-- �Ѳ����� �������� ������ �����ϴ� ���

-- ���Ե��� ���(imported_book)�� ���̺� ��� ����
select * from imported_book;

insert into book(bookid,bookname,publisher,price)
    select bookid,bookname,publisher,price
    from imported_book;

-- �����ͺ��̽� �̸� ��Ģ
-- ���ο� �ܾ ���յ� �� ����ٸ� ���� ���� �Ϲ���
-- ex) imported_book
-- �����ͺ��̽� ���� ���̺귯������ importedBookī��ǥ������� ���ִ� �̸���
-- ����ٷ� �ڵ���ȯ ����� ��κ� �ִ�.


-- update��
-- Ư�� �Ӽ��� ���� �����ϴ� ���

-- update���� ����
-- update ���̺��
-- set �Ӽ��̸�1 = ��1 ,[�Ӽ��̸�2 = ��2]....
-- [where <�˻�����>]

-- customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� ����
update customer
set address='���ѹα� �λ�'
where custid=5;

select * from customer;

-- update���� �ٸ� ���̺��� �Ӽ����� �̿��Ͽ� ���� ����

-- customer ���̺��� '�ڼ���' ���� �ּҸ� '�迬��' ���� �ּҷ� ����
update customer
set address=(select address from customer where name like '�迬��')
where name like '�ڼ���';

-- update�� �ۼ� �� ���ǻ���
update customer1
set address='���ѹα� ����';
-- ��� ���� �ּҰ� '���ѹα� ����'�� ����
-- update���� �Ϲ������� Ư�� ���� �����ϱ� ������ where���� ������ �����ؾ��Ѵ�.


-- delete��
-- ���̺� �ִ� ���� ������ �����ϴ� ���

-- delete���� ����
-- delete from ���̺��
-- [where <�˻�����>]
-- delete���� �˻� ���ǿ� �ش��ϴ� ������ ����
-- �˻� ������ ������ ��� ������ ����(���ǻ���)
-- delete�� ���� where���� ������ �����ؾ� �Ѵ�.

-- customer ���̺��� ����ȣ�� 5�� ���� ����
delete from customer
where custid=5;

select * from customer;

-- ��� ���� ����
delete from customer;
-- ������ �߻�
-- orders ���̺��� custname,custid�Ӽ��� �ܷ�Ű�� ����
-- ������ �����ǰų� orders ���̺��� �������� ������ ������ �����ȴ�.








