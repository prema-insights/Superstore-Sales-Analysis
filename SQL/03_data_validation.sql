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
   