USE Sales_Analysis;
--Product Analysis
--1.Total Products:
SELECT COUNT(DISTINCT Product_ID) AS Total_Products
FROM Orders;
--2.Top 10 Products by Sales:
SELECT TOP 10
Product_ID,
Product_Name,
ROUND(SUM(Sales),2) AS Total_Sales
FROM Orders
GROUP BY Product_ID, Product_Name
ORDER BY Total_Sales DESC;
--3.Top 10 Products by profit:
SELECT TOP 10
Product_ID,
Product_Name,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Orders
GROUP BY Product_ID, Product_Name
ORDER BY Total_Profit DESC;
--4.Bottom 10 Products by Profit:
SELECT TOP 10
Product_ID,
Product_Name,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Orders
GROUP BY Product_ID, Product_Name
ORDER BY Total_Profit ASC;
--5.Top 10 Products by Quantity sold:
SELECT TOP 10
Product_ID,
Product_Name,
SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Product_ID, Product_Name
ORDER BY Total_Quantity DESC;
--6.Sales by Category:
SELECT 
Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Orders
GROUP BY Category 
ORDER BY Total_Sales DESC;
--7.Sales by Sub-Category:
SELECT
Sub_Category,
ROUND(SUM(Sales),2) AS Total_Sales,
ROUND(SUM(Profit),2) AS Total_Profit
FROM Orders
GROUP BY Sub_Category
ORDER BY Total_Sales DESC;
--8.Average sales Per Product
SELECT 
 Product_ID,
 Product_Name,
 CAST(ROUND(AVG(Sales),2) AS DECIMAL(10,2)) AS Avg_Sales
 FROM Orders
 GROUP BY Product_ID, Product_Name
 ORDER BY Avg_Sales DESC;
 --9.Products with Highest Discount:
 SELECT TOP 10
    Product_ID,
    Product_Name,
    MAX(Discount) AS Max_Discount
FROM Orders
GROUP BY Product_ID, Product_Name
ORDER BY Max_Discount DESC;
--10.Category-wise Quantity Sold:
SELECT
Category,
SUM(Quantity) AS Total_Quantity
FROM Orders
GROUP BY Category
ORDER BY Total_Quantity DESC;
--11.Sub_Category wise Quantity Sold:
SELECT
Sub_Category,
SUM(Quantity)AS Total_Quantity
FROM Orders
GROUP BY Sub_Category
ORDER BY Total_Quantity DESC;
--12.Average Profit by Category:
SELECT
Category,
ROUND(AVG(Profit),2) AS Avg_Profit
FROM Orders
GROUP BY Category
ORDER BY Avg_Profit DESC;
--13.Average Discount by Category:
SELECT 
Category,
CAST(ROUND(AVG(Discount),2)AS DECIMAL(10,2)) AS Avg_Discount
FROM Orders 
GROUP BY Category
ORDER BY Avg_Discount DESC;
--14.Products sold in each Category:
SELECT
Category,
COUNT(DISTINCT Product_ID) AS Product_Count
FROM Orders
GROUP BY Category
ORDER BY Product_Count DESC;
--15.Top selling Product in each Category
WITH ProductSales AS
(
    SELECT
        Category,
        Product_Name,
        SUM(Sales) AS Total_Sales,
        RANK() OVER(PARTITION BY Category ORDER BY SUM(Sales) DESC) AS Rank_No
    FROM Orders
    GROUP BY Category, Product_Name
)
SELECT
    Category,
    Product_Name,
    Total_Sales
FROM ProductSales
WHERE Rank_No = 1;