show datestyle

select current_date

select to_date('13-11-2003','DD-MM-YYYY')

select to_date('13112003','yyyyddmm')

select To_date('dec 08 24','mon dd yy')

select to_timestamp('11 08 2003 12:24:24','dd mm yyyy HH:MI:SS')

select * from movies

select movie_name,release_date,
to_char(release_date::date,'ddth month yyyy') as "Date"
from  movies


select make_date(2003,12,11)

select make_time(11,12,03)

select make_interval(2000,12,1,30)

select * from pg_timezone_names

select movie_name,
extract(year from release_date) as "Year"
from movies --- extract keyword

--date_part as same extract

select movie_name,
date_part('year',release_date) as "Year"
from movies

select movie_name,release_date,
(release_date+10) as "New date"
from movies

--overlap

select (date '2023-02-22',date '2025-03-12') overlaps
('2025-11-13','2025-12-17')

--function to note
select current_date,current_time,current_timestamp(6)

--postgresql fuctions

select now()

select timeofday()

--age function

select age(now(),'2003-05-24')

--date_trunc
select date_trunc('minutes',current_timestamp) as "Minutes"
--"2025-03-10 23:33:00+05:30"

select date_trunc('hour',current_timestamp) as "hour"
--"2025-03-10 23:00:00+05:30"