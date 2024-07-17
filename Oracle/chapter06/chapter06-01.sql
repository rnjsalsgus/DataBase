-- chapter06-01

-- summer ���̺� �����ϰ� ������ ����

create table summer(
    sid number,
    class varchar2(20),
    price number
);

insert into summer values(100,'fortran',20000);
insert into summer values(150,'pascal',15000);
insert into summer values(200,'c',10000);
insert into summer values(250,'fortran',20000);

select *from summer;

-- select���� �̿��� ��ȸ �۾�
-- �л��� �й� sid, �����ϴ� ������ class, ���� ������ ������� price
-- �����б⸦ ��� �л��� �й��� ��������
select sid,class from summer;

-- �����ᰡ ���� ��� ����
select distinct class from summer
where price=(select max(price) from summer);

-- ���� �̻�
-- 200�� �л��� �����б� ������û�� ���
delete summer where sid=200;

select *from summer;

-- c ���� �����Ḧ ��ȸ
select price as "c ������" from summer where class like 'c';

-- 200�� �л��� ������û�� ����Ͽ� ���� ������ ����
-- 200�� �л��� ������û�� �� ��Ұ� �Ǿ�����
-- c������ �����Ḧ ��ȸ�� �� ���� �Ǿ���.
-- �л��� ������û�� ����ϸ鼭 �����ᵵ �Բ� ����
-- ���� �̻� �߻�


insert into summer values(200,'c',10000);

-- ���� �̻�
-- �����б⿡ ���ο� �ڹ� ���¸� ����
-- �ڹٰ��� ����

insert into summer values(null,'java',25000);

-- ��ü ������ ��ȸ
select *from summer;

-- ������ �л��� �Ѽ��� ��ȸ
select count(*) from summer;
-- ������ �л��� �� ���� 4�������� 5��� ����� ��ȸ

-- ���̺� �����Ͱ� ���� �� ��ü �����͸� ���� �ľ��Ͽ�
-- sql���� ������ �ϴ� ������ �ִ�.
select count(sid) from summer;
-- ���� �̻�
-- �ڹ� ���� ���� ����, ������25000��, ��û�л��� ���� ����
-- �ڹ� ���¸� �߰��ϱ� ���� insert���� ����ϴµ� 
-- ��û�� �л��� ���� �й����� null ���� �Է�
-- null ���� ���� �Լ� ��� �� ������ �ʴ� ����� ����

-- fortran ������ �����Ḧ 20000������ 15000������ ����
update summer set price=15000 where class like 'fortran' and sid=100;

-- fortran ������ ��ȸ
select price from summer where class like 'fortran';
-- 2���� ��ȸ�Ǿ� ������ ����ġ ���� �߻�

-- �����̻�
-- fortran ������ �����䰡 20000������ 15000������ ����Ǿ� update������ ����
-- update���� ���ǿ� �´� ���� �ϰ� ����������, 
-- ������ �߸� ����ϸ� ������ ����ġ ������ �߻�

-- ������ �����б� ���� ���̺�
-- ���̺� ������ �����Ͽ� �̻������� �߻����� �ʵ��� �����
-- summer ���̺��� summer_price�� summer_enroll ���̺�� �и�
-- summer_price ���̺��� ���� ���� ������ ������ ����
-- summer_enroll ���̺��� �л����� ������û ������ ����

create table summer_price(
    class varchar2(20),
    price integer
);

insert into summer_price values('fortran',20000);
insert into summer_price values('pascal',15000);
insert into summer_price values('c',10000);

-- summer_enroll ���̺� ����
create table summer_enroll(
    sid integer,
    class varchar(20)
);

insert into summer_enroll values(100,'fortran');
insert into summer_enroll values(150,'pascal');
insert into summer_enroll values(200,'c');
insert into summer_enroll values(250,'fortran');

-- 200�� �л��� �����б� ���� ��û�� ���
-- c ���� ������ ��ȸ
select price from summer_price where class='c';
-- �������
delete from summer_enroll where sid=200;
select *from summer_enroll;
-- c ���� ������ ��ȸ
select price from summer_price where class='c';
-- ���� �̻� ����
-- 200�� �л��� ������û ��ҵ� �� ó���Ǿ���,
-- ������� ������ ��Ÿ���� ����
-- c������ ������� ��ȸ ����\

-- ���� �б��� ���ο� �ڹ� ���� ����
insert into summer_price values('java',25000);
select *from summer_price;
-- ���� �̻� ����
-- ���� ��û�� �л��� ������, null���� �Է��� �ʿ䰡 ���� �����̻� �߻� ����

-- fortran������ �����Ḧ 20000������ 15000������ ����
update summer_price set price=15000 where class like 'fortran';
select *from summer_price;
select price from summer_price where class like 'fortran';
-- ���� �̻� ����
-- fortran������ ������� �ϳ��� ����Ǿ� �����Ƿ� ���� �� ��������
-- ����ġ�� ����� �ʿ䰡 ����

-- ���̺��� �и��� ���� �̻������� �ذ��� �� ����

















