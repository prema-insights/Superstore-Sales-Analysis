USE Sales_Analysis;
--create table
CREATE TABLE Orders
(
   Row_ID INT,
   Order_ID VARCHAR(50),
   Order_Date DATE,
   Ship_Date DATE,
   Ship_Mode VARCHAR(50),
   Customer_ID VARCHAR(50),
   Customer_Name VARCHAR(100),
   Segment VARCHAR(50),
   Country VARCHAR(50),
   City VARCHAR(50),
   State VARCHAR(50),
   Postal_Code INT,
   Region VARCHAR(50),
   Product_ID VARCHAR(50),
   Category VARCHAR(50),
   Sub_Category VARCHAR(50),
   Product_Name VARCHAR(200),
   Sales DECIMAL(10,2),
   Quantity INT,
   Discount DECIMAL(5,2),
   Profit DECIMAL(10,2)
   );
   SELECT TOP 10* FROM Orders;
   SELECT COUNT(*) AS Total_Rows FROM Orders;
   SELECT TOP 5* FROM Orders;
   --1.Total Orders:
   SELECT COUNT(*) AS Total_Orders FROM Orders;
   --2.Total Sales:
   SELECT SUM(Sales) AS Total_Sales FROM Orders;
   --3.Total Profit:
   SELECT SUM(Profit) AS Total_Profit FROM Orders;
   --4.Average Order Value:
   SELECT CAST (ROUND(AVG(Sales),2) AS DECIMAL(10,2)) AS Average_Order_Value FROM Orders;
   --5.Total Quantity sold:
   SELECT SUM(Quantity) AS Total_Quantity FROM Orders;
   --6.Average Discount:
   SELECT CAST(ROUND(AVG(Discount)*100,2) AS DECIMAL(10,2)) AS Avg_Discount_Percent FROM Orders;
   --7.Profit Margin%:
   SELECT CAST(ROUND((SUM(Profit)/SUM(Sales))*100,2) AS DECIMAL(10,2)) AS Profit_Margin_Percent FROM Orders;
   --8.Total Customers:
   SELECT COUNT(DISTINCT Customer_id) AS Total_Customer FROM Orders;
   --9.Total Products:
   SELECT COUNT(DISTINCT Product_ID) AS Total_Products FROM Orders;
   --10.Average Sales Per Order:
   SELECT CAST(ROUND(SUM(Sales)/COUNT(DISTINCT Order_ID),2) AS DECIMAL(10,2)) AS Avg_Sales_Per_Order
   FROM Orders;
   --Sales Analysis
   --1.Sales by Category:
   SELECT Category, ROUND(SUM(Sales),2) AS Total_Sales
   FROM Orders
   GROUP BY Category
   ORDER BY Total_Sales DESC;
 --2.Sales by Sub-Category;
   SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
   FROM orders
   GROUP BY sub_category
   ORDER BY total_sales DESC;
 --3.Sales by Region;
 SELECT
 Region, ROUND(SUM(Sales),2) AS Total_Sales
 FROM Orders
 GROUP BY  Region
 ORDER BY Total_sales DESC;
 --4.Sales by state:
 SELECT
 State, ROUND(SUM(Sales),2)AS Total_Sales
 FROM Orders
 GROUP BY State
 ORDER BY Total_Sales DESC;
 --5.Top 10 Cities by Sales:
 SELECT TOP 10
 City,
 SUM(Sales) AS Total_Sales
 FROM Orders
 GROUP BY City 
 ORDER BY Total_Sales DESC;
 --6.Sales by segment:
 SELECT
 Segment,
 ROUND(SUM(Sales),2) AS Total_Sales
 FROM Orders
 GROUP BY Segment
 ORDER BY Total_sales DESC;
 --7.Sales by Segment:
 SELECT
 Ship_Mode,
 ROUND(SUM(Sales),2) AS Total_Sales
 FROM Orders
 GROUP BY Ship_Mode
 ORDER BY Total_Sales DESC;
 --8.Top 10 Products by sales;
 SELECT TOP 10
 Product_Name,
 SUM(Sales) AS Total_Sales
 FROM Orders 
 GROUP BY Product_Name
 ORDER BY Total_Sales DESC;
 
 --9.Bottom 10 products by sales:
 SELECT TOP 10
 Product_Name, 
 SUM(Sales) AS Total_Sales
 FROM Orders
 GROUP BY Product_Name
 ORDER BY Total_Sales ASC;
 --10.Average sales per category:
 SELECT
 Category,
 CAST(ROUND(AVG(Sales),2) AS DECIMAL(10,2)) AS Avg_Sales
 FROM Orders
 GROUP BY Category
 ORDER BY Avg_Sales DESC;

 --Customer Analysis
 --1.Total Customers:
 SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers 
 FROM Orders;
 --2.Top 10 Customers by Sales:
 SELECT TOP 10
 Customer_ID,Customer_Name,
 SUM(Sales) AS Total_Sales
 FROM Orders
 GROUP BY Customer_ID, Customer_Name
 ORDER BY Total_Sales DESC;
 --3.Top 10 Customers by Profit:
 SELECT TOP 10
 Customer_ID, Customer_Name,
 SUM(Profit) AS Total_Profit
 FROM Orders
 GROUP BY Customer_ID, Customer_Name
 ORDER BY Total_Profit DESC;
 --4.Customers with Highest Number of Orders:
 SELECT TOP 10
 Customer_ID, Customer_Name,
 COUNT(Order_ID) AS Total_Orders
 FROM Orders
 GROUP BY Customer_ID, Customer_Name
 ORDER BY Total_Orders DESC;
 --5.Sales by Customer Segment:
 SELECT
 Segment,
 ROUND(SUM(Sales),2) AS Total_Sales,
 ROUND(SUM(Profit),2) AS Total_Profit
 FROM Orders
 GROUP BY Segment
 ORDER BY Total_Sales DESC;
 --6.Average Sales Per Customer:
 SELECT
 Customer_ID,
 Customer_Name,
 AVG(Sales) AS Avg_Sales
 FROM Orders
 GROUP BY Customer_ID, Customer_Name
 ORDER BY Avg_Sales DESC;
 --7.Repeat Customers:
 SELECT
 Customer_ID, Customer_Name,
 COUNT(DISTINCT Order_ID) AS Orders_Count
 FROM Orders
 GROUP BY Customer_ID, Customer_Name
 ORDER BY  Orders_Count DESC;



 


