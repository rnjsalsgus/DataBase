-- chapter07-01

-- commit���� rollback��

select *from customer;

-- �� ���̺��� 5�� ���� ����
delete from customer where custid=5;

-- �Ͻ������� �ݿ��� �����͸� ������Ű���� rollback��ɾ ���
rollback;

-- �ٽ� 5�� �� ����
delete from customer where custid=5;

-- commit ��ɾ�� �����ͺ��̽��� ���� �۾��� ����
commit;

-- �ٽ� rollback ����
rollback;
select *from customer;

-- commit�� ���� commit�������� �����ߴ� sql���� ������ �����ϴ� ��ɾ�
-- rollback�� ������ commit��� �������� �ǵ����� ��ɾ�

insert into customer values(5,'�ڼ���','���ѹα� ����',null);

