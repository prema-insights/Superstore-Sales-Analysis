USE Sales_Analysis;
--Top 10 customers by sales
SELECT TOP 10
   Customer_Name,
   SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
--Rank Customers by Sales
SELECT
    Customer_Name,
	SUM(Sales) AS Total_Sales,
	RANK() OVER(ORDER BY SUM(Sales)DESC) AS Sales_Rank
FROM Orders
GROUP BY Customer_Name;
--Dense Rank
SELECT
    Customer_Name,
	SUM(Sales) AS Total_Sales,
	DENSE_RANK()
	OVER(ORDER BY SUM(Sales) DESC) AS Dense_Rank
FROM Orders
GROUP BY Customer_Name;
--Row number
SELECT 
    Customer_Name,
	SUM(Sales) AS Total_Sales,
	ROW_NUMBER() OVER(ORDER BY SUM(Sales) DESC) AS Row_Num
FROM Orders
GROUP BY Customer_Name;
--Running Total(Cumulative Sales)
SELECT
    Order_Date,
	Sales,
	SUM(Sales) OVER(
	   ORDER BY Order_Date
	)AS Running_Total
FROM Orders;
--Average Sales
SELECT
    Customer_Name,
	Sales,
	AVG(Sales) OVER() AS Average_Sales
FROM Orders;
--Highest Profit Product
SELECT TOP 10
    Product_Name, SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Product_name
ORDER BY Total_Profit DESC;
--Lowest Profit Products
SELECT TOP 10
    Product_Name,
	SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY Product_Name
ORDER BY Total_Profit ASC;
--Sales Contribution%
SELECT
    Category,
	SUM(Sales) AS Category_Sales,
	ROUND(
	   SUM(Sales)*100.0/
	   SUM(SUM(Sales)) OVER(),
	   2
	)AS Sales_Percentage
FROM Orders
GROUP BY Category;
--Top 5 Products in Each Category
WITH ProductSales AS
(
   SELECT 
      Category,
	  Product_Name, SUM(Sales) AS Total_Sales,
	  ROW_NUMBER() OVER(
	     PARTITION BY Category
		 ORDER BY SUM(SALES) DESC
	  )AS RN
	FROM Orders
	GROUP BY Category, Product_Name
)
SELECT*
FROM ProductSales 
WHERE RN<=5;
--Previous Order Sales(LAG)
SELECT
 Order_Date,
 Sales,
 LAG(Sales,1,0) 
 OVER(ORDER BY Order_Date) AS Previous_Sales
FROM Orders;
--Next Order Sales(LEAD)
SELECT
   Order_Date,
   Sales,
   LEAD(Sales) 
   OVER(ORDER BY Order_Date) AS Next_Sales
FROM Orders;
--Customer Lifetime value(CLV)
SELECT
    Customer_Name,
	COUNT(Order_ID) AS Total_Orders,
	SUM(Sales) AS Lifetime_Value,
	AVG(Sales) AS Avg_Order_Value
FROM Orders
GROUP BY Customer_Name
ORDER BY Total_Orders DESC;
--Repeat Customers
SELECT
    Customer_Name,
	COUNT(DISTINCT Order_ID) AS Total_Orders
FROM Orders
GROUP BY Customer_Name
HAVING COUNT(DISTINCT Order_ID)>1
ORDER BY Total_Orders DESC;
--Profit Margin
SELECT
    Category,
	SUM(Sales) AS Total_Sales,
	sum(Profit) AS Total_Profit,
	ROUND(
	   (SUM(Profit)*100.0)/SUM(Sales),
	   2
	)AS Profit_Margin_Percentage
FROM Orders
GROUP BY Category;
