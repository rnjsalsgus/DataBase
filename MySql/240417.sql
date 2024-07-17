use sakila;

desc country;

insert into country(country)
values("Heaven");
update country
set country="Hell"
where country_id=110;

select *from country where country="South Korea";
select *from country where country like "S%";
select *from country where country_id>=10&&country_id<=50;
select *from country where country like "S____";
select *from country where country like "%o%";
select country,last_update from country where country like "a%a";

-- order by
-- amount값을 기준으로 정렬하기
select *from payment order by amount;
-- 내림차순으로 정렬할 땐 desc를 붙여 사용
select *from payment order by amount desc;
-- 문자 순서대로 정렬
select *from country order by country;
-- order by는 문장의 끝에 사용한다.
select *from actor where actor_id<30 order by first_name;

-- group by
-- 동일한 값을 그룹화하여 데이터를 조회
select count(amount), amount from payment group by amount order by amount;
-- select 그룹화할_칼럼명 count(그룹화할_칼럼명) from 테이블명 group by 그룹화할_칼럼명
-- count() -> 그룹화한 칼럼명의 갯수
desc film;
select count(rental_duration), rental_duration from film group by rental_duration order by rental_duration;

select sum(amount), amount from payment group by amount order by amount;
-- sum() -> 그룹화한 칼럼에 있는 값들을 더한 값
-- avg() -> 그룹화한 칼럼에 있는 값들의 평균 값

select rental_duration as "빌린일수",count(rental_duration) as 개수,sum(rental_duration) as 합계,avg(rental_duration) as 평균 from film group by rental_duration order by rental_duration;

select rental_duration as "빌린일수",count(rental_duration) as 개수,sum(rental_duration) as 합계,avg(rental_duration) as 평균 from film where rental_duration<5 group by rental_duration order by rental_duration;

select rental_duration as "빌린일수",count(rental_duration) as 개수,sum(rental_duration) as 합계,avg(rental_duration) as 평균 from film group by rental_duration having count(rental_duration<5)=203 order by rental_duration;
-- Having절에서는 count(),sum() 등 group by에서 쓰는 function을 사용할 수 있다. (where절에서는 사용이 불가능)
-- where절은 group by의 앞에 사용, Having절은 group by의 뒤에 사용 (각 절이 실행되는 순서도 차이가 있다.)

select actor_id,count(actor_id) as 개수,avg(film_id) as "film_id 평균" 
from film_actor 
group by actor_id having actor_id<=10
order by actor_id








