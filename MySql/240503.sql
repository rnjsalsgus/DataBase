use sakila;

select *from customer;
select *from payment;

select concat(c.first_name,' ',c.last_name) "고객이름",sum(p.amount) "총 사용 금액"
from customer c join payment p on c.customer_id=p.customer_id
group by c.customer_id
order by sum(amount) desc;

select * from (select *from city where city_id=1) ci
join country c on ci.country_id=c.country_id;

 select *from film_actor fa 
 join film f on fa.film_id=f.film_id
 join actor a on fa.actor_id=a.actor_id
 where a.first_name like 'nick';
 
 select *from (select *from actor where actor.first_name like 'nick') a
 join film_actor fa on a.actor_id=fa.actor_id
 join film f on fa.film_id=f.film_id;
 
 select avg(amount) from payment;
 select * from payment;
 select *from payment where amount < (select avg(amount) from payment);
 
 select *, (select avg(amount) from payment where customer_id=1) "1번 고객 평균 값" 
 from payment 
 where amount > (
		select avg(amount) from payment 
		where customer_id=1)
order by amount,customer_id;

select customer_id,avg(amount) "고객별 평균 amount", (select avg(amount) from payment where customer_id=1) "1번 고객 평균 amount" 
 from payment
 group by customer_id
 having avg(amount) < (
		select avg(amount) from payment 
		where customer_id=1)
order by avg(amount) desc;

select customer_id,avg(amount) "고객별 평균 amount", 
	(select avg(amount) from payment p 
	join customer c on p.customer_id=c.customer_id 
    where c.first_name='BARBARA') "BARBARA 고객 평균 amount" 
 from payment
 group by customer_id
 having avg(amount) < (
	select avg(amount) from payment p 
	join customer c on p.customer_id=c.customer_id 
	where c.first_name='BARBARA')
order by avg(amount) desc;

select avg(amount) from payment
where customer_id=(select customer_id from customer where first_name='BARBARA');

select *,(select country from country where city.country_id=country.country_id) "country" from city;


 
select (select concat(first_name,' ' ,last_name) 
		from customer
        where customer.customer_id = payment.customer_id) "회원 이름",
avg(amount) "평균 amount",
	   (select avg(amount) 
       from payment 
       where customer_id=1) "1번 회원 amount"
from payment
group by customer_id
having avg(amount) < 
	(select avg(amount) from payment where customer_id=1);









