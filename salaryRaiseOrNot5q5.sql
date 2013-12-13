/*
CH5.5 (EMPLOYEES SALARY RAISE OR NOT)
Create a PL/SQL block that will retrieve the first name, job ID, and salary of 
employees belonging to department number 80. If thesalary is less than $10,000 
and if job ID is SA_REP then display the message “<First name> is due for a salary 
raise”, or else display the message “<First name> is not due for any salary raise” as 
shown below. 
Program developed as part of my training in Oracle 10g.
*/

set serverout on;
--select first_name,salary,job_id from employees where department_id = 80;
BEGIN  
     FOR C2 IN (select first_name,salary,job_id from employees where department_id = 80)     
     LOOP
          IF (C2.JOB_ID = 'SA_REP' AND C2.SALARY < 10000) THEN
             DBMS_OUTPUT.PUT_LINE(C2.first_name || ' is due for a Salary Raise');
          ELSE 
              DBMS_OUTPUT.PUT_LINE(C2.first_name || ' is NOT due for any Salary Raise');
          END IF;
      END LOOP;
END;
/
