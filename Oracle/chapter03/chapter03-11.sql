-- chapter03-11

-- alter��
-- alter���� ������ ���̺��� �Ӽ��� �Ӽ��� ���� ������ �����ϸ�
-- �⺻Ű �� �ܷ�Ű�� �����Ѵ�.

-- alter���� ����
-- alter table ���̺��
-- [add �Ӽ��̸� ������Ÿ��]
-- [drop column �Ӽ��̸�]
-- [alter column �Ӽ��̸� ������Ÿ��]
-- [alter column �Ӽ��̸� [null | not null]
-- [add primary key(�Ӽ��̸�)]
-- [[add | drop] �����̸�]
-- modify�� �Ӽ��� ������ �� ���

-- newbook���̺����
drop table newbook;

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
    
-- newbook���̺� varchar2(13)�� �ڷ����� ���� isbn�Ӽ��� �߰�
alter table newbook add isbn varchar(13);

-- newbook���̺��� isbn�Ӽ��� ������Ÿ���� number������ ����
alter table newbook modify isbn number;

-- newbook���̺��� isbn�Ӽ��� ����
alter table newbook drop column isbn;

-- newbook���̺��� bookname�Ӽ��� not null �������� ����
alter table newbook modify bookname varchar(20) not null;

-- newbook���̺��� bookid�Ӽ��� �⺻Ű�� ����
alter table newbook add primary key(bookid);

-- drop��
-- ���̺��� �����ϴ� ��ɾ�
-- drop���� ���̺��� ������ �����͸� ��� �����ϹǷ� ��뿡 ����
-- �����͸� �����Ϸ��� delete���� ����Ѵ�.

-- drop���� ����
-- drop table ���̺��

-- newbook���̺��� ����
drop table newbook;

-- newcustomer���̺��� ����
drop table newcustomer;

-- neworders���̺��� newcustomer�� �����ϰ� �ִ� ����
-- neworders���̺���� �����ؾ��Ѵ�.
