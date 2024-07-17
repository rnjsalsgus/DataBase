-- 대학교 데이터베이스

-- 학생정보, 학과, 교수정보, 강의정보, 수강신청 테이블

-- 학생정보(id,이름,주소,폰번호,학년,이메일,학과)
create table student(
    stu_id number primary key,
    stu_name varchar2(50) not null,
    stu_add varchar(150) not null,
    stu_phone varchar2(50) not null ,
    grade number not null,
    stu_email varchar(100) not null unique,
    major_id number
);

-- 학생 데이터 삽입
insert into student values(1,'권민현','부산','010-0000-0000',3,'kwon001@naver.com',1);
insert into student values(2,'이지훈','부산','010-0000-1111',1,'lee001@naver.com',4);
insert into student values(3,'김민혁','안양','010-1111-0000',2,'kim001@naver.com',2);
insert into student values(4,'강경훈','인제','010-2222-1111',2,'kang001@naver.com',3);
insert into student values(5,'김재섭','창원','010-0000-2222',4,'kim002@naver.com',5);
insert into student values(6,'이하준','부산','010-1000-0000',1,'lee002@naver.com',5);
insert into student values(7,'박지호','부산','010-0100-1111',1,'park001@naver.com',4);
insert into student values(8,'김지후','서울','010-1211-0000',3,'kim003@naver.com',3);
insert into student values(9,'박준우','대구','010-2232-1111',2,'park002@naver.com',3);
insert into student values(10,'김도현','안양','010-0010-2222',4,'kim004@naver.com',5);
insert into student values(11,'이준서','서울','010-0001-0000',3,'lee003@naver.com',2);
insert into student values(12,'김건우','서울','010-0001-1211',1,'kim005@naver.com',1);
insert into student values(13,'김현우','창원','010-1112-1000',3,'kim006@naver.com',2);
insert into student values(14,'박우진','대구','010-2221-1115',2,'park003@naver.com',1);
insert into student values(15,'최선우','인제','010-0005-2622',4,'choi001@naver.com',5);
insert into student values(16,'이유준','광주','010-0050-0200',3,'lee004@naver.com',1);
insert into student values(17,'이연우','일산','010-0100-1118',1,'lee005@naver.com',4);
insert into student values(18,'차은우','서울','010-1111-0070',2,'cha001@naver.com',2);
insert into student values(19,'김서진','부산','010-2232-1171',2,'kim007@naver.com',3);
insert into student values(20,'최시윤','포항','010-0004-2292',4,'choi002@naver.com',5);

select *from student;

-- 교수정보(id,이름,주소,폰번호,이메일,학과)
create table professor(
    pro_id number primary key,
    pro_name varchar2(50) not null,
    pro_add varchar2(150) not null,
    pro_phone varchar2(50) not null,
    pro_email varchar(100) not null unique,
    major_id number
);

-- 교수데이터 삽입
insert into professor values(1,'김민준','서울','010-1234-5678','kim001@gmail.com',1);
insert into professor values(2,'권서준','부산','010-2345-6789','kwon002@naver.com',1);
insert into professor values(3,'이도윤','부산','010-3456-7890','lee002@naver.com',2);
insert into professor values(4,'최예준','창원','010-4567-8901','choi001@gmail.com',3);
insert into professor values(5,'손시우','대구','010-5678-9012','son001@gmail.com',3);
insert into professor values(6,'차민재','서울','010-1564-5678','cha001@gmail.com',4);
insert into professor values(7,'박정우','울산','010-2385-6789','park004@naver.com',5);
insert into professor values(8,'김지우','부산','010-3446-7890','kim008@naver.com',2);
insert into professor values(9,'이승현','창원','010-4562-8901','lee003@gmail.com',5);
insert into professor values(10,'이아린','대구','010-5778-9012','lee004@gmail.com',4);

select *from professor;

-- 학과정보(id, 이름)
create table major(
    major_id number primary key,
    major_name varchar(200) not null
);

-- 학과 데이터 삽입
insert into major values(1,'컴퓨터공학과');
insert into major values(2,'건축학과');
insert into major values(3,'해양공학과');
insert into major values(4,'법학과');
insert into major values(5,'전자공학과');

select *from major;

-- 강의정보(id, 강의이름, 담당교수)
create table class(
    class_id number primary key,
    class_name varchar(300) not null,
    pro_id number
);

select *from class;

-- 강의정보 데이터 삽입
insert into class values(1,'java기초',1);
insert into class values(2,'DataBase',1);
insert into class values(3,'phython',2);
insert into class values(4,'일반물리학',5);
insert into class values(5,'양자역학',5);
insert into class values(6,'알고리즘',2);
insert into class values(7,'디지털통신',4);
insert into class values(8,'전자기학',7);
insert into class values(9,'행정법',10);
insert into class values(10,'재무관리',10);
insert into class values(11,'건축학개론',8);

select *from class;

-- 수강신청(강의, 신청학생)
create table application(
    class_id number,
    stu_id number,
    foreign key(class_id) references class(class_id),
    foreign key(stu_id) references student(stu_id)
);
select class_id,count(*)from application group by class_id;

-- 수강신청 데이터삽입

insert into application values(1,1);
insert into application values(1,15);
insert into application values(1,2);

insert into application values(2,7);
insert into application values(2,11);

insert into application values(3,3);
insert into application values(3,4);
insert into application values(3,9);

insert into application values(4,15);
insert into application values(4,18);
insert into application values(4,12);
insert into application values(4,5);
insert into application values(4,6);
insert into application values(4,11);

insert into application values(6,9);
insert into application values(6,2);

insert into application values(7,1);
insert into application values(7,3);
insert into application values(7,5);
insert into application values(7,7);
insert into application values(7,9);
insert into application values(7,13);
insert into application values(7,15);

insert into application values(9,4);
insert into application values(9,8);
insert into application values(9,6);
insert into application values(9,12);

insert into application values(10,1);
insert into application values(10,14);
insert into application values(10,13);
insert into application values(10,6);
insert into application values(10,9);
insert into application values(10,7);

insert into application values(11,5);
insert into application values(11,14);
insert into application values(11,12);
insert into application values(11,9);
insert into application values(11,7);
insert into application values(11,5);
insert into application values(11,1);
insert into application values(11,3);

select *from application;
-- SQL문

-- 1.'일반물리학'의 담당교수 수정
update class set pro_id=2 where class_name like '일반물리학';
select * from class;

-- 2.'권민현'학생 학과 전자공학과로 수정
update student set major_id=
              (select major_id from major 
               where major_name like '전자공학과')
where stu_name like '권민현';

-- 3.양자역학 강의 삭제
delete from class where class_name like '양자역학';
select *from class;

-- 4.수강생 0명인 강의 삭제
delete from class where class_name=
        (select class_name
         from class c left join application a on c.class_id=a.class_id
         where stu_id is null);

-- 5.학과 이름 조회
select major_name from major;

-- 6.학과 이름에 '공학'이 들어가는 학과 조회
select major_name
from major
where major_name like '%공학%';

-- 7.주소가 '부산'인 학생 조회
select *
from student s
where s.stu_add like '부산';

-- 8.3학년 학생 조회
select *
from student s
where s.grade=3;

-- 9.'전자공학과'인 교수 조회
select *
from professor p, major m
where p.major_id=m.major_id and major_name like '전자공학과';

-- 10.'법학과'인 학생 이름 조회
select stu_name
from student s, major m
where s.major_id=m.major_id
and major_name like '법학과';

-- 11.'컴퓨터공학과' 교수 중 주소가 '부산'인 교수 조회
select *
from professor p
where p.pro_add like '부산' and p.major_id=
    (select major_id from major 
    where major_name like '컴퓨터공학과');
    
-- 12.각 성별 인원 수 조회
select substr(stu_name,1,1) "성",count(*) "인원 수"
from student
group by substr(stu_name,1,1)
order by substr(stu_name,1,1);

-- 13.학과별 학생의 수 조회
select m.major_name "전공 이름",count(*) "학생 수"
from major m,student s
where m.major_id=s.major_id
group by m.major_name;

-- 14.컴퓨터 공학과 학생의 수 
select m.major_name "전공 이름",count(*) "학생 수"
from major m,student s
where m.major_id=s.major_id and m.major_name like '컴퓨터공학과'
group by m.major_name;

-- 15.인원이 가장 많은 학과 이름 조회
select major_name
from major m,student s
where m.major_id=s.major_id
group by major_name
having count(*)=(select max(count(*))from major m,student s 
                 where m.major_id=s.major_id
                 group by m.major_id);

-- 16.건축학과 학생 중 3학년 조회
select *
from student s, major m
where s.major_id=m.major_id and major_name like '건축학과'
and s.grade=3;

-- 17.'이하준'학생과 같은 학과 학생들 조회(이하준 제외)
select *
from student s1
where stu_name not like '이하준' and s1.major_id=(select s2.major_id
                from student s2
                where s2.stu_name like '이하준');

-- 18.java 기초를 강의하는 교수의 정보 조회
select *
from professor p
where p.pro_id=(select pro_id from class where class_name like 'java기초');

-- 19.수강신청을 한 학생 조회
select stu_name
from student s,application a
where s.stu_id=a.stu_id
group by stu_name;

-- 20.강의별 수강신청한 학생의 수 조회
select class_name "강의명", count(*) "학생의 수"
from class c join application a on c.class_id=a.class_id
join student s on a.stu_id=s.stu_id
group by class_name;

-- 21.학생별 수강한 강의 수 조회
select stu_name "학생이름", count(*) "강의 수"
from student s, application a
where s.stu_id=a.stu_id
group by stu_name;

-- 22.교수별 강의 수 조회
select pro_name,count(*)
from professor p, class c
where p.pro_id=c.pro_id
group by pro_name;

-- 23.신청한 강의가 3개 이상인 학생 조회
select stu_name "학생이름"
from student s, application a
where s.stu_id=a.stu_id
group by stu_name
having count(*)>=3;

-- 24.java기초 수강한 학생의 수 조회
select class_name "강의명", count(*) "학생의 수"
from class c join application a on c.class_id=a.class_id
join student s on a.stu_id=s.stu_id
where c.class_name like 'java기초'
group by class_name;

-- 25.신청한 학생이 가장많은 강의와 학생수 조회
select c.class_name,count(*) "학생 수"
from class c, application a
where c.class_id=a.class_id
group by c.class_name
having count(*)=(select max(count(*))
                from class c, application a
                where c.class_id=a.class_id
                group by c.class_id);

-- 26.'권서준'교수가 수업하는 강의이름 조회
select class_name
from class c, professor p
where c.pro_id=p.pro_id and p.pro_name like '권서준';

-- 27.수강인원이 0명인 강의이름 조회
select class_name
from class c left join application a on c.class_id=a.class_id
where stu_id is null;

-- 28.강의를 하지 않는 교수의 정보 조회
select *
from professor p left join class c on p.pro_id=c.pro_id
where class_id is null;

-- 29.'일반물리학'을 수강한 학생이름 조회
select s.stu_name
from student s, application a, class c
where s.stu_id=a.stu_id and a.class_id=c.class_id
and c.class_name like '일반물리학';

-- 30.학년별 학생의 수(오름차순 정렬) 조회
select grade "학년",count(*) "학생 수"
from student
group by grade
order by count(*);

-- 31.수강신청을 하지 않은 학생 정보 조회
select *
from student s left join application a on s.stu_id=a.stu_id
where class_id is null;

-- 32.해양공학과 교수들 중 강의를 하지 않는 교수 조회
select *
from professor p left join class c on p.pro_id=c.pro_id
where class_id is null and p.pro_name in
    (select p.pro_name from professor p, major m 
     where p.major_id=m.major_id and major_name like '해양공학과');

-- 33.수강신청을 하지 않은 학생 중 '법학과'학생 조회
select *
from student s left join application a on s.stu_id=a.stu_id
join major m on s.major_id=m.major_id
where class_id is null and m.major_name like '법학과';

-- '34.건축학개론'을 수강한 학생 중 2학년 학생 조회
select *
from student s, application a, class c
where s.stu_id=a.stu_id and a.class_id=c.class_id
and c.class_name like '건축학개론' and s.grade=2;

-- 35.'디지털통신'을 수강한 학생들을 가나다순으로 정렬해 앞의 3명만 조회
select rownum,stu_name
from student s,application a,class c
where s.stu_id=a.stu_id and a.class_id=c.class_id
and c.class_name like '디지털통신' 
and rownum<=3;

-- 뷰 생성
create view vw_student(id,name,grade,m_name,address)
as select s.stu_id,s.stu_name,s.grade,m.major_name,s.stu_add 
from student s, major m
where s.major_id=m.major_id and m.major_name like '전자공학과';

-- 뷰를 사용한 sql문

-- 36.뷰를 사용하여 '전자공학과' 학생의 이름, 학년 조회
select name, grade from vw_student;

-- 37.뷰를 사용하여 '전자공학과' 학생 중 주소가 '부산'인 학생 정보 조회
select * from vw_student where address like '부산';

-- vw_student의 학과를 '해양공학과'로 변경
create or replace view vw_student(id,name,grade,m_name,address)
as select s.stu_id,s.stu_name,s.grade,m.major_name,s.stu_add 
from student s, major m
where s.major_id=m.major_id and m.major_name like '해양공학과';

select * from vw_student;

-- vw_student 뷰 삭제
drop view vw_student;
commit;

