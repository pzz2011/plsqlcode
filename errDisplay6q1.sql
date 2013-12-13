/*
CH6.1 (NON-PREDEFINED EXP HANDLING)
Create  a  PL/SQL  block  wherein  a  non-predefined  error  is  displayed  if  a  user 
attempts  to  delete  department  number  40.  This  is  because  the  department  has 
employees working in it. 
Program developed as part of my training in Oracle 10g.
*/

--SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID =  40;
--DESC DEPARTMENTS;

DECLARE
    V_EP EXCEPTION;
    PRAGMA EXCEPTION_INIT(V_EP,-2292);
BEGIN
  DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID =  40;
  EXCEPTION WHEN V_EP THEN
      DBMS_OUTPUT.PUT_LINE('DELETE DEPT 40 NOT  ALLOWED ' || SQLERRM);
END;
/
