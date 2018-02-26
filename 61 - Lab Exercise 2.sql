---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 2
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
--
-- Execute the query exactly as written inside a query window and observe the result.
--
-- You get an error. What is the error message? Why do you think you got this error? 
---------------------------------------------------------------------

--%% Esta mal porque no tiene alias definido y ademas hay columnas ambiguas
SELECT 
	custid, contactname, orderid
FROM Sales.Customers  
INNER JOIN Sales.Orders ON Customers.custid = Orders.custid;

--%% Corregido. 
SELECT 
	c.custid, c.contactname, o.orderid
FROM Sales.Customers  as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid;



---------------------------------------------------------------------
-- Task 2
-- 
-- Notice that there are full source table names written as table aliases. 
--
-- Apply the needed changes to the SELECT statement so that it will run 
-- without an error. Test the changes by executing the T-SQL statement.
--
-- Observe and compare the results that you got with the recommended result shown in the 
-- file 62 - Lab Exercise 2 - Task 2 Result.txt. 
---------------------------------------------------------------------

USE TSQL 
SELECT 
	c.custid, c.contactname, o.orderid
FROM Sales.Customers  as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid; --%% rows 830
--%%igual que la task 1.


---------------------------------------------------------------------
-- Task 3
-- 
-- Copy the T-SQL statement from task 2 and modify it to use the table aliases 'C' for
--  the Sales.Custumers table and 'o' for the Sales.Orders table.
--
-- Execute the written statement and compare the results with the results in task 2.
--
-- Change the prefix of the columns in the SELECT statement with full source table names 
-- and execute the statement.
--
-- You get an error. Why?
--
-- Change the SELECT statement to use the table aliases written at the beginning of the task.
---------------------------------------------------------------------

SELECT 
	Customers.custid, Customers.contactname, Orders.orderid
FROM Sales.Customers  as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid;

--%% No se puede poner los nombres de las tablas originales porque ya se definiio un ALIAS para estos.
--%% O se usa el nombre de la tabla, sin alias general...o se usa el alias en todos lados. no puede mezcalrse este tipo de alias.

--%% lo correcto debe ser usar como abajo está indicado.
SELECT 
c.custid, c.contactname, o.orderid
FROM Sales.Customers  as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid;



---------------------------------------------------------------------
-- Task 4
-- 
-- Copy the T-SQL statement from task 3 and modify it to include three additional 
-- columns from the Sales.OrderDetails table: productid, qty, and unitprice.
--
-- Execute the written statement and compare the results that you got with the recommended 
-- result shown in the file 63 - Lab Exercise 2 - Task 4 Result.txt. 
---------------------------------------------------------------------

use tsql 

--%% Esto es la consulta original 
SELECT 
	c.custid, c.contactname, o.orderid ,d.productid , d.qty, 
d.unitprice FROM Sales.Customers  as c
INNER JOIN Sales.Orders as o ON c.custid = o.custid
INNER JOIN SALES.OrderDetails AS d on o.orderid  = d.orderid
--%% rows 2155
 
--%% Estamos añadiendo las columnas adicionales 
select  c. custid,c.contactname , o.orderid ,o.orderdate , oc.productid , oc.qty , oc.unitprice 
from sales.Customers  as c 
INNER JOIN sales.Orders  as o 
ON c.custid = o.custid 
INNER JOIN SALES.OrderDetails as oc 
ON o.orderid  = oc.orderid
order by c.custid asc  --%% rows 2155 

--%% Pero ¿cuantas filas deberia devolvere? El total de filas que tenga la tabla oredrdetails 
select  * from sales.OrderDetails --%% rows  2155 
