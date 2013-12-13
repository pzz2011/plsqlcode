/*
CH7.2
Create a procedure called prRaiseSal, which increases the salary by 10% for 
the employee ID accepted as the input parameter. Invoke the procedure in 
iSQL*Plus with 110 as the employee ID. Prior to invoking the procedure, view the 
salary earned by employee 110. After the successfulexecution of the procedure, 
view the updated salary of employee 110.
Program developed as part of my training in Oracle 10g.
*/

set serverout on;

create or replace procedure vtm_prRaiseSal (EMPID  IN NUMBER)
is
  V_SAL EMPLOYEES.SALARY%TYPE;
begin
  SELECT SALARY INTO V_SAL FROM EMPLOYEES WHERE  EMPLOYEE_ID = EMPID;
  DBMS_OUTPUT.PUT_LINE('OLD SALARY ' || V_SAL);
  UPDATE EMPLOYEES SET SALARY = (SALARY + (V_SAL  * 0.10)) WHERE EMPLOYEE_ID  = EMPID;
  SELECT SALARY INTO V_SAL FROM EMPLOYEES WHERE  EMPLOYEE_ID = EMPID;
  DBMS_OUTPUT.PUT_LINE('NEW SALARY ' || V_SAL);
  ROLLBACK;
end;
/

EXEC vtm_prRaiseSal(110);