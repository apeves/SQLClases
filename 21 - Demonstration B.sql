--  Demonstration B

--  Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to demonstrate a two-table inner join.
-- Point out that there are 77 rows output

--%%Un simple JOIN a dos tablas 
SELECT c.categoryid, c.categoryname, p.productid, p.productname
FROM Production.Categories AS c
JOIN Production.Products AS p
ON c.categoryid = p.categoryid;


-- Step 3: Join 2 tables
-- Select and execute the following query
-- to demonstrate a two-table inner composite join.
-- Point out that there are 27 rows output without a distinct filter

--%% Estamos haciendo uso de un ON compuesto.
--%% Solo se enlaza si ambas tablas contienen ambos campos.
SELECT e.city, e.country
FROM Sales.Customers AS c
JOIN HR.Employees AS e 
ON c.city = e.city AND c.country = e.country;

--%% Extra consulta ==========
-- Que hace esta consulta (igual a la de arriba)
-- Trata de hallar en que ciudades de nuestros clientes tenemos vendedores locales


--%% Aca mmostramos a todos nuestros clientes y cuantos vendedores tienen ha su disposicion cada uno de forma desplegada .
select  c.custid ,c.city ,e.firstname  
from sales.Customers as c 
JOIN hr.Employees  as e 
on c.city = e.city
order by c.custid 

/*   Por ejemplo, aca el custid =4 en Londres, tiene 4 vendedores a su disposicion.

4	London	Sven
4	London	Paul
4	London	Russell
4	London	Zoya
*/


--%% Aca tenemos lo mismo con un resumen.  Mostramos solo el pais y la ciudad sin mostrar a los customers. 

select  distinct(c.country), c.city from sales.customers as c
join hr.Employees as e on c.city = e.city and c.country = e.country

/* 
UK	London
USA	Kirkland
USA	Seattle
*/


-- Step 4: Join 2 tables
-- Select and execute the following query
-- to demonstrate a two-table inner composite join.
-- Point out that there are 3 rows output with a distinct filter

--%% Lo mismo que arriba. 
SELECT DISTINCT  e.city, e.country
FROM Sales.Customers AS c
JOIN HR.Employees AS e 
ON c.city = e.city AND c.country = e.country;


-- Step 5: Join multiples tables
-- Select and execute the following query
-- to demonstrate a two-table inner join.
-- Point out that the elements needed to add and display data
-- from a third table have been commented out to join
-- the first two tables only
-- 830 rows will be returned

--%% Este es un simple INNER JOIN de dos tablas como customers y las ordenes que han tenidio cada uno de estos.
SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c 
JOIN Sales.Orders AS o
ON c.custid = o.custid --rows 830


--%%  Ejercicio extra : En este conjunto de datos estamos usando trestablas. Las estamouns uniendo mediante JOIN.
-- Sigue la siguiente ruta : Queremos el customer , luego su orden y luego el detalle de esa orden
-- Con esto podemos llegar hasta el detalle del producto comprad y su cantidad respectiva.
--%% Tiene que salir obligatoriamente 2,15 filas ya que es el numero total de la tabla ORDERDETAILS. No podria ser diferente, ya que de serlo significaría que alguna fila no esta enlazada con ninguna orden en particular, lo cual sería un error .

SELECT c.custid, c.companyname, o.orderid, o.orderdate, od.productid, od.qty
FROM Sales.Customers AS c 
JOIN Sales.Orders AS o
ON c.custid = o.custid
JOIN Sales.OrderDetails od
ON o.orderid = od.orderid; --%% rows : 2,155
 
-- Step 6: Join 3 tables
-- Select and execute the following query
-- to demonstrate a three-table inner join.
-- 2155 rows will be returned. Why?

--%% Es igual que la consulta del SETP 5.
--%% Porque 2155 filas ? Por la tabla mas baja de las tres enlazadas es OrderDetails,
--%% la que tiene 2155 filas y por eso se vuelve obligartorio que muestre todas si estamos 

SELECT c.custid, c.companyname, o.orderid, o.orderdate, od.productid, od.qty
FROM Sales.Customers AS c 
JOIN Sales.Orders AS o
ON c.custid = o.custid
JOIN Sales.OrderDetails od
ON o.orderid = od.orderid;


