---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 4
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
--
-- Write a SELECT statement to retrieve the custid and contactname columns from the 
-- Sales.Customers table and the orderid column from the Sales.Orders table. The statement 
-- should retrieve all rows from the Sales.Customers table.
--
-- Execute the written statement and compare the results that you got with the recommended 
--  result shown in the file 82 - Lab Exercise 4 - Task 1 Result.txt. 
--
-- Notice the values in the column orderid. Are there any missing values (marked as NULL)? Why? 
---------------------------------------------------------------------

select  * from sales.Customers --%% rows 91 
select  * from sales.orders --%% rows  830 

select c.custid ,  c.contactname  , o.orderid 
from sales.Customers as c 
LEFT OUTER JOIN sales.Orders as o 
ON c.custid =o.custid 
order by c.custid asc  --%%rows 832 

--Leer bien el texto : Dice : "The statement 
-- should retrieve all rows from the Sales.Customers table."
-- Esto quiere decir: El comando DEBE retornar todas las filas de la tabla Sales.Customers

--%%Pero tenemos que el total de sales.orders es 830 y la consulta anterior devuelve 832...eso quiere decir que algunos de los customers han sido agreragdos pero no tienen ninguna orden. 

select c.custid ,  c.contactname  , o.orderid 
from sales.Customers as c 
LEFT OUTER JOIN sales.Orders as o 
ON c.custid =o.custid 
where o.orderid is null 
order by c.custid asc  --%%rows 2


--%% Es lo mismo solo que cambiano las tablas de orden  y usando el RIGHT OUTER JOIN
select c.custid ,  c.contactname  , o.orderid 
from sales.orders as o
RIGHT OUTER JOIN sales.Customers  as c
ON o.custid =c.custid  
order by o.orderid 


