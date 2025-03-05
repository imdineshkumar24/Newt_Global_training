SET SERVEROUTPUT ON;
DECLARE 
    v varchar2(20) := 2 + 25 * 3;
BEGIN
    dbms_output.put_line(v);
END;


SET SERVEROUTPUT ON;
DECLARE
    v_text varchar2(50) NOT NULL DEFAULT 'Hello';
    v_number1 number(5,2) := '5.42';
    v_number2 numeric(10,4) := '5.43289';
    v_DATE1 timestamp := systimestamp;
    v_DATE2 timestamp(9) WITH TIME ZONE := systimestamp;
    v_DATE3 interval day(4) to second (3) := '124 02:05:21.012 ';
    v_DATE4 interval year to month := '12-3';
BEGIN
    V_TEXT := 'PL/SQL' || 'Course';
    DBMS_OUTPUT.PUT_LINE(V_TEXT);
    DBMS_OUTPUT.PUT_LINE(v_number1);
    dbms_output.put_line(v_number2);
    DBMS_OUTPUT.PUT_LINE(v_DATE1);
    DBMS_OUTPUT.PUT_LINE(v_DATE2);
    DBMS_OUTPUT.PUT_LINE(v_DATE3);
    DBMS_OUTPUT.PUT_LINE(v_DATE4);
    END;
    
DECLARE
    v_boolean boolean := false;
BEGIN
    dbms_output.put_line(sys.diutil.bool_to_int(v_boolean));
END;