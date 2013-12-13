/*
CH5.6 (PARAMETER PASSING THE SALARY)
Write a PL/SQL code to create a parameterized cursor, which will display the 
name  and  salary  of  all employees  from  the  Employees table  who  have  a  salary less 
than the specified value, which is passed as a parameter.
Program developed as part of my training in Oracle 10g.
*/

set serverout on;
set timing on;

--select first_name,salary from employees where salary < 5000;

DECLARE
   CURSOR C1(MONTHSAL NUMBER) IS select first_name,salary from employees where salary < MONTHSAL;
   C2 C1%ROWTYPE;
BEGIN
   OPEN C1(&ESAL);
   --WHILE (C1%FOUND) 
   LOOP
      FETCH C1 INTO C2;
      EXIT WHEN C1%NOTFOUND;
      DBMS_OUTPUT.PUT_LINE('First name - ' || C2.FIRST_NAME || ' with salary -' || C2.SALARY);
   END LOOP;
   CLOSE C1;
END;
/