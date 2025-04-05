CREATE OR REPLACE FUNCTION get_avg_sal (p_dept_id departments.department_id%type) RETURN number AS 
v_avg_sal number;
BEGIN
  select avg(salary) into v_avg_sal from employees where department_id = p_dept_id;
  RETURN v_avg_sal;
END get_avg_sal;



declare
  v_avg_salary number;
begin
  v_avg_salary := get_avg_sal(50);
  dbms_output.put_line(v_avg_salary);
end;


select employee_id,first_name,salary,department_id,get_avg_sal(department_id) avg_sal from employees;


select get_avg_sal(department_id) from employees
where salary > get_avg_sal(department_id)
group by get_avg_sal(department_id) 
order by get_avg_sal(department_id);



drop function get_avg_sal;
