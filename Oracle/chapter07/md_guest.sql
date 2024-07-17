-- pdb1_mdguest �������� ����
-- book ���̺� ��ȸ

select *from book;

-- ���� mdguest����ڰ� book���̺��� ������ ���� �ʱ� ������
-- select���� ���� �߻�
-- ��Ű��.���̺��̸� �������� ���
select *from madang.book;

-- customer ���̺� ��ȸ
select *from madang.customer;

-- with grant option�� �ο��޾ұ� ������ mdguest�� customer���̺���
-- select, update ������ �ٸ� ����ڿ��� �ο��� �� �ִ�.

-- mdguest�������� madang.book���̺�� madang.customer���̺���
-- select ������ mgguest2�� �ο�
grant select on madang.customer to mdguest2;

-- public�� ��� ����ڿ��� ������ �ο��ϴ� ���
-- orders���̺��� ��� ����ڰ� select �� �� �ֵ��� ������ �ο�
grant select on orders to public;

-- ���� ���
-- grant������ �㰡�� ������ ���, ȸ���ϴ� ���
-- ����
/*
    revoke ����[(Į��[,...n])][,...n]
        [on ��ü]from {�����|��|public[,...n]}
*/

-- mdguest���� �ο��� book���̺��� select ������ ���
revoke select on book from mdguest;

select *from book;

