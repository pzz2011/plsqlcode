/*
CH5.4 (EMPLOYEES NAMES & IT DEPT = 60)
Create a PL/SQL block to retrieve the list of employees (their first name and department number) 
working for the IT department (department ID is 60). 
Program developed as part of my training in Oracle 10g.
*/

set serverout on;
--select first_name,department_id from employees where department_id = 60;
BEGIN  
     FOR I IN (select first_name,department_id from employees where department_id = 60)     
     LOOP
          DBMS_OUTPUT.PUT_LINE('FIRST NAME ' || I.first_name || ' IN DEPARTMENT ' || I.department_id);
    END LOOP;
END;
/
