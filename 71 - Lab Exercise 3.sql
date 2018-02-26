---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 3
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- In order to better understand the needed tasks, you will first write a SELECT statement 
-- against the HR.Employees table showing the empid, lastname, firstname, title, and mgrid columns.
--
-- Execute the written statement and compare the results that you got with the recommended result 
-- shown in the file 72 - Lab Exercise 3 - Task 1 Result.txt. 
-- Notice the values in the 
-- mgrid column. The mgrid column is in a relationship with empid column. 
-- This is called a self-referencing relationship. 
---------------------------------------------------------------------

use tsql 

--%% Esta pidiendo un simple select para saber que hay en la tabla 
select  empid, lastname, firstname, title,  mgrid from hr.Employees 

--%% En la tabla de abajo vemos que el mgrid del item 1 esta nulo. Esto signiica que esta persona no tiene jefe 

--empid       lastname             firstname  title                          mgrid
------------- -------------------- ---------- ------------------------------ -----------
--1           Davis                Sara       CEO                            NULL
--2           Funk                 Don        Vice President, Sales          1
--3           Lew                  Judy       Sales Manager                  2
--...
--...
--...
--7           King                 Russell    Sales Representative           5
--8           Cameron              Maria      Sales Representative           3
--9           Dolgopyatova         Zoya       Sales Representative           5

--(9 row(s) affected)



---------------------------------------------------------------------
-- Task 2
-- 
-- Copy the SELECT statement from task 1 and modify it to include additional columns for 
-- the manager information (lastname, firstname) using a self-join. Assign the aliases 
-- mgrlastname and mgrfirstname, respectively, to distinguish the manager names from the employee names.
--
-- Execute the written statement and compare the results that you got with the recommended 
-- result shown in the file 73 - Lab Exercise 3 - Task 2 Result.txt. Notice the number of rows returned.
--
-- Is it mandatory to use table aliases when writing a statement with a self-join? Can you 
-- use a full source table name as alias? Please explain.
--
-- Why did you get fewer rows in the T-SQL statement under task 2 compared to task 1?
---------------------------------------------------------------------


select  e.empid, e.lastname, e.firstname, e.title,  e.mgrid , o.lastname as mgrlastname , o.firstname as mgrfirstname
from hr.Employees as e INNER JOIN hr.Employees as o
ON e.mgrid = o.empid 


--%% En la tabla de abajo solo aparecen 8 items, no 9...Es que no se esta mostrando al usuario que no tiene jefe

--empid       lastname             firstname  title                          mgrid       mgrlastname          mgrfirstname
------------- -------------------- ---------- ------------------------------ ----------- -------------------- ------------
--2           Funk                 Don        Vice President, Sales          1           Davis                Sara
--3           Lew                  Judy       Sales Manager                  2           Funk                 Don
--4           Peled                Yael       Sales Representative           3           Lew                  Judy
--5           Buck                 Sven       Sales Manager                  2           Funk                 Don
--6           Suurs                Paul       Sales Representative           5           Buck                 Sven
--7           King                 Russell    Sales Representative           5           Buck                 Sven
--8           Cameron              Maria      Sales Representative           3           Lew                  Judy
--9           Dolgopyatova         Zoya       Sales Representative           5           Buck                 Sven

--(8 row(s) affected)


-- ¿Pero como hacemos para mostrar a esta persona?


select e.empid , e.lastname, e.firstname  , 
o.lastname as 'Apellido Jefe' , o.firstname  as 'Nombre del jefe'
from hr.Employees  as e LEFT OUTER JOIN  hr.Employees as o 
on e.mgrid  = o.empid 
ORDER BY e.empid 

-- Y si solo quiero a este persona sin jefe:

select e.empid , e.lastname, e.firstname  , 
o.lastname as 'Apellido Jefe' , o.firstname  as 'Nombre del jefe'
from hr.Employees  as e LEFT OUTER JOIN  hr.Employees as o 
on e.mgrid  = o.empid 
where o.lastname is null
ORDER BY e.empid 


