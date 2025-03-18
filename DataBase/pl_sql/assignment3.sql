select * from countries
set serveroutput on

declare
begin 
dbms_output.put_line('hi');
end;

declare
v_number number := 100;
begin
    if v_number<40
    then
        dbms_output.put_line('True');
    elsif v_number>40 and v_number<70
    then
        dbms_output.put_line('The middle number');
    else
        dbms_output.put_line('False');
    end if;
end;

declare 
    v_char varchar(10) := 'c';
    v_int number;
begin
    v_int:=case v_char
    when 'a' then
        10
    when 'b' then
       20
    else 
        0
    end;
    dbms_output.put_line('value: '||v_int);
end;

declare 
    v_char varchar(10) := 'b';
    v_int number;
begin
    case v_char
    when 'a' then
        v_int:=10;
    when 'b' then
       v_int:=20;
    else 
        v_int:=0;
    end case;
    dbms_output.put_line('value: '||v_int);
end;


DECLARE
  v_job_code        VARCHAR2(10) := 'IT_PROG';
  v_department      VARCHAR2(10) := 'IT';
  v_salary_increase NUMBER;
BEGIN
  v_salary_increase:=CASE
                      WHEN v_job_code   = 'SA_MAN' THEN 0.2
                      WHEN v_department = 'IT' AND v_job_code = 'IT_PROG' THEN 0.3
                     ELSE 0
                     END;
  dbms_output.put_line('Your salary increase is : '|| v_salary_increase);
END;
        
--loop

declare
v_int number :=0;
begin
    loop
        v_int:=1+v_int;
        dbms_output.put_line(v_int);
        exit when v_int>5;
    end loop;
end;

--while loopl

declare
v_int number :=0;
begin
    while v_int < 4 
    loop
        v_int:=1+v_int;
        dbms_output.put_line(v_int);
    end loop;
end;

--for loop

declare
v_int number :=0;
begin
    for i in 0 .. 5 
    loop
        v_int:=i+v_int;
        dbms_output.put_line(v_int);
    end loop;
end;

declare
v_int number :=0;
begin
    for i in reverse 0 .. 5 
    loop
        v_int:=i+v_int;
        dbms_output.put_line(v_int|| '  '|| i );
    end loop;
end;

--continue
declare
v_int number :=0;
begin
    for i in 0 .. 5 
    loop
        v_int:=i+v_int;
        continue when i=3;
        dbms_output.put_line(v_int|| '  '|| i );
    end loop;
end;


declare
   v_int number:=12;
   c_check boolean;
begin
    for i in 2..v_int/2 loop
        if mod(v_int,i)=0 then
            c_check:=True;
            dbms_output.put_line('prime number');
            goto end_statement;
        end if;
    end loop;
<<end_statement>>
if c_check then
    dbms_output.put_line('prime number');
end if;
end;

select * from employees 
select employee_id from employees
select first_name,salary from employees where employee_id=100
set serveroutput on

declare 
 f_name varchar2(50);
 sal employees.salary%type;
begin
    select first_name,salary into f_name,sal from employees 
    where employee_id=120;
    dbms_output.put_line('The name is ' || f_name ||'  and the salary is '|| sal);
end;

