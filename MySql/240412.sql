create schema test1;

use test1;

create table actor6(
	actor_id INT auto_increment,
    first_name varchar(10) unique,
    last_name varchar(10),
    last_update timestamp,
    constraint actor_id_pk primary key(actor_id)
);
insert into actor5(last_update)
values(now());

desc actor;

drop table actor6;

truncate table actor;

alter table actor
add constraint actor_id_pk primary key(actor_id);

alter table actor
change first_name first_name varchar(30) not null,
change last_name last_update timestamp default current_timestamp,
change last_update last_name varchar(45) not null,
change actor_id actor_id int auto_increment;


select *from actor5;

insert into actor(actor_id, first_name, last_name)
values(1,"Tom","Hanks");