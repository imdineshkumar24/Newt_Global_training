create table tags(
	tag_id serial,
	tags varchar(100) not null
)

insert into tags(tags) values('pen')
insert into tags(tags) values('') --Query returned successfully in 34 msec.
insert into tags(tags) values(null)
/* ERROR:  null value in column "tags" of relation "tags" violates not-null constraint
Failing row contains (3, null, null). */

alter table tags
add column person_name varchar(100) unique

select * from tags

insert into tags(tags,person_name) values('pencil','adam')

insert into tags(tags,person_name) values('pencil','adam')
/*ERROR:  duplicate key value violates unique constraint "tags_person_name_key"
Key (person_name)=(adam) already exists. */

insert into tags(tags,person_name) values('eraser','binny')

alter table tags
add column email varchar(100) 


alter table tags
add constraint unique_name unique (email)

--default

alter table tags
add column is_enable varchar(1) default 'Y'

alter table tags
alter column  is_enable set default  'n'

select * from tags

alter table tags
alter column is_enable drop  default

alter table tags
add column product_id serial primary key

alter table tags
drop constraint tags_pkey

alter table tags
drop column tag_id

alter table tags
add column tag_id serial primary key

alter table tags
add primary key (tag_id)  


create table t_grades(
	course_id varchar(100) not null,
	student_id varchar(100) not null,
	grade int not null,
	primary key(course_id,student_id)
)

select * from t_grades

insert into t_grades(course_id,student_id,grade) values
('math','s3',90)

alter table t_grades
drop constraint t_grades_pkey

alter table t_grades
add constraint c_s_id primary key(course_id,student_id)


create table t_products(
	p_id Serial primary key,
	p_name varchar(100) not null,
	s_id int
)

create table t_supply(
	s_id Serial primary key,
	s_name varchar(100) not null
)

insert into t_products(p_name,s_id)
values('computer','2'),('note','2'),('book','3')

delete from t_products where s_id=8

insert into t_supply(s_name)
values('roy'),('wood'),('brook'),('kyle')

select * from t_products

select * from t_supply

alter table t_products
add constraint f_key foreign key(s_id) 
references t_supply(s_id


select * from t_products natural join t_supply

--check

create table student(
	id serial primary key,
	name varchar(100) not null,
	age int check(age>17)
)


insert into student(name,age)values('dinesh',18),('ramesh',17)
/*ERROR:  new row for relation "student" violates check constraint "student_age_check"
Failing row contains (2, ramesh, 17). */

insert into student(name,age)values('dinesh',18),('ramesh',22)
select * from student

alter table student 
drop constraint student_age_check

alter  table student
add check(age>17)

alter table student 
add constraint age_chk
check(age>17 and  age<30)


alter table student
rename constraint student_age_check to student_age