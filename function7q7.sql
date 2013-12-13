/*
CH7.7
Create a function called fnAnnualIncthat returns the annual salary earned by accepting monthly salary and commission. 
The function should return an annual salary even if both the values passed are NULL. 
Annual salary is calculated as follows: (Salary * 12) + (Salary * Commission * 12) 
Use the function in a SELECT statement against the Employees table.
Program developed as part of my training in Oracle 10g.
*/
SET SERVEROUT ON;

CREATE OR REPLACE FUNCTION VTM_FUNC1(SAL NUMBER,COMM NUMBER)
RETURN NUMBER
IS
BEGIN
RETURN (NVL(SAL,0) * 12 + ( NVL(SAL,0) * NVL(COMM,0) * 12 ));
END;
/