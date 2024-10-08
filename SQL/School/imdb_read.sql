use imdb;

select genre, count(id) as 'antal forekomster'
from movies
group by genre
order by count(genre) desc;
-- Desc er sortering faldende & asc stigende

select *
from movies
order by imdb_rating desc;

select name, year, imdb_rating as rating
from movies
where imdb_rating >= (select avg(imdb_rating) from movies)
order by imdb_rating desc, name, year desc;

select avg(imdb_rating) as 'IMDB-Avg', genre as 'Genre' from movies
group by genre
order by avg(imdb_rating) desc;

select firstname, lastname, coursename
from student as s
inner join studentcourse as sc
on s.id=sc.sid
inner join course as c
on c.id=sc.cid
