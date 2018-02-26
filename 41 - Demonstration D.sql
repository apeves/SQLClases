--  Demonstration D

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to display all employees with managers
-- and the manager's ID and name.

--%% En este caso se hace un self join. Estamos haciedo un join en dos campos diferentes de la misma tabla.
 SELECT e.empid ,e.lastname as empname,e.title,e.mgrid, m.lastname as mgrname
  FROM HR.Employees AS e
  JOIN HR.Employees AS m
  ON e.mgrid=m.empid;


select o.empid , e.lastname ,o.lastname  
from hr.Employees as e 
join hr.Employees as o
on  o.mgrid =e.empid
order by o.empid 



-- Step 3: Join 2 tables
-- Select and execute the following query
-- to display all employees 
-- and the manager's ID and name.
--%% Aca el mismo caso de arriba, solo que en este caso muestra el nombre del empleado que no tiene jefe, en este caso el CEO.  Para esto hacemos uso de LEFT OUTER JOIN 

  SELECT e.empid ,e.lastname as empname,e.title,e.mgrid, m.lastname as mgrname
  FROM HR.Employees AS e
  LEFT OUTER JOIN HR.Employees AS m
  ON e.mgrid=m.empid;
  
-- Step 4: Cross Join 2 tables
-- Select and execute the following query
-- to generate all combinations of first and last
-- names from the HR.Employees table

--%% Este es un cross join que al no existir clausula ON, simpelmente multiplica 9 -x 9 para obtener 81 filas como resultado. 
SELECT e1.firstname, e2.lastname
FROM HR.Employees AS e1 CROSS JOIN HR.Employees AS e2;