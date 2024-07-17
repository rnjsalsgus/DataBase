use sakila;

desc actor;

select store_id,count(store_id)
from inventory
group by store_id;

select customer_id,sum(amount) as '지불 총 금액',
	   avg(amount) as '지불 평균 금액'
from payment
group by customer_id
having sum(amount)>=100;

-- 테이블 생성
create table user(
	id int auto_increment,
    username varchar(20) not null unique,
    password varchar(200) not null,
    email varchar(100),
    constraint user_id_key primary key(id)
);

-- 데이터삽입
insert into user(username,password,email)
values('user1','12341234','user1@naver.com'),
	  ('user2','33332222',null),
      ('user3','55443322','user3@gmail.com');
      
-- 로그인 로직
select *
from user
where username='user1' and password='12341234';

-- email이 null이 아닌 유저 찾기
select *
from user
where email is not null;
-- null 값을 비교할 때는 !=연산자 사용 불가능, is null로 비교

select *,
	case
		when amount>9 then '9보다 큼'
        when amount>=3 then '3보다 큼'
        else '3이하'
	end as 테스트
from payment;

select *,
	case
		when email is null then '이메일 없음'
        else '이메일 있음'
	end as 테스트
from user;

-- 1~100까지를 제외하고 100이후의 1000개를 검색
select *
from payment limit 100,1000;

create table fish_info(
	id int not null,
    fish_type int not null,
    length float,
    time date not null
);
desc fish_info;
insert into fish_info(id,fish_type,length,time)
values(0,0,30,'2021-12-04'),
	  (1,0,50,'2021-12-04'),
      (2,0,40,'2021-12-04'),
      (3,0,20,'2021-12-04'),
      (4,0,10,'2021-12-04'),
      (5,0,13,'2021-12-04'),
      (6,0,60,'2021-12-04'),
      (7,0,55,'2021-12-04'),
      (8,0,73,'2021-12-04'),
      (9,0,73,'2021-12-04'),
      (10,0,22,'2021-12-04'),
      (11,0,17,'2021-12-04');

desc fish_info;

select *
from fish_info;

select id,length
from fish_info
where length>=10
order by length desc,id limit 10 ;

select id,email,first_name,last_name
from developer_infos
where skill_1 like 'python' or skill_2 like 'python' or skill_3 like 'python';


	





