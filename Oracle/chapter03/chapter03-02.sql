-- ������ ���۾� - �˻�
-- select�� ����
-- sql�� select���� �����͸� �˻��ϴ� �⺻ ����
-- Ư���� ���Ǿ�(query)��� �θ���.
-- select���� �˻� ����� ���̺� ���·� ���
-- ex) 10000�� �̻��� ������ �̸��� ���ǻ縦 ���̽ÿ�
select bookname,publisher from book where price>=10000;

select bookname,publisher 
from book 
where price>=10000;

-- select���� �⺻����
-- select [all | distinct] �Ӽ��̸� 
-- from ���̺��
-- [where �˻�����];
-- [group by �Ӽ��̸�];
-- [having �˻�����];
-- [order by �Ӽ��̸� [desc]];
-- [] - �������� sql�������� ���������� ����� �� �ִ�.
-- | - ���� ������ ������ �� �� ���� ����� �� �ִ�. 