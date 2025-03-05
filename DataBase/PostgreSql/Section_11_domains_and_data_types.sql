--domain

create domain addr varchar(150) not null

create domain phno int not null check(value>0)

create domain email varchar(100) not null 
check(value ~* '^[A-Za-z0-9. _%-]+@[A-Za-z0-9. -]+\\.')

create domain gender varchar(1) not null
check(value in('f','m'))


create table student(
	id serial primary key,
	name varchar(100),
	address addr,
	phone_no phno,
	email email,
	gender gender
)
alter table student 
drop column email

select * from student
insert into student(name,address,phone_no,gender)  
VALUES  
       ('Rahul Sharma', '123 Main St, Delhi', '98765', 'm')  


select typname 
from pg_catalog.pg_type join pg_catalog.pg_namespace
on pg_namespace.oid = pg_type.typnamespace
where typtype =' d' and nspname ='public'

drop domain 

drop domain phno
/* output:ERROR:  cannot drop type phno because other objects depend on it
column phone_no of table student depends on type phno */

drop domain phno cascade


--Type

create type addrr as(
	city varchar(100),
	country varchar(100)
)

create type invt_it as(
	name varchar(100),
	id int,
	price numeric
)

create type currency as enum('usd','eur','gbp')
drop type currency

create table production(
	id serial primary key,
	inventory invt_it,
	address addrr
)

insert into production(inventory,address)
values(row('pen','1','10'),row('newyork','us')),
(row('book','2','15'),row('london','uk')),
(row('phone','3','20'),row('paris','fr'))

select id,(inventory).name from production where (inventory).price>10

create type color as enum('red','orange','green')
select 'red'::color

alter type color add value 'blue' after 'green'

alter type color rename to colour

alter type colour rename value 'red' to 'reddish'

select enum_range(null::colour)

alter type colour add value 'brown' before 'orange'

alter table production add column prod_cl colour default 'brown'

select * from production