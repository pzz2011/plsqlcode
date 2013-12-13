/*
CH7.5
Create a procedure called prEmpRaiseSalthat invokes the prRaiseSal
procedure (created in Lab question 02). The procedure prEmpRaiseSalmust 
process all the records in the Employees table, andthen pass each employee ID to 
the procedure prRaiseSal.
Program developed as part of my training in Oracle 10g.
*/

set serverout on;

CREATE OR REPLACE PROCEDURE VTM_PREMPRAISESAL
IS
  CURSOR C1 IS select last_name,salary,employee_id from employees;
  C2 C1%ROWTYPE;
BEGIN
   OPEN C1;
   LOOP
      FETCH C1 INTO C2;
      EXIT WHEN C1%NOTFOUND;
         DBMS_OUTPUT.PUT_LINE('PROCESSING EMPLOYEE.... ' || C2.EMPLOYEE_ID);
         vtm_prRaiseSal(C2.EMPLOYEE_ID);
   END LOOP;
   CLOSE C1; 
END VTM_PREMPRAISESAL;
/

EXEC VTM_PREMPRAISESAL;