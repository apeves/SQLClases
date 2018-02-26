---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 5
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
--
-- Execute the T-SQL code under Task 1. Do not worry if you do not understand the provided T-SQL code, 
-- as it is used here to provide a more realistic example for a cross join in the next task. 
---------------------------------------------------------------------
SET NOCOUNT ON;

IF OBJECT_ID('HR.Calendar') IS NOT NULL 
	DROP TABLE HR.Calendar;

CREATE TABLE HR.Calendar (
	calendardate DATE CONSTRAINT PK_Calendar PRIMARY KEY
);

DECLARE 
	@startdate DATE = DATEFROMPARTS(YEAR(SYSDATETIME()), 1, 1),
	@enddate DATE = DATEFROMPARTS(YEAR(SYSDATETIME()), 12, 31);

WHILE @startdate <= @enddate
BEGIN
	INSERT INTO HR.Calendar (calendardate)
	VALUES (@startdate);

	SET @startdate = DATEADD(DAY, 1, @startdate);
END;

SET NOCOUNT OFF;

GO
-- observe the HR.Calendar table : Estas todos los dias del aÑo.
SELECT 
	calendardate
FROM HR.Calendar;

---------------------------------------------------------------------
-- Task 2
-- 
-- Write a SELECT statement to retrieve the empid, firstname, and lastname columns from
-- the HR.Employees table and the calendardate column from the HR.Calendar table.
--
-- Execute the written statement and compare the results that you got with the recommended 
-- result shown in the file 92 - Lab Exercise 5 - Task 2 Result.txt. 
--
-- What is the number of rows returned by the query? There are nine rows in the HR.Employees table. 
-- Try to calculate the total number of rows in the HR.Calendar table.
---------------------------------------------------------------------

use tsql 

--%% Es un plano cartesiano sin ON, lo que resulta en la multpliación de las filas de cada tabla 
select e.empid, e.firstname, e.lastname  
from HR.Employees as e 
CROSS JOIN hr.Calendar as t  -- rows 3285 


select  count(*) from HR.Employees as e  --Rows 9 
select  count(*) from HR.Calendar  as e  --rows 365 

---------------------------------------------------------------------
-- Task 3
-- 
-- Execute the provided T-SQL statement to remove the HR.Calendar table.
---------------------------------------------------------------------

IF OBJECT_ID('HR.Calendar') IS NOT NULL 
	DROP TABLE HR.Calendar;

