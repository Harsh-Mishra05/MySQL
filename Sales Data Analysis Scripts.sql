use assignment;
create table Sales(
SalesID int not null,
ProductID int not null,
CustomerID int not null,
SaleDate Date ,
Quantity int not null,
UnitPrice int not null,
Region varchar(10));

select * from Sales;

insert into Sales(SalesID,ProductID,CustomerID,SaleDate,Quantity,UnitPrice,Region)
values
(1,101,1001,"2024-01-05",5,200,"North"),
(2,102,1002,"2024-01-10",10,150,"East"),
(3,103,1003,"2024-02-15",2,300,"North"),
(4,104,1001,"2024-02-20",7,250,"West"),
(5,101,1004,"2024-03-05",1,200,"East");


# 1. Write a query to calculate the total sales (Quantity * UnitPrice) for each product.
SELECT ProductID, SUM(Quantity * UnitPrice) AS "Total Sales"
FROM Sales
GROUP BY ProductID;

# 2. Write a query to find the total number of products sold in each region.
SELECT Region, SUM(Quantity) AS "Total Product Sold"
FROM Sales
GROUP  BY Region;

# 3. Write a query to get the average sales amount per product.
SELECT ProductID, AVG(Quantity * UnitPrice) As "Average Sales"
FROM Sales
GROUP BY ProductID;

# 4. Find the regions where total sales are more than 3000.
SELECT Region, SUM(Quantity * UnitPrice) AS "Total Sales"
FROM Sales
GROUP BY Region
HAVING SUM(Quantity * UnitPrice) > 3000;

# 5. Write a query to get the maximum quantity sold for each product.
SELECT ProductID, MAX(Quantity) AS "Max. Quantity Sold"
FROM Sales
GROUP BY ProductID;

# 6. Write a query to calculate the average quantity of products sold per region.
SELECT Region, AVG(Quantity) AS "Avg. Quantity Sold"
FROM Sales
GROUP BY Region;

# 7. Find the product IDs that have generated a total sales amount of more than 1000.  
SELECT ProductID, SUM(Quantity * UnitPrice) AS " Total Sales"
FROM Sales
GROUP BY ProductID
HAVING SUM(Quantity * UnitPrice) > 1000;

# 8. Write a query to get the total number of sales (rows) made for each customer. 
SELECT CustomerID, COUNT(*) AS "Total Sales"
FROM Sales
GROUP BY CustomerID;

# 9. Find the products for which the average quantity sold is less than 5. 
SELECT ProductID, AVG(Quantity) AS "Avg. Quantity Sold"
FROM Sales
GROUP BY ProductID
HAVING AVG(Quantity) < 5;

# 10. Write a query to find the sum of total sales for each customer in each region. 
SELECT CustomerID, Region, SUM(Quantity * UnitPrice) AS "Total Sales"
FROM Sales
GROUP BY CustomerID, Region;

# 11. Write a query to calculate the total sales for each month. 
SELECT MONTH(SaleDate) AS MONTH, SUM(Quantity * UnitPrice) AS "Total Sales"
FROM Sales
GROUP BY MONTH(SaleDate);

# 12. Find the regions where the average unit price is more than 200. 
SELECT Region, AVG(UnitPrice) AS "Avg. UnitPrice"
FROM Sales
GROUP BY Region
HAVING AVG(UnitPrice) > 200;

# 13. Write a query to get the minimum and maximum quantity sold per region.  
SELECT Region, MIN(Quantity) AS "Min. Quantity Sold", MAX(Quantity) AS "Max. Quantity Sold"
FROM Sales
Group By Region;

# 14. Find the customers who have made more than 2 purchases.  
SELECT CustomerID, COUNT(*) AS "No. OF Purchase"
FROM Sales
GROUP BY CustomerID
HAVING COUNT(*) > 2;

# 15. Write a query to find the total sales for each product and filter only those products where the total sales exceed 1500.  
SELECT ProductID, SUM(Quantity * UnitPrice) AS "Total Sales"
FROM Sales
GROUP BY ProductID
HAVING SUM(Quantity * UnitPrice) > 1500;

