create sequence seq_text;

select nextval('seq_text')

select currval('seq_text')

select setval ('seq_txt',500)

select setval ('seq_text',200,true)


alter sequence seq_text restart with 500;

alter sequence seq_text rename to seq_txt

select currval('seq_txt')
select nextval('seq_txt')
alter sequence seq_txt increment -20
alter sequence seq_txt minvalue 200

alter sequence seq_txt maxvalue 600

/* ERROR:  nextval: reached maximum value of sequence "seq_txt" (600) */
select setval ('seq_txt',500)

alter sequence seq_txt maxvalue 800

alter sequence seq_txt restart with 600


create sequence seq_txt2;

drop sequence seq_txt2


create table users(
	id serial primary key,
	user_name varchar(50)
)

insert into users (user_name) values('ramesh')

alter sequence users_id_seq restart with 100


alter sequence users_id_seq rename to u_id_seq;

select * from users

alter sequence u_id_seq increment 20


--list all sequence

select relname sequence_name
from pg_class where relkind='S'


alter table users
add column l_id int default nextval('seq_txt')

--laphanumeric
alter table users
add column r_id text default ('R_ID' || nextval('seq_txt'))

select * from users


