desc employees

select * from employees

set serveroutput on;

declare
    v_date employees.hire_date%type;
    --This is a single line comment
/* This is a 
    multi line
    comment */
    begin
        v_date:='21-09-25';
        dbms_output.put_line(v_date || ' '|| 'is a hiring date');
    end;
    
begin <<outer>>
DECLARE
  v_text  VARCHAR2(20) := 'Out-text';
BEGIN 
  DECLARE
    v_text  VARCHAR2(20) := 'In-text';
    v_inner VARCHAR2(30) := 'Inner Variable';
  BEGIN
    --dbms_output.put_line('inside -> ' || v_inner);
      dbms_output.put_line('inner -> ' || v_text);
      dbms_output.put_line('outer -> ' || outer.v_text);
  END;
  dbms_output.put_line(v_text);
END;
END outer;


set autoprint on;

variable var_text varchar(20);

variable n1 number(20);

declare 
    v_text varchar(20);
    begin
        :n1:=10;
        :var_text:= 'pl/sql';
        v_text := :var_text;
        dbms_output.put_line(v_text);
        dbms_output.put_line(:var_text);
    end;