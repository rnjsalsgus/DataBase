-- pdb1_mdguest 계정으로 접속
-- book 테이블 조회

select *from book;

-- 실제 mdguest사용자가 book테이블을 가지고 있지 않기 때문에
-- select문이 오류 발생
-- 스키마.테이블이름 형식으로 사용
select *from madang.book;

-- customer 테이블 조회
select *from madang.customer;

-- with grant option을 부여받았기 때문에 mdguest는 customer테이블의
-- select, update 권한을 다른 사용자에게 부여할 수 있다.

-- mdguest계정으로 madang.book테이블과 madang.customer테이블의
-- select 권한을 mgguest2에 부여
grant select on madang.customer to mdguest2;

-- public은 모든 사용자에게 권한을 부여하는 명령
-- orders테이블을 모든 사용자가 select 할 수 있도록 권한을 부여
grant select on orders to public;

-- 권한 취소
-- grant문으로 허가한 권한을 취소, 회수하는 명령
-- 문법
/*
    revoke 권한[(칼럼[,...n])][,...n]
        [on 객체]from {사용자|롤|public[,...n]}
*/

-- mdguest에게 부여된 book테이블의 select 권한을 취소
revoke select on book from mdguest;

select *from book;

