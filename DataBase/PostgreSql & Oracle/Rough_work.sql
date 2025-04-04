create temp table cricket_ipl(j jsonb);

insert into cricket_ipl(j)
values 
(pg_read_file('D:\Dineshworkspace\ipl_json/335982.json')::jsonb);

select * from cricket_ipl