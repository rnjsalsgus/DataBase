use sakila;

select *
from country,city
where country.country_id=city.country_id;

select *
from address a,city c
where a.city_id=c.city_id;

select *
from country 
inner join city on country.country_id=city.country_id;

select co.country, c.city, a.address
from address a
inner join city c on a.city_id=c.city_id
inner join country co on c.country_id=co.country_id
where co.country='south korea';

select title,release_year,name
from film f
inner join language l on f.language_id=l.language_id
where name like 'French';

select name
from language;




create table board(
	b_id int primary key,
    b_title varchar(20) not null,
    b_date timestamp default now(),
    user_id varchar(20),
    b_main varchar(1000)
);

create table reply(
	r_id int primary key,
    r_main varchar(500) not null,
    r_date timestamp default now()
);

create table board(
	id int primary key auto_increment, -- 게시글 번호
    title varchar(100) default "임시 제목", -- 게시글 제목
	content varchar(100000) not null, -- 게시글
    create_date timestamp default current_timestamp(), -- 작성 시간
    update_date timestamp -- 수정 시간
);

create table reply(
	id int primary key auto_increment,
    content varchar(100000) not null,
    board_id int,
    create_date timestamp default current_timestamp(),
    update_date timestamp);
    
select * from board inner join reply on board.id=reply.board_id;

create table student(
	stu_id int primary key auto_increment,
	name varchar(12) not null,
    phone varchar(20) not null unique,
    age int not null
);
create table subject(
	sub_id int primary key,
    sub_name varchar(20) not null,
    teacher_name varchar(12) not null
);
create table student_subject(
	id int primary key auto_increment,
    sub_id int,
    stu_id int
);
select *from student_subject ss 
inner join subject su on ss.sub_id=su.id 
inner join student st on ss.stu_id=st.id;

create table exam(
	id int primary key auto_increment,
	title varchar(30) not null
);

create table result(
	id int primary key auto_increment,
	content varchar(20) not null
);
create table exam_result(
	id int primary key auto_increment,
    exam_id int,
    result_id int
);

create table exam_paper(
	id int primary key auto_increment,
    title varchar(20) not null
);
create table exam_question(
	id int primary key auto_increment,
    content varchar(200) not null,
    exam_paper int
);
create table answer(
	id int primary key auto_increment,
    number varchar(1) not null,
    content varchar(200) not null,
    is_correct bool not null,
    exam_question_id int
);

select s.store_id,f.title, f.release_year
from inventory i 
inner join film f on i.film_id=f.film_id
inner join store s on i.store_id=s.store_id;

select *from film;

select *
from inventory i 
inner join film f on i.film_id=f.film_id
inner join store s on i.store_id=s.store_id;


