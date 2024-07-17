-- chapter04-01

-- sql ���
-- �����Լ�
-- sql ���� �Լ�
-- sql �����Լ��� ������ ���� select ���� where��, update�� ���
-- ��� ��� ����

-- select �Լ���(����,����)
-- from ���̺��
-- where ���̸�=�Լ���(����,����...)

-- update ���̺��
-- set ���̸�=�Լ���(����,����)

-- ����Ŭ���� �����ϴ� ���� �Լ�
-- ���� �Լ�
-- sql�������� ������ �⺻���� ��Ģ���� ����(+,-,*,/,%)
-- ���� ������ �� ��� �󵵰� ���� ���� ���� �Լ� ���·� ����

-- abs - ������ ���밪�� ��Ÿ��
-- 78�� -78�� ���밪
select abs(78),abs(-78)
from dual;
-- dual ���̺��� �����ϴ� ���̺��� �ƴ϶� ����Ŭ���� �Ͻ�����
-- ���� �۾��� ����ϱ� ���� ���� �������̺�

-- round(����,m) - m�ڸ��� �������� ���� �ݿø�
-- 4.875�� ���� ù°¥������ ���
select round(4.875,1)
from dual;

-- ���� �Լ��� ����
-- ������ ���� ��� ���̸��� ����� �� �ְ� �����Լ��� ����������
-- ����� �� �ִ�.
-- ���� ��� �ֹ� �ݾ��� ��������� �ݿø��� ���� ���Ͻÿ�

select custid,round(avg(saleprice),-2) as "��ձݾ�"
from orders
group by custid;

-- �����Լ�
-- ���� ������ Ÿ���� ������ ����� ��ȯ
-- replace �Լ�
-- replace(s1,s2,s3) 
-- ��� ���ڿ� - s1, s1�� ������ ���ڿ� - s2, ���ϴ� ���ڿ� - s3

-- ���� ���� �߱��� ���Ե� ������ '��'�� ������ �� ���� ����� �˻�
select bookid, replace(bookname,'�߱�','��'),publisher,price
from book;

-- length�Լ�
-- length(s) - ��� ���ڿ�s�� ���� ���� ��ȯ
-- lengthb - ����Ʈ ������ ��ȯ
-- �½��������� �Ⱓ�� ������ ����� ������ ���� ��, ����Ʈ ���� �˻�
select bookname, length(bookname),lengthb(bookname)
from book where publisher like '�½�����';

-- substr(�����ڸ�,���ڸ�)- ��� ���ڿ��� ������ �ڸ��������� ������ ���̸�ŭ �߶� ��ȯ
-- ���� ������ �� �߿��� ���� ���� ���� �ο��� �� �˻�
select substr(name,1,1),count(*)
from customer
group by substr(name,1,1);

insert into customer values(5,'�ڼ���','���ѹα� ����',null);

-- ��¥ �ð� �Լ�
-- ��¥ �ð� �Լ��� ����
-- to_date(char,datetime)
-- datetime - ��¥�� �ð��� ��Ÿ���� �μ�
-- char - ���ڳ� ���ڿ�
-- ������(char) �����͸� date������ ��ȯ

-- to_char(date,datetime)
-- date�� �����͸� ���ڿ��� ��ȯ

-- ���� ������ �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� �˻�
select orderid, orderdate+10
from orders;

-- ��¥�� �����ʹ� -��+�� ����Ͽ� ���ϴ� ��¥�κ��� ������ ���ĸ� ����� �� �ִ�
-- sysdate�Լ��� �����ͺ��̽��� ������ ���� ��¥�� �ð��� ��ȯ
-- systimestamp �Լ��� ���� ��¥, �ð��� �Բ� �� ������ �ð��� ������ timezone���� ���

-- DBMS ������ ������ ���� ��¥�� �ð�, ������ Ȯ��
select sysdate,to_char(sysdate,'yyyy/mm/dd/ dy hh24:mi:ss')
from dual;

select * from orders;
insert into orders values(11,1,1,6000,sysdate);

-- null �� ó��
-- null ���� ���� ����� �����Լ�

-- ���� �Լ��� ����� �� null ���� ���Ե� �࿡ ���� ���ǻ���
-- 1. null+���ڿ����� ����� null
-- 2. �����Լ��� ����� �� null�� ���Ե� ���� ���迡�� ����
-- 3. �����Լ��� ����Ǵ� ���� �ϳ��� ������ sum,avg�Լ� null�� �ǰ�
-- count�Լ��� ����� 0

create table mybook(
    bookid number primary key,
    price number
);

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook values(3,null);

select * from mybook;

-- 1. null+���ڿ����� ����� null
select price+100 from mybook where bookid=3;

-- 2. �����Լ��� ����� �� null�� ���Ե� ���� ���迡�� ����
select count(*),count(price),sum(price),avg(price)
from mybook;

-- 3. �����Լ��� ����Ǵ� ���� �ϳ��� ������ sum,avg�Լ� null�� �ǰ�
-- count�Լ��� ����� 0
select sum(price),avg(price),count(*) 
from mybook where bookid>=4;

-- null���� Ȯ���ϴ� ��� - is null, is not null
-- mybook ���̺��� prioce�� null �� ã��
select * from mybook where price is null;

-- mybook ���̺��� price�� null�� �ƴ� �� ã��
select * from mybook where price is not null;

-- nvl �Լ�
-- null ���� �ٸ� ������ ��ü�Ͽ� �����ϰų� �ٸ� ������ ���
-- null���� ������ �ٸ� ������ ������ �� �ִ�. 
-- nvl(�Ӽ�, ��)
-- �ӽ��� null�̸� ������ ��ü�Ѵ�.

-- �̸�,��ȭ��ȣ�� ���Ե� ������� �˻�
-- ��, ��ȭ��ȣ�� ���� ���� '����ó����'���� ǥ��
select * from customer;
select name, nvl(phone,'����ó����') from customer;

-- rownum����
-- ����Ŭ ���������� �����Ǵ� ���� Į��, sql��ȸ ����� ������ ��Ÿ����.

-- ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� �˻�
select rownum, custid, name, phone from customer
where rownum<=2;

-- rownum ��� �� ���ǻ���
-- �����ټ����� ������ ����Ͽ��� ����ȣ, �̸�, ��ȭ��ȣ�� ���� �� �� �˻�
select rownum,custid,name,phone from customer where rownum<=2 order by name;
-- �˻��Ǵ� ������ �ߺ��� ���

-- select�� ó�� ���� 
-- 1. from customer - customer���̺��� �о����
-- 2. where rownum<=2 - ����Ŭ�� �����͸� ���� ������� �� ���� ���� ����
-- 3. select rownum,custid,name,phone - �Ӽ� ���� ����
-- 4. order by name - �̸������� ����

-- �μ����� ���
select rownum ����,custid,name,phone
from (select custid,name,phone
      from customer order by name)
where rownum<=2;














