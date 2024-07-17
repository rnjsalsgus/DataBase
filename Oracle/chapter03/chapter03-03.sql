-- chapter03-03

-- select�� ����
-- �⺻ �˻�
-- ��� ������ �̸��� ������ �˻�
select bookname,price from book;
-- ��ҹ��ڸ� �������� �ʴ´�.
-- SQL������ �빮�ڷ�, ���̺��̳� �Ӽ��̸��� �ҹ��ڷ� �ۼ������� ���� ������ ��Ģ�� �ƴ�

-- ��� ������ ������ȣ, �����̸�, ���ǻ�, ������ �˻�
select bookid,bookname,publisher,price from book;

-- book���̺� ��� ���� ��ȸ�� ��  select���� �� ���� �̸��� ���� �ȴ�.
-- �Ǵ� '*'(asterisk)�� ���� ��� ���� ��ȸ�Ѵ�.
select *from book;
-- ���� ������ ���ų� ���� �̸��� �� �� ���ϰ� ����� �� �ִ�.

-- ���� ���̺��� ��� ���ǻ縦 �˻�
select publisher from book;
-- sql���� �⺻������ �ߺ��� �������� �ʴ´�.
-- ���� ����� ���� ���� �� �� �̻� ���� �� �ִ�.
-- �ߺ��� �����ϰ� ���� ���� distinct Ű���带 ���
select distinct publisher from book;

-- ���� �˻�
-- ���ǿ� �´� �˻��� �� ���� where���� ���
-- �� =, > , < , <= , >=  / price<20000
-- ���� between / price between 10000 and 20000
-- ���� in, not in / price in(10000,20000,30000)
-- ���� like / bookname like '�౸�� ����'
-- null is null, is not null / price is null
-- �������� and,or,nor / (price<20000) and (bookname like '�౸�� ����')

-- ��
-- ������ 20000�� �̸��� ������ �˻�
select * from book where price<20000;

-- ����
-- ������ 10000�� �̻� 20000�� ������ ���� �˻�
-- between ���
select * from book where price between 10000 and 20000;

-- and �� �����ڸ� ���
select *from book where price>=10000 and price<=20000;

-- ����
-- �� �� �̻��� ���� �˻��Ϸ��� in �����ڿ� not in �����ڸ� ���
-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ���� �˻�
select *from book where publisher in('�½�����','���ѹ̵��');

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ���� �˻�
select *from book where publisher not in('�½�����','���ѹ̵��');

-- ����
-- ���ڿ��� ������ ���� �� like ���
-- ã�� �Ӽ��� �ؽ�Ʈ�� ��¥ �����͸� �����ϸ� �� ������ �ݵ�� ���� ��������ǥ('')���
-- �ѱ��� ���� ����ǥ�� ����ϸ� ������ �߻��� �� �ִ�.

-- ��Ī
-- select������ �Ӽ� ������ as Ű���� ���

-- ��� �������� å�̸��� �˻�
select bookname from book;
select bookname as å�̸� from book;

-- ��Ī �̸��� ������ ���Ե� ���� ""(ū ����ǥ)�� ���
select bookname as "å �̸�" from book;

-- '�౸�� ����'�� �Ⱓ�� ���ǻ縦 �˻�
select bookname,publisher from book where bookname like '�౸�� ����';

-- %(���ϵ幮��) - �ƹ� ���ڿ��� ����ϴ� Ű����
-- ���� �̸��� '�౸'�� ���Ե� ������ �˻�
select bookname,publisher from book where bookname like '%�౸%';

-- _(����) - Ư�� ��ġ�� �� ���ڸ� ����� �� ���
-- ���� �̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ���� �˻�
select * from book where bookname like '_��%';

-- ���ڿ� �˻� �� like�� ���� ����ϴ� ���ϵ� ����
-- + / ���ڿ��� ���� / '����'+'���̺�' : '���� ���̺�'
-- % / 0�� �̻��� ���ڿ��� ��ġ / '%�౸%' : �౸�� �����ϴ� ���ڿ�
-- [] / �� ���� ���ڿ� ��ġ / '[0-5]%' : 0~5���� ���ڷ� �����ϴ� ���ڿ�
-- [^] / �� ���� ���ڿ� ����ġ / /'[^0-5]%' : 0~5���� ���ڷ� �������� �ʴ� ���ڿ�
-- _ / Ư�� ��ġ�� �� ���� ���ڿ� ��ġ / '_��%' : �� ��° ��ġ�� '��'�� ���� ���ڿ�

-- �������� �˻�
-- �౸�� ���� ���� �� ������ 20000�� �̻��� ���� �˻�
select *from book where bookname like '%�౸%' and price>=20000;

-- ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� ������ �˻�
select *from book where publisher='�½�����' or publisher='���ѹ̵��';
select *from book where publisher in ('�½�����','���ѹ̵��');

-- �˻� ����� ����
-- sql���� ���� ��� ���� ������ ����� ��ġ�� ���� ����
-- sql���� ���� ����� Ư�� ������� ����� �� order by���� ���

-- ������ �̸������� �˻�
select *from book order by bookname;
-- ������ ��� ���ļ����� ����, ����, �ѱ� ������ ����

-- ������ ���� ������ �˻��ϰ� ������ ������ �̸� ������ �˻�
select *from book order by price,bookname;
-- order by������ ������ ���ϴ� �� �̸��� ������� ����

-- ������ �⺻�� ��������,
-- ������������ �����Ͽ��� �� �̸� ������ desc Ű���� ���

-- ������ ������ ������������ ����
-- ������ ���ٸ� ���ǻ��� ������������ �����Ͽ� �˻�
select *from book order by price desc,publisher asc;

-- ���������� ��Ÿ���� ascŰ����� default�� ���������̱� ������ ������ ����
select *from book order by price asc;
select *from book order by price;




















