use sakila;

select f.title as "영화 제목", concat(a.first_name,' ',a.last_name) as "배우 이름"
from actor a join film_actor af on a.actor_id=af.actor_id
join film f on af.film_id=f.film_id
where f.title like 'Z%'
order by f.title desc,a.first_name;

select concat(c.first_name,' ',c.last_name) as "고객 이름", f.title as "빌린 영화 제목"
from inventory i join film f on i.film_id=f.film_id
join rental r on i.inventory_id=r.inventory_id
join customer c on c.customer_id=r.customer_id
where c.first_name like 'AARON'
order by title limit 9;

select concat(c.first_name,' ',c.last_name) as "고객 이름", count(*) as "빌린 영화 제목"
from inventory i join film f on i.film_id=f.film_id
join rental r on i.inventory_id=r.inventory_id
join customer c on c.customer_id=r.customer_id
where concat(c.first_name,' ',c.last_name) like "%any String%"
group by c.customer_id
order by c.first_name;

create table blog_user(
	user_id varchar(20) primary key not null unique,
    password varchar(200) not null,
    email varchar(50) not null,
    profile varchar(200)
);

create table blog_board(
	board_id int primary key auto_increment,
    title varchar(100) not null,
    content varchar(2000) not null,
    user_id varchar(20),
    created_date timestamp default now(),
	constraint foreign key(user_id) references blog_user(user_id)
);

insert into blog_user values('U001','123456789','U001@naver.com','http://www.U001img.com'),
('U002','789456123','U002@gmail.com','http://www.U002img.com'),
('U003','456789123','U003@naver.com','http://www.U003img.com'),
('U004','159753789','U004@gmail.com','http://www.U004img.com'),
('U005','951357456','U005@naver.com','http://www.U005img.com');
insert into blog_board(title,content,user_id)
values('Hi','Hi Everyone','U001'),
('Hello','Hello Everyone','U001'),
('Bye','Bye Everyone','U001'),
('Goodmorning','Goodmorning Everyone','U001'),
('GoodBye','Goodbye Everyone','U001');
alter table blog_user
change email email varchar(50) not null unique;
alter table blog_board
change board_id board_id bigint auto_increment;


select *from blog_user;
select *from blog_board;
-- 수정
update blog_board set title='Goodevening' where title like 'Goodmorning';

-- 삭제
delete from blog_board where user_id like 'U004';

--
select b.board_id,b.title,u.user_id,b.created_date
from blog_user u join blog_board b on u.user_id=b.user_id;

select b.title,b.content,b.created_date
from blog_user u join blog_board b on u.user_id=b.user_id
where b.board_id=1;



