select * from movies;

select upper(movie_name)as "Movie Name",
lower(movie_lang) as "Movie lang" from movies; 

select initcap('the sun rises in the east') as Text

select left(movie_lang,2) from  movies
select right(movie_lang,3) from movies

select left(movie_lang,-2) from  movies --len-2

select right(movie_lang,-3) from movies

select last_name,right(last_name,2) as "right" from actors
where right(last_name,2)='en'

select reverse(movie_name) as "Reverse Name" from movies

select movie_name ,
split_part(release_date,'-',1) as "Split Date"
from  movies --error: it works only string format

select split_part('a,b,c',',',2) as split

select movie_name ,
split_part(cast(release_date as varchar(20)),'-',1) as "Release Year"
from  movies

select char_length('a b');

select movie_name,length(movie_name) as len_of_movie, 
char_length(movie_name) as "character Length"
from movies

--length and char_length both are same

select movie_name,
position('of' in movie_name) from  movies
where movie_name like '%of%'


select lpad('abc',5,'*') --"**abc"
select rpad('abc',5,'*') --"abc**"

select movie_name,repeat(movie_lang,3) as "Rpt Lang"
from movies

select movie_name , 
replace(age_certificate,'18','A') as "age_certificate"
from movies where age_certificate='18'

--change the values by update keyword (replace)

select movie_name, btrim(movie_name) as "new name" 
from movies;


select ltrim('  abc')
select rtrim('abc  ')
select btrim('  abc  ')

select trim('  ad c')
select trim('abc','a')


select strpos('world','rld')
select position('rld' in 'world') /*position & strpos differ 
only in syntax */

-- substring(col from n1 for n2) important
select substring(movie_name,3,8) from movies