use sakila;

select avg(amount),sum(amount),max(amount)
from customer c join payment p on c.customer_id=p.customer_id
join store s on c.store_id=s.store_id
where s.store_id=1;

select avg(amount) "1번 스토어 평균 amount",
	   sum(amount)"1번 스토어 총 amount",
       max(amount)"1번 스토어 최대값 amount"
from customer c join payment p on c.customer_id=p.customer_id
where c.store_id=1;

create table user(
	user_id bigint primary key auto_increment,
	email varchar(500) not null unique,
    user_name varchar(200) not null,
    password varchar(500) not null
);
create table user_re(
	user_name varchar(200),
    password varchar(5000)
);
create table item(
	item_id int primary key auto_increment,
    item_img varchar(300),
    item_name varchar(200) not null,
    price int not null
);

create table item_option(
	item_id int not null,
    item_option varchar(300)
);

-- https://zrr.kr/E4T9


