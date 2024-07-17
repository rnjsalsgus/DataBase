-- chapter04_Quiz

select abs(-15) from dual;

select ceil(15.7) from dual;

select cos(3.14159) from dual;

select floor(15.7) from dual;

select log(10,100) from dual;

select mod(11,4) from dual;

select power(3,2) from dual;

select round(15,7) from dual;

select sign(-15) from dual;

select trunc(15.7) from dual;

select chr(67) from dual;

select concat('HAPPY','Birthday') from dual;

select lower('Birthday') from dual;

select lpad('Page 1',15,'*') from dual;

select ltrim('Page 1','ae') from dual;

select replace('JACK','J','BL') from dual;

select rpad('Page 1',15,'*') from dual;

select rtrim('Page 1','ae') from dual;

select substr('abcdefg',3,4) from dual;

select trim(LEADING 0 from '00aa00') from dual;

select upper('Birthday') from dual;

select ascii('A') from dual;

select instr('CORPORATE FLOOR','OR',3,2) from dual;

select length('Birthday') from dual;

select add_months('14/05/21',1) from dual;

select last_day(sysdate) from dual;

select next_day(sysdate,'ȭ') from dual;

select round(sysdate) from dual;

select sysdate from dual;

select to_char(sysdate) from dual;

select to_char(123) from dual;

select to_date('12052020','dd mm yyyy') from dual;

select to_number('12.3') from dual;

select decode(1,1,'aa','bb') from dual;

select nullif(123,345) from dual;

select nvl(null,123) from dual;

select * from Mybook;

select bookid,nvl(price,0) from mybook;

select * from mybook where price is null;

select * from mybook where price='';

select bookid,price+100 from mybook;

select sum(price),avg(price),count(*) from mybook where bookid>=4;

select count(*), count(price) from mybook;

select sum(price),avg(price) from mybook;

select * from book;

select * from book where rownum<=5;

select * from book where rownum<=5 order by price;

select * from (select * from book order by price) b;

select * from (select * from book where rownum<=5) b;

select * from (select * from book where rownum<=5 order by price)b;
