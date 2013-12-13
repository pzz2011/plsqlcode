/*
CH6.2 (USER-PREDEFINED EXP HANDLING)
Create  a  PL/SQL  block  that  declares  a  user-defined  exception  in  case  a  user 
updates  the  department  name  of  a  department  that  does  not  exist  (that  is,  by 
passing a department number that does not exist in the table).
Program developed as part of my training in Oracle 10g.
*/

DECLARE
    V_EP EXCEPTION;
BEGIN
  UPDATE DEPARTMENTS SET DEPARTMENT_NAME = 'NEW  IT' 
      WHERE DEPARTMENT_ID = 4000;
  RAISE V_EP;
  EXCEPTION WHEN V_EP THEN
      DBMS_OUTPUT.PUT_LINE('INVALID DEPT ID 4000  ' || SQLCODE || '--' || SQLERRM);
END;
/