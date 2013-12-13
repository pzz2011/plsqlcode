/*
CH5.7 (DEPARTMENTS WITH RESPECTIVE EMPLOYEES)
Create a PL/SQL block that will retrieve the department ID and department 
name of departments whose ID is less than 80. Pass the department IDs retrieved as 
parameters to another cursor that would retrieve the first name, hire date, job ID 
and salary of employees belonging to that department and whose employee ID is 
less than 130.
Program developed as part of my training in Oracle 10g.
*/
set serverout on;
set timing on;
--DESC DEPARTMENTS;
--DESC EMPLOYEES;
--select department_id,department_name from departments where department_id < 80;
--select first_name,hire_date,salary,job_id,DEPARTMENT_ID from employees where employee_id <130 and  department_id < 80;
DECLARE
   CURSOR C1 IS select department_id,department_name from departments where department_id < 80;
   CURSOR C2(DEPTID NUMBER) IS select first_name,job_id,hire_date,salary from employees where employee_id < 130 and department_id = DEPTID;
   VC_DEPT C1%ROWTYPE;
   VC_EMP C2%ROWTYPE;
BEGIN
	OPEN C1;
	LOOP 
	   FETCH C1 INTO VC_DEPT;
	   EXIT WHEN C1%NOTFOUND;
	       DBMS_OUTPUT.PUT_LINE('Dept No: ' || VC_DEPT.department_id || ' Department name: ' || VC_DEPT.department_name);
	       OPEN C2(VC_DEPT.department_id);
	       LOOP
	         FETCH C2 INTO VC_EMP;
	         EXIT WHEN C2%NOTFOUND;
	         	DBMS_OUTPUT.PUT_LINE('Name: ' || VC_EMP.first_name||' Job: ' || VC_EMP.job_id || ' Hired on: ' || VC_EMP.hire_date || ' earns: ' || VC_EMP.salary);
	         END LOOP;
	         CLOSE C2;                  
	END LOOP;
	CLOSE C1;
END;
/