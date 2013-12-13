/*
CH5.3 (TOP 10 SALARIES TOPEARNERS)
Create a PL/SQL block that will determine the top 10 earners of the organization. The block should: 
1>Gather the salaries of the top 10 earners within a loop. Ensure that salaries are not duplicated. 
2>Store the salaries gathered in the TopEarnerstable.

Program developed as part of my training in Oracle 10g.
*/
set serverout on;
--select ESAL from (select DISTINCT(esal) from s_emp order by esal desc) where rownum <= 10;
DECLARE
   CURSOR C1 IS select ESAL from (select DISTINCT(esal)  from s_emp order by esal desc) where rownum <= 10;     
   C2 C1%ROWTYPE;
BEGIN
   OPEN C1;
   LOOP
	  FETCH C1 INTO C2;
	  EXIT WHEN C1%NOTFOUND; 
	  DBMS_OUTPUT.PUT_LINE(' TOP Salaries ' || C2.ESAL);
   END LOOP;
   CLOSE C1;
END;
/

desc s_emp;