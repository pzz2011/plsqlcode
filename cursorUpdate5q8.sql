/*
CH5.8 (SALARY INCREASED BY 10% USING CURSOR UPDATE OF)
Create a PL/SQL block that will increase the salaryby 10% of employees 
whose salary is less than $7000 and who belong to department number 50. [Hint: 
Use FOR UPDATE and WHERE CURRENT OF clause].
Program developed as part of my training in Oracle 10g.
*/

set serverout on;
set timing on;

--select first_name,salary from employees where department_id = 50 and salary < 7000;

DECLARE
   CURSOR C1 IS 
            select first_name,salary from employees where department_id = 50 and salary < 7000
    FOR UPDATE OF salary NOWAIT;
   C2 C1%ROWTYPE;
BEGIN
   OPEN C1;
   LOOP
      FETCH C1 INTO C2;
      EXIT WHEN C1%NOTFOUND;
          DBMS_OUTPUT.PUT_LINE('About to update - ' || C2.FIRST_NAME || ' old salary ' || C2.SALARY);
          update employees set salary = (salary + (salary * 0.10)) where CURRENT OF C1;
   END LOOP;
   CLOSE C1;
END;
/
