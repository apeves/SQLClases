-- Demonstration A

-- Step 1: Open a new query window to the TSQL database
USE TSQL;
GO

-- Step 2: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-89 syntax
-- to join 2 tables
-- Point out that 830 rows are returned.

--%% SELECT simple con dos tablas con la sintaxis SQL-89 sin el uso de JOINS, a traves de un crossjoin y un campo en comun. Este tipo de consultas no son recomendables porque se prestan para errores de JOIN cruzados que devuelvan numerosas filas por error. 

SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c, Sales.Orders AS o
WHERE c.custid = o.custid; --&& rows : 830 

-- Step 3: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-89 syntax
-- omitting the WHERE clause and causing an inadvertent Cartesian join.
-- Point out that 75530 rows are returned.

--%% Lo que mencionaba en el punto1, aca se ha producido una union cartesiana inadvetida, que cruza todas las filas de una tabla contra todas las filas de la otra tabla 
SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c, Sales.Orders AS o;
--&& Rows 75530 ! Es un error !

-- Step 4: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-92 syntax
-- to join 2 tables
-- Point out that 830 rows are returned.

--%% Esto es una union cartesiana usando la sintaxis SQL-92 es decir a traves de un join que evita los errores cartesianos inadvertidos .
SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c JOIN Sales.Orders AS o
ON c.custid = o.custid;

-- Step 5: Join 2 tables
-- Select and execute the following query
-- to illustrate ANSI SQL-92 syntax.
-- Note that the ON clause is deliberately omitted
-- to cause an error, showing the protection
-- against accidental Cartesian products
--THIS WILL INTENTIONALLY CAUSE AN ERROR

--%% Aca , de manera intencional se ha incrustado un JOIN, pero no se le ha puesto su complemento , que es el ON, por lo que devuelve un error. Esto obliga a que siempre haya un enlace entre las dos tablas enlazadas, evitando de esta manera los errores. 
SELECT c.companyname, o.orderdate
FROM Sales.Customers AS c JOIN Sales.Orders AS o;
-- ON c.custid = o.custid
