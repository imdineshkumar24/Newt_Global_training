
select * from movies;

select * from movies
where movie_id=1 -- no coversion

select * from movies
where movie_id='1' --automatically do the conversion

select * from movies
where movie_id= Integer '1' --  conversion casting

--casting
select cast('1' as Integer)
select cast('2020-05-24' as date)

select cast('24-May-2003' as date)


select cast('true' as boolean),cast('0' as boolean),
cast('y' as boolean)

--expression::type

select '10 minutes':: interval,'10'::int


--explicit conversion

select round(10,4) as result;

select round(cast('100' as numeric),2) as result


select * from movies;

select cast(age_certificate as int) as age_c from movies

create table rating(
	id Serial primary key,
	rating varchar(1)
)

insert into rating(rating) values
('A'),('B'),('C'),('D'),('1'),('2'),('3'),('4')

select * from rating

select id ,case 
	when rating~E'^\\d+$' then
		cast(rating as integer)
	else 
		0
	end as rating
from rating

/* important
case 
	when rating~E'^\\d+$' then
		cast(rating as integer)
	else 
		0
	end as rating
*/

--conversion function
select * from movie_revenues

select movie_id,to_char(revenue_domestic,'$999D999') from movie_revenues

select * from movies
select movie_name,to_char(release_date,'dd-mon-yy') from movies

