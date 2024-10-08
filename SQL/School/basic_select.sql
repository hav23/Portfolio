use sakidadb;
-- opgave 11.1
select count(*) from payment;
-- opgave 11.2
select customer_id, count(*), sum(amount) from payment group by customer_id;
-- 11.3
select customer_id, count(*), sum(amount) from payment group by customer_id having count(*) >= 40;
-- 11.4
select count(*) as number_of_movies, rating from film group by rating;
-- 11.5
select title, description, rating, length 
from film
where length >= (select avg(length) from film);