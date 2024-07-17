-- chapter07-01

-- commit문과 rollback문

select *from customer;

-- 고객 테이블에서 5번 고객을 삭제
delete from customer where custid=5;

-- 일시적으로 반영된 데이터를 복원시키려면 rollback명령어를 사용
rollback;

-- 다시 5번 고객 삭제
delete from customer where custid=5;

-- commit 명령어로 데이터베이스에 삭제 작업을 적용
commit;

-- 다시 rollback 실행
rollback;
select *from customer;

-- commit은 이전 commit지점에서 적용했던 sql문을 완전히 적용하는 명령어
-- rollback은 이전의 commit명령 이전까지 되돌리는 명령어

insert into customer values(5,'박세리','대한민국 서울',null);

