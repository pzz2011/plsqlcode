/*
CH4.1
Create a PL/SQL block to display the information about a given job, say ‘ST_CLERK’.
1>Use a PL/SQL record, which is based on the structure of the Jobs table. 
2>Print the information about the job using DBMS_OUTPUT.PUT_LINE
Program developed as part of my training in Oracle 10g.
*/
set serveroutput on;

DECLARE
       TYPE RT IS RECORD   
       ( V_ID JOBS.JOB_ID%TYPE,V_TITLE JOBS.JOB_TITLE%TYPE,
         V_SAL JOBS.MIN_SALARY%TYPE,V_MAXSAL JOBS.MAX_SALARY%TYPE );
       VAR_RT RT;
BEGIN
    SELECT JOB_ID,JOB_TITLE,MIN_SALARY,MAX_SALARY INTO VAR_RT FROM JOBS WHERE JOB_ID = 'ST_CLERK';
    DBMS_OUTPUT.PUT_LINE('JOB DETAILS --' || VAR_RT.V_ID || '-' || VAR_RT.V_TITLE || '-' || VAR_RT.V_SAL || '-' || VAR_RT.V_MAXSAL);
END;
/

desc jobs;
select * from jobs;