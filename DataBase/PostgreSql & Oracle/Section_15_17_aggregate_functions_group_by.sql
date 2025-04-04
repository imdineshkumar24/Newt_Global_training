select count(*) from movies;

select count(distinct(movie_lang)) from  movies;

select count(movie_name) from  movies where movie_lang='English'

select director_id,
sum(movie_length) as "Total Length" from  movies 
group by director_id order by director_id;

select m.director_id,
sum(revenue_domestic) as "directors collection" 
from movie_revenues r natural join movies m 
group by m.director_id order by m.director_id

select movie_lang,sum(movie_length) from  movies 
group by movie_lang


select max(movie_length) from movies
select min(movie_length) from movies

select movie_name,max(movie_length) from movies
group by movie_name

select max(movie_name) from movies
select min(movie_name) from movies


select min(movie_name),
length(movie_name) as len from movies 
group by movie_name order by len desc


select max(release_date) from movies
where movie_lang = 'English'

select max(release_date) from movies


--least or greatest :note - same data type only valid

select least('A','B','C')
select greatest('A','B','C')

select 
least(revenue_domestic,revenue_international) 
from movie_revenues

select 
revenue_domestic,revenue_international,
greatest(revenue_domestic,revenue_international) as greatest,
least(revenue_domestic,revenue_international) as least
from movie_revenues


--avg
select m.director_id,
avg(mr.revenue_domestic)  as "Average Revenue" from movies m
natural join movie_revenues mr
group by m.director_id order by director_id

select avg(movie_length) from movies
where movie_lang='Chinese'

select movie_lang,avg(movie_length) from movies
group by movie_lang

--note : ignore all null values

select 12+2,12-2,12*2,12/2,12.24*12.24,12%5

select 
mr.movie_id, m.movie_name,
mr.revenue_domestic,mr.revenue_international,
(mr.revenue_domestic+mr.revenue_international) as "Total Revenues"
from movie_revenues mr natural join movies m
order by 5 desc nulls last
order by m.


select movie_lang,count(movie_name) as "Language Count"
from movies group by movie_lang order by 2 desc


select age_certificate,sum(movie_length) 
from  movies group by age_certificate


select movie_lang,max(movie_length),min(movie_length)
from movies group by movie_lang


select movie_lang,age_certificate,count(movie_name) "Count"
from movies group by movie_lang,age_certificate
order by 3 desc


select movie_lang,sum(movie_length)as "T_Length" from movies
group by movie_lang having sum(movie_length)>200


insert into movies(movie_name,movie_length)
values('Brave new world',130)

--handling null values in group by using "coalesce"
select coalesce(movie_lang,'no language') as lang,
sum(movie_length) from movies group by movie_lang