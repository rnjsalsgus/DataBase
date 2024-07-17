-- 카페 게시판 데이터베이스

-- 사용자 테이블
create table board_user(
    id varchar2(50) primary key,
    name varchar2(50) not null,
    password varchar2(300) not null,
    phone varchar2(100),
    email varchar2(100) not null unique
);

-- 사용자 테이블에 데이터 삽입
insert into board_user values('U001','권민현','a552266','010-0000-0000','kwon001@naver.com');
insert into board_user values('U002','이지훈','a72539','010-0000-1111','lee001@naver.com');
insert into board_user values('U003','김민혁','qwe123','010-1111-0000','kim001@naver.com');
insert into board_user values('U004','강경훈','q1w2e3r4','010-2222-1111','kang001@naver.com');
insert into board_user values('U005','김재섭','753ggdd2','010-0000-2222','kim002@naver.com');

-- 게시판 테이블
create table board(
    board_id number primary key,
    title varchar2(300) default '임시제목',
    content long not null,
    user_id varchar2(50),
    create_date timestamp default systimestamp
);

alter table board modify(create_date date default current_date);
alter session set nls_date_format='yyyy-mm-dd hh:mi:ss';

insert into board(board_id,title,content,user_id)
values(1,'hello','hello everyone','U001');
insert into board(board_id,title,content,user_id)
values(2,'hi','hi everyone','U001');
insert into board(board_id,title,content,user_id)
values(3,'goodmorning','goodmorning everyone','U001');
insert into board(board_id,title,content,user_id)
values(4,'goodafternoon','goodafternoon everyone','U002');
insert into board(board_id,title,content,user_id)
values(5,'goodbye','goodbye everyone','U002');
insert into board(board_id,title,content,user_id)
values(6,'bye','bye everyone','U004');
insert into board(board_id,title,content,user_id)
values(7,'goodevening','goodevening everyone','U004');
insert into board(board_id,title,content,user_id)
values(8,'Welcome','Welcome everyone','U004');
insert into board(board_id,title,content,user_id)
values(9,'indroduce','my name is Kang','U004');
insert into board(board_id,title,content,user_id)
values(10,'안녕','안녕하세요 모두들','U005');
insert into board(board_id,title,content,user_id)
values(11,'점심메뉴','메뉴 추천 해주세요','U005');
insert into board(board_id,title,content,user_id)
values(12,'야식','야식 추천 좀','U005');
insert into board(board_id,title,content,user_id)
values(13,'저녁추천','저녁메뉴 추천','U005');
insert into board(board_id,title,content,user_id)
values(14,default,'반갑습니다 여러분','U005');

select * from board;

-- 댓글 테이블
create table reply(
    id number primary key,
    re_content varchar2(300),
    create_date date default sysdate,
    user_id varchar2(50),
    board_id number,
    foreign key(user_id) references board_user(id),
    foreign key(board_id) references board(board_id)
);

insert into reply(id,re_content,user_id,board_id) values(1,'hi','U003',1);
insert into reply(id,re_content,user_id,board_id) values(2,'hello','U002',1);
insert into reply(id,re_content,user_id,board_id) values(3,'goodmorning','U002',2);
insert into reply(id,re_content,user_id,board_id) values(4,'bye','U001',5);
insert into reply(id,re_content,user_id,board_id) values(5,'안녕하세요','U001',7);
insert into reply(id,re_content,user_id,board_id) values(6,'goodmorning','U005',3);
insert into reply(id,re_content,user_id,board_id) values(7,'국밥','U005',11);
insert into reply(id,re_content,user_id,board_id) values(8,'치킨이요','U005',13);
insert into reply(id,re_content,user_id,board_id) values(9,'족발','U002',12);
insert into reply(id,re_content,user_id,board_id) values(10,'반가워요','U002',9);
insert into reply(id,re_content,user_id,board_id) values(11,'어서오세요','U001',8);
insert into reply(id,re_content,user_id,board_id) values(12,'초밥','U004',11);
insert into reply(id,re_content,user_id,board_id) values(13,'피자먹죠','U005',13);
insert into reply(id,re_content,user_id,board_id) values(14,'반갑습니다','U004',14);
insert into reply(id,re_content,user_id,board_id) values(15,'반가워요','U002',14);
insert into reply(id,re_content,user_id,board_id) values(16,'어서오세요','U001',14);

select * from reply;
-- sql문

-- 1.board테이블의 날짜 데이터타입,포맷 수정
alter table board modify(create_date date default sysdate);
alter session set nls_date_format='yyyy-mm-dd hh:mi:ss';

-- 2. board_id가 10번인 글 제목 수정
update board set title='안녕하세요!' where board_id=10;

-- 3. 댓글 테이블 삭제
drop table reply;

-- 4. 댓글이 0개인 게시글 삭제
delete from board where board_id in (
    select b.board_id from board b left join reply r on b.board_id=r.board_id
    where r.id is null);

-- 5. 전체 사용자 조회
select *from board_user;

-- 6. 게시글 전체 목록 조회
select title,create_date from board;

-- 7. 게시글 댓글의 총 개수
select sum(count(*))
from reply r
group by r.id;

-- 8. 게시글별 댓글 개수(많은 순서부터 내림차순) 조회
select b.title,count(*)
from board b, reply r where b.board_id=r.board_id
group by b.title
order by count(*) desc;

-- 9.댓글이 가장 많은 게시글 조회
select b.title,count(*) "댓글 수"
from board b,reply r where b.board_id=r.board_id
group by b.title
having count(*)=(select max(count(*))
                from board b, reply r
                where b.board_id=r.board_id
                group by b.board_id);

-- 10.사용자별 작성한 게시글 수
select u.id, u.name, count(*) "게시글 수"
from board_user u,board b where u.id=b.user_id
group by u.id,u.name;

-- 11.게시글을 작성하지 않은 사용자 조회
select u.id,u.name
from board_user u left join board b on u.id=b.user_id
where b.board_id is null;

-- 12. 'U005' 사용자가 작성한 게시글 목록 조회
select u.id,b.title
from board_user u,board b where u.id=b.user_id
and u.id='U005';

-- 13.사용자별 댓글 개수 조회
select u.id,u.name,count(*)
from board_user u,reply r where u.id=r.user_id
group by u.id,u.name;

-- 14.'U002'유저가 작성한 댓글 목록 조회
select re_content
from board_user u, reply r where u.id=r.user_id
and u.id='U002';

-- 15. 댓글을 3개 이상 작성한 사용자 조회
select u.id,u.name
from board_user u,reply r where u.id=r.user_id
group by u.id,u.name
having count(*)>=3;

-- 16. 댓글을 가장많이 작성한 사용자 조회
select u.name,count(*) "댓글 수"
from board_user u, reply r where u.id=r.user_id
group by u.name
having count(*)=(select max(count(*)) from board_user u, reply r where u.id=r.user_id
                 group by u.id);

-- 17. 게시글 제목이 임시제목인 게시글을 쓴 사용자 조회                
select u.id,u.name
from board_user u,board b where u.id=b.user_id
and b.title='임시제목';

-- 18. 댓글이 가장 많은 게시글을 작성한 사용자조회
select u.id,u.name
from board_user u, board b where u.id=b.user_id
group by u.id,u.name,b.title
having b.title=(select b.title
                from board b,reply r where b.board_id=r.board_id
                group by b.title
                having count(*)=(select max(count(*))
                                 from board b, reply r
                                 where b.board_id=r.board_id
                                 group by b.board_id));

-- 19. 게시글을 작성하지 않은 사용자가 작성한 댓글 조회

select r.id,r.re_content
from reply r,board_user u where r.user_id=u.id
and u.id=(select u.id from board_user u left join board b on u.id=b.user_id
          where b.board_id is null)
group by r.id,r.re_content;

-- 20. '김재섭' 사용자와 작성한 댓글 수가 같은 사용자 조회
select u.name
from board_user u, reply r where u.id=r.user_id and u.name not like '김재섭'
group by u.name
having count(*)=(select count(*) from board_user u,reply r 
                where u.id=r.user_id and u.name like '김재섭'
                group by u.id);
                
-- 21. 댓글을 가장 많이 작성한 사용자가 게시한 게시글 목록 조회
select b.board_id,b.title,u.name
from board b,board_user u where b.user_id=u.id
and u.id=(select u.id
          from board_user u, reply r where u.id=r.user_id
          
          group by u.id
          having count(*)=(select max(count(*)) from board_user u,reply r 
                           where u.id=r.user_id
                           group by u.id));

















