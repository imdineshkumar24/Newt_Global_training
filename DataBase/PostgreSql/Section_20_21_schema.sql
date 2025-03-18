create schema sales

create schema hr

drop schema hr

alter schema sales rename to s_sales

select * from learningdatabase.public.customers

--important

alter table customers set schema s_sales

select * from learningdatabase.s_sales.customers

select * from employee

alter table learningdatabase.s_sales.customers
set schema public

select * from customers

select current_schema()

alter table customers set schema s_sales

select * from s_sales.customers

show search_path


set search_path to '$users',s_sales,public

show search_path

--show tables

select table_name from information_schema.columns
where table_Schema ='public'

--arrays & ranges
select array[current_date,current_date+5]

select array[1,2,3,4] = array[1,3,4]

select array[1,2,3,4] @> array[1,3,4]

select int4range(1,6)  @> int4range(2,3

select array[1,2,3] || array[3,4,5

select array_append(array[1,2,3],5)

select array_prepend(5,array[2,3,4])

select array_ndims(array[[1,2],[3,4]])
select array_ndims(array[1,2])

select array_lower(array[2,3,4],1)

select array_upper(array[2,3,4],1)

select array_length(array[1,2,3,5,-7],1)

--array search

select array_position(array['jan','feb','mar','apr'],'feb')

select array_position(array['jan','feb','mar','apr'],'may')
-- [null]

select array_position(array['jan','feb','mar','apr'],'feb',3)


select array_remove(array[1,2,3,4,4,5],4 --{1,2,3,5

select array_replace(array[1,4,3,4,4],4,10)--{1,10,3,10,10}

select array_replace(array[1,4,3,4,4],5,10) --{1,4,3,4,4}


--in,all,any

select 2 in (1,2,3,4)

select 5 in (1,2,3,4)

select 24> all(array[20,21,23,22,27])
select 24> all(array[20,21,23,22,17])

select 24> any(array[28,21,29,26,27])
select 24> any(array[28,31,29,26,27])

--some same as 

select 24> some(array[28,21,29,26,27])
select 24> some(array[28,31,29,26,27])


select string_to_array('1-2-3-4','-')

select string_To_array('1,2,3,4,5',',','4')

select array_to_string(array[1,2,3,null,5],'|','4')

SELECT * FROM pg_catalog.pg_tables
WHERE schemaname != 'pg_catalog' AND 
    schemaname != 'information_schema'

select * from table_array


create table table_array(
	id Serial primary key,
	arr int array
)

insert into table_array(arr) 
values(array[1,2,8,2]),(array[9,7,3,2])


select id,arr[6] from table_array

/*array dimensions will be ignored when initalize in 
creating a table and insert more values than dimensions
all values will be stored*/

select id ,unnest(arr) from table_array
--unnest

alter table table_array add column arr2d int [][]

select * from table_array

insert into table_array(arr,arr2d) 
values(array[8,2,8,2],array[[1,2],[3,4]])

insert into table_array(arr,arr2d) 
values(array[[8,8,8,5],[8,2,3,5]],array[3,4])