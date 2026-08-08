USE Sales_Analysis;
--08_time_analysis:
--Sales by Year
SELECT
YEAR(Order_Date) AS Order_Year,
SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY YEAR(Order_Date) 
ORDER BY Order_Year;
--Sales by Month
SELECT
MONTH(Order_Date) AS Order_Month,
DATENAME(MONTH, Order_Date) AS Month_Name,
SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY MONTH(Order_Date), DATENAME(MONTH, Order_Date)
ORDER BY Order_Month;
--Sales by Quarter
SELECT
DATEPART(QUARTER, Order_Date) AS Quarter,
SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY DATEPART(QUARTER,Order_Date)
ORDER BY Quarter;
--Profit by Year
SELECT
YEAR(Order_Date) AS Year,
SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY YEAR (Order_Date)
ORDER BY Year;
--Monthly Profit
SELECT 
MONTH(Order_Date) AS Month,
DATENAME(MONTH,Order_Date) AS Month_Name,
SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY MONTH(Order_Date), DATENAME(MONTH, Order_Date)
ORDER BY Month;
--Orders per Month
SELECT
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
COUNT(Order_ID) AS Total_Orders
FROM Orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Year, Month;
--Average Sales Per Month
SELECT
MONTH(Order_Date) AS Month,
AVG(Sales) AS Average_Sales
FROM Orders
GROUP BY MONTH(Order_Date)
ORDER BY Month;
--Highest Sales Month
SELECT TOP 1
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
SUM(Sales) AS Total_Sales
FROM Orders
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Total_Sales DESC;
--Lowest Sales Month
SELECT TOP 1
YEAR(Order_Date) AS Year,
MONTH(Order_Date) AS Month,
SUM(Sales) AS Total_Sales
FROM Orders 
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY Total_Sales ASC;
--Year_wise Sales and Profit
SELECT
YEAR(Order_Date) AS Year,
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Orders
GROUP BY YEAR(Order_Date)
ORDER BY Year;

