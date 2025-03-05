CREATE TABLE person(
	id Serial,
	name varchar(100) not null
)

SELECT * from person

alter table person 
add column age int not null

alter table person
add column email varchar(100) unique,
add column nationality varchar(20) 

alter table person
rename to users

select * from users

alter table users
rename age to user_age

--change datatype
alter table users
alter column user_age type int using user_age::int

alter table users
add column is_enable varchar(1);

alter table users
alter column is_enable set default 'y';

insert into users(name,user_age,email,nationality)
values('dinesh','22','abc@gmail.com','ind')

select * from users


-- add constraints

create table table_web(
	id serial primary key,
	link_url varchar(100) unique,
	link_target varchar(100)
)

select * from table_web

insert into table_web(link_url,link_target)
values('https:google.com','blank')

/*output: ERROR:  duplicate key value violates unique constraint "table_web_link_url_key"
Key (link_url)=(https:google.com) already exists. */

insert into table_web(link_url,link_target)
values('https:amazon.com','blank')

select * from table_web

alter table table_web
add column is_enable varchar(2)

insert into table_web(link_url,link_target,is_enable)
values('https:airlight.com','blank','k')

alter table table_web
add check (is_enable in ('Y','N'))

insert into table_web(link_url,link_target,is_enable)
values('https:airlight.com','blank','k')

/* output: ERROR:  new row for relation "table_web" violates check constraint "table_web_is_enable_check"
Failing row contains (5, https:airlight.com, blank, k). */

update  table_web
set is_enable='n' --even it is case sensitive
where id ='1'

/* output: ERROR:  new row for relation "table_web" violates check constraint "table_web_is_enable_check"
Failing row contains (1, https:google.com, blank, n). */

update  table_web
set is_enable='N' 
where id ='1'


select * from table_web