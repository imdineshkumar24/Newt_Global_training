SELECT * FROM pg_catalog.pg_tables WHERE schemaname='public';

select * from  customers

select * from  orders

select c.customer_id,c.company_name,o.order_date 
from customers c inner join orders o 
on o.customer_id=c.customer_id

select *
from customers c inner join orders o 
on o.customer_id=c.customer_id
where country = 'France'

--using
select *
from customers c inner join orders o 
using(customer_id)
where country = 'France'


select * from movies
select * from directors
select * from movie_revenues;

select mv.movie_name,
concat(d.first_name,' ',last_name) as "Director Name",
mr.revenue_domestic
from  movies mv inner join movie_revenues mr
on mv.movie_id=mr.movie_id inner join directors d
on d.director_id=mv.director_id
where mv.movie_lang='Japanese'

select mv.movie_name,
concat(d.first_name,' ',last_name) as "Director Name",
mr.revenue_domestic
from  movies mv inner join movie_revenues mr
on mv.movie_id=mr.movie_id inner join directors d
on d.director_id=mv.director_id
order by 3 desc nulls last 
limit 5


select * from movies m full  join directors d
on m.director_id=d.director_id


select d.first_name,d.last_name,
sum(mr.revenue_domestic+mr.revenue_international) "Total Revenue"
from directors d 
left join movies m on d.director_id=m.director_id 
left join movie_revenues mr on mr.movie_id=m.movie_id
group by d.first_name,d.last_name
having sum(mr.revenue_domestic+mr.revenue_international)>500
order by 3 desc nulls last



select d.first_name,d.last_name,count(m.movie_name) as "Count"
from movies m right join directors d 
on m.director_id=d.director_id
group by d.first_name,d.last_name
order by 3 desc


create table product1(
	p_id int primary key,
	p_name varchar(100)
)

create table product2(
	p_id int primary key,
	p_name varchar(100)
)

insert into product1(p_id,p_name)
values(1,'book'),(2,'computer')

insert into product2(p_id,p_name)
values(1,'book'),(2,'computer')

insert into product1(p_id,p_name)
values(3,'pencil'),(5,'laptop'),(6,'phone')

insert into product2(p_id,p_name)
values(4,'TV'),(5,'laptop'),(7,'Board'),(8,'System2')


select * from product1

select * from product2

select * from product1 p1 left join product2 p2
on p1.p_id=p2.p_id

select * from product1 p1 right join product2 p2
on p1.p_id=p2.p_id

select * from product1 p1 full join product2 p2
on p1.p_id=p2.p_id

select * from product1 p1 inner join product2 p2
on p1.p_id=p2.p_id -- self & inner join is same

select m1.movie_name,m2.movie_name,m1.movie_length
from movies m1
inner join movies m2 on m1.movie_length=m2.movie_length
where m1.movie_name<>m2.movie_name
order by 3

select * from product1 cross join product2

select * from product1 natural join product2

select * from product1 natural left join product2
select * from product1 natural right join product2

select coalesce(null,2)

insert into product1(p_id,p_name)
values(9,'book')

--combining queries
select * from product1 union (select * from product2) 

--with duplicates

select * from product1 union all(select * from product2)

--intersect

select * from product1 intersect (select * from product2) 


select * from actors
select * from directors

select first_name,last_name
from actors --148records
union
(select first_name ,last_name
from directors) -- 37 records
--total 183 records

select first_name,last_name from actors --148records
union all
(select first_name ,last_name from directors) -- 37 records
--total 185 records
order by first_name

select first_name,last_name from actors
intersect
(select first_name ,last_name from directors)

select first_name,last_name,'actors' as "tablename"
from actors --148records
union
(select first_name ,last_name,'directors' as "tablename"
from directors ) -- 37 records 
order by first_name

--total 183 records

select first_name,last_name
from actors where gender = 'M'
union
select first_name,last_name
from directors 
where nationality in ('American','French','Brithish')


--except
select * from product1 except select * from product2

select first_name,last_name
from actors 
except
select first_name,last_name
from directors order by first_name