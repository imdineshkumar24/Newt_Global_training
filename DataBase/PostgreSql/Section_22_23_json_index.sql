create table if not exists movie (
	id serial primary key,
	movie_info jsonb
)

select * from movie

insert into movie(movie_info)
values('{
	"name":"tenet",
	"dir":"nolan"
}')

insert into movie(movie_info)
values('{
	"name":"spider man",
	"dir":"sam raimi"
}'),
('{
	"name":"fast & furios",
	"dir":"justin"
}')

select movie_info -> 'dir' from movie

select movie_info ->> 'dir' from movie -- without quotes

select 
	movie_info->>'name' as "Movie name",
	movie_info ->> 'dir'  as "Director"
from movie

insert into movie(movie_info)
values('{
	"name":"Avengers endgame",
	"dir":"nolan"
}')

update movie
set movie_info=movie_info||'{"dir" : "russo brothers"}'
where movie_info->>'name'='Avengers endgame'

delete from movie
where movie_info->>'name'='tenet'

select * from products

select row_to_json(products) from products


select  row_to_json(product_info) from (
	select product_name,
	unit_price 
	from products
) as product_info


select  product_id,(select json_agg(product_info) from (
	select product_name,
	unit_price 
	from products
) as product_info) as "product info" from products



create index prod_name_index on products(product_name

select * from pg_indexes

--size of index
select pg_size_pretty(pg_indexes_size('products'))

select * from pg_stat_all_indexes
where relname='products'

drop index prod_name_index

drop index  products_pkey restrict

create index movie_movie_id_movie_name on  movies(movie_id,movie_name)

explain select movie_id from movies ;

explain select * from movies