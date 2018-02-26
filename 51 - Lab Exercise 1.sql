---------------------------------------------------------------------
-- LAB 04
--
-- Exercise 1
---------------------------------------------------------------------

USE TSQL;
GO

---------------------------------------------------------------------
-- Task 1
-- 
-- Write a SELECT statement that will return the productname column from the 
-- Production.Products table (use table alias 'p') and the categoryname column from the 
-- Production.Categories table (use table alias 'c') using an inner join. 
--
-- Execute the written statement and compare the results that you got with the desired 
-- results shown in the file 52 - Lab Exercise 1 - Task 1 Result.txt.
--
-- Which column did you specify as a predicate in the ON clause of the join? Why?
--
-- Let us say that there is a new row in the Production.Categories table and this new 
-- product category does not have any products associated with it in the Production.Products table. 
-- Would this row be included in the result of the SELECT statement written in task 1? Please explain.
---------------------------------------------------------------------

select p.productname ,c.categoryname    
from Production.Products  as p 
JOIN Production.Categories as c 
on p.categoryid = c.categoryid --%% rows 77 


--%% Respecto a la pregunta, aunque añadieramos una nueva categoria, esta no apareceria porque no hemos agregado ningun producto con dicha categoria.

--%% Hagamos el ejemplo, añadamos una nueva categoria y luego hagamosun  conteo de productos por categoria

insert into Production.Categories(categoryname , description) values ('Peves', 'Nada')

select  * from Production.Categories 

select  c.categoryid, count(p.productid) as conteo 
from Production.Categories as c 
LEFT JOIN Production.Products as p 
on c.categoryid = p.categoryid 
group by c.categoryid 
order by c.categoryid  desc


/*  Categoria 9 = 0 rows 

categoryid	conteo
9	0
8	12
7	5
6	6
5	7
4	10
3	13
2	12
1	12

*/
