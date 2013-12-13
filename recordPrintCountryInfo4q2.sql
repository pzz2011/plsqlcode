/*
CH4.2
Write a PL/SQL block to print information about a given country using PL/SQL Record. 
a.  Use the DEFINE command to provide the country ID. Pass the value to the PL/SQL block through a iSQL*Plus substitution variable. 
SET SERVEROUTPUT ON 
SET VERIFY OFF 
DEFINE p_countryid=CA 
b.  Use DBMS_OUTPUT.PUT_LINE to print information about country details. 
C.  Execute and test the PL/SQL block for the countries with the Ids CA,DE,UK,US.
Program developed as part of my training in Oracle 10g.
*/
SET SERVEROUT ON;
SET VERIFY OFF;

DECLARE
      TYPE RT IS RECORD   
       ( V_ID COUNTRIES.COUNTRY_ID%TYPE,
         V_NAME COUNTRIES.COUNTRY_NAME%TYPE,
         V_RID COUNTRIES.REGION_ID%TYPE );
      VAR_RT RT;
      CID VARCHAR2(2) := '&COUNTRYID';
BEGIN
   SELECT * INTO VAR_RT FROM COUNTRIES WHERE COUNTRY_ID = CID;
   DBMS_OUTPUT.PUT_LINE('Country is ' || VAR_RT.V_NAME || ' in Region ' || VAR_RT.V_RID || ' having ID ' || VAR_RT.V_ID);
END;
/

DESC COUNTRIES;
SELECT * FROM COUNTRIES;