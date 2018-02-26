--  Demonstration C

--  Step 1: Open a new query window to the AdventureWorks database
USE AdventureWorks;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to show only matching customers and orders
SELECT c.CustomerID, soh.SalesOrderID
FROM Sales.Customer c JOIN Sales.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID;

--%%  Esta ok, porque el numero de filas de SALESORDERHEADER es 31465

-- %%Portanto una conjunto de datos que quiera ese nivel de detalle

--%% devolver todas las filas. devolver menos, en la consulta actual seria un error.

--%% ya que indicaria que algunas Cabeceras de orden de venta no tienen cliente

--%% lo que implica ya un error en la base de datos y sus controles para evitar blancos o registros incompletos.
-- (31465 row(s) affected)



-- Step 3: Join 2 tables
-- Select and execute the following query
-- to show all customers and any matching orders


select  *from sales.Customer --%% rows 19,820

SELECT c.CustomerID ,soh.SalesOrderID
FROM Sales.Customer c LEFT OUTER JOIN Sales.SalesOrderHeader soh
ON c.CustomerID = soh.CustomerID;
-- (32166 row(s) affected)

--%% Explicacion del ejercicio STEP 3
--%% Queremos hallar cuantos de nuestros clientes no han hecho ninguna orden. Para esto debemso usar OUTER ya que nos permite mantener la tabla de la IZQUIERDA,

--%% aunque no tenga relacion alguna con latabla de la DERECHA. El resultado es que los primeros customers(del 1 al 701 no tenemos venta alguna)

--%% Estas tablas las uso para comprobar cuantos datos tengo en cada tabla de manera iondividual

--%% Porque si tengo 19,8200 customers, tengo 32,166 filas...Simple, porque cada customers puede haber hecho varias ordenes y por tanto es una relación de uno a muchos.


-- Step 4: Join 2 tables
-- Select and execute the following query to show
-- a left outer join
USE TSQL;
GO
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT OUTER JOIN Sales.Orders AS o
ON c.custid =o.custid; --%% rows 91 

select distinct(c.custid) , count(o.orderid) as [Numero de ordenes]
from sales.customers as c JOIN SALES.ORDERS as o 
on c.custid = o.custid  
group by c.custid 
order by c.custid--%% rows 89 

--%% Pero son 91 customers ? porque 3 customers no han aparecido?
-- Porqueestamos uniendo , pero debems usar el LEFT OUTER JOIN 

select distinct(c.custid) , count(o.orderid) as [Numero de ordenes]
from sales.customers as c LEFT OUTER JOIN SALES.ORDERS as o 
on c.custid = o.custid  
group by c.custid 
order by [Numero de ordenes] --%% rows 91 
--%% Ahora tenemso a los 91 customers, donde dos de estos no tienen orden alguna emitida.


-- Step 5: Join 2 tables
-- Select and execute the following query to
-- show customers without orders
USE TSQL;
GO
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT OUTER JOIN Sales.Orders AS o
ON c.custid =o.custid
WHERE o.orderid IS NULL;

--%%Vamos a llamar a todos los customers.
--%%Luego de eso vamos a usar el LEFT OUTER JOIN
--%%Luego de esto, que tenemos a todos, incluso a aquellos que no tengan orden alguna
--%%hacemos un filtro where a los que tengan orderid NULL. Resultado = 2rows.

select distinct(c.custid), count(o.orderid) as conteo   
from sales.Customers AS c 
LEFT OUTER JOIN SALES.Orders AS o
ON c.custid = o.custid 
where o.orderid is null 
group by c.custid 
order by conteo asc  --%% solo dos rows 


-- Step 6: Join 2 tables
-- Select and execute the following query to
-- show a right outer join
USE TSQL;
GO
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
RIGHT OUTER JOIN Sales.Orders AS o
ON c.custid =o.custid order by custid ;

--%% En este caso, la consulta es igual a la de arriba, solo que ahora vamos 
--%% a buscar todos las ordenes y colocar los customers que tengan.
--%% En este caso tenemos 830 filas, es decir todos. 
--%% Porque? Porque es imposible por restricciones que exista orderid sin custid. Entonces no va ha haber ningun NULL.


-- Step 7: Join 2 tables
-- Select and execute the following query
-- to show orders without customers

--%% Esta consulta es la comproabci�n del query anteorior.
--%% El resultado, ninguno obviamente �Porque?
--%% Porque no puede existir orden sin customer.

USE TSQL;
GO
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
RIGHT OUTER JOIN Sales.Orders AS o
ON c.custid =o.custid
WHERE c.custid IS NULL;