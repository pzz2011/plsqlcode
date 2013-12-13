/*
CH5.2 (FIRST 5 EMPLOYEES)
Create a PL/SQL block that will retrieve the first 5 employees one after the other.

Program developed as part of my training in Oracle 10g.
*/

set serverout on;
--select eid,esal,ename,rownum from (select * from s_emp order by esal desc) where rownum <= 5 ;
DECLARE
     CURSOR C1 IS select eid,esal,ename,rownum from (select * from s_emp order by esal desc) where rownum <= 5;
     C2 C1%ROWTYPE;
BEGIN
     OPEN C1;
     LOOP
         FETCH C1 INTO C2;
         EXIT WHEN C1%NOTFOUND; 
         DBMS_OUTPUT.PUT_LINE('Employee ' || C2.ENAME || '-' || C2.EID || ' Salaried ' || C2.ESAL);
     END LOOP;
     CLOSE C1;
END;
/

desc s_emp;