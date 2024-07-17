-- chapter03-11

-- alter문
-- alter문은 생성된 테이블의 속성과 속성에 관한 제액을 변경하며
-- 기본키 및 외래키를 변경한다.

-- alter문의 문법
-- alter table 테이블명
-- [add 속성이름 데이터타입]
-- [drop column 속성이름]
-- [alter column 속성이름 데이터타입]
-- [alter column 속성이름 [null | not null]
-- [add primary key(속성이름)]
-- [[add | drop] 제약이름]
-- modify는 속성을 변경할 때 사용

-- newbook테이블생성
drop table newbook;

create table newbook(
    bookid number,
    bookname varchar2(20),
    publisher varchar2(20),
    price number);
    
-- newbook테이블에 varchar2(13)의 자료형을 가진 isbn속성을 추가
alter table newbook add isbn varchar(13);

-- newbook테이블의 isbn속성의 데이터타입을 number형으로 변경
alter table newbook modify isbn number;

-- newbook테이블의 isbn속성을 삭제
alter table newbook drop column isbn;

-- newbook테이블의 bookname속성에 not null 제약조건 적용
alter table newbook modify bookname varchar(20) not null;

-- newbook테이블의 bookid속성을 기본키로 변경
alter table newbook add primary key(bookid);

-- drop문
-- 테이블을 삭제하는 명령어
-- drop문은 테이블의 구조와 데이터를 모두 삭제하므로 사용에 주의
-- 데이터만 삭제하려면 delete문을 사용한다.

-- drop문의 문법
-- drop table 테이블명

-- newbook테이블을 삭제
drop table newbook;

-- newcustomer테이블을 삭제
drop table newcustomer;

-- neworders테이블이 newcustomer를 참조하고 있는 상태
-- neworders테이블부터 삭제해야한다.
