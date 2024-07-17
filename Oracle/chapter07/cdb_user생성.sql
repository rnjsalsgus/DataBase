-- system 계정으로 접속 및 실행
-- cdb 사용자 생성
-- cdb 사용자 생성을 위해 c##을 붙인다.
create user c##university identified by university;
grant connect, resource, dba to c##university;

-- 변경사항 저장
commit;