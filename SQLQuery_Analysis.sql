--1.Find the top 5 products generating the highest sales revenue.

SELECT TOP 5 P.ProductName, SUM(O.Quantity * O.UnitPrice) AS Revenue
FROM Orders O
JOIN Products P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY Revenue DESC

--2.List suppliers who supply more than 3 distinct product categories

SELECT S.SupplierName, 
    COUNT(DISTINCT P.Category) AS Category_count
FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
GROUP BY S.SupplierName
HAVING COUNT(DISTINCT P.Category) > 3

--3.Calculate the average delivery delay (DeliveryDate - DispatchDate) for each supplier region.

SELECT S.Region, AVG(DATEDIFF(DAY, SH.DeliveryDate, SH.DispatchDate)) AS delivery_delay
FROM Shipments SH
JOIN Orders O ON SH.OrderID = O.OrderID
JOIN Products P ON O.ProductID = P.ProductID
JOIN Suppliers S ON P.SupplierID = S.SupplierID
WHERE SH.Status = 'Delivered'
GROUP BY S.Region

--4.Identify products whose inventory stock is below the reorder level across warehouses.

SELECT I.ProductID, P.ProductName, SUM(I.StockQuantity) AS total_stock, SUM(I.ReorderLevel) AS total_reorderlevel
FROM Inventory I
JOIN Products P ON I.ProductID = P.ProductID
GROUP BY I.ProductID, P.ProductName
HAVING SUM(I.StockQuantity) < SUM(I.ReorderLevel)

--5.List warehouses where inventory utilization is below 50%.

SELECT W.WarehouseName, (SUM(I.StockQuantity)*1.0/(W.Capacity)) AS Utilization
FROM Warehouses W
JOIN Inventory I
ON W.WarehouseID = I.WarehouseID
GROUP BY W.WarehouseName, W.Capacity
HAVING (SUM(I.StockQuantity)*1.0/(W.Capacity)) < 50

--6.List orders where shipment was delayed by more than 7 days.

SELECT O.OrderID, DATEDIFF(DAY, SH.DeliveryDate, SH.DispatchDate) AS ShipmentDelay
FROM Orders O
JOIN Shipments SH
ON O.OrderID=SH.OrderID
WHERE SH.Status = 'Delayed' AND DATEDIFF(DAY, SH.DeliveryDate, SH.DispatchDate) >7

--7.Create a monthly trend of total orders and revenue for the last 12 months.

SELECT FORMAT(OrderDate,'yyyy-MM') AS Month_Year,COUNT(OrderID) AS TotalOrders, SUM(Quantity*UnitPrice) AS Revenue
FROM Orders
WHERE OrderDate >= DATEADD(MONTH,-11,GETDATE())
GROUP BY FORMAT (OrderDate,'yyyy-MM')
ORDER BY FORMAT (OrderDate,'yyyy-MM')

--8. Find the top 3 customers with the highest number of delayed shipments.

Select TOP 3 O.CustomerID,COUNT(*) AS NumberofDelays
From Orders O
JOIN Shipments SH 
ON O.OrderID =SH.OrderID
WHERE Status ='Delayed'
GROUP BY O.CustomerID
ORDER BY NumberofDelays DESC

--9. Show product categories having an average margin of more than 20%.

SELECT P.Category,AVG((O.UnitPrice-P.CostPrice)/(O.UnitPrice))*100 AS AverageMargin
FROM Products P
JOIN Orders O
ON P.ProductID=O.ProductID
GROUP BY P.Category
HAVING AVG((O.UnitPrice-P.CostPrice)/(O.UnitPrice))*100 > 20

--10.Identify supplier regions with shipment delays higher than 10% of total shipments.

SELECT S.Region,(SUM(CASE WHEN SH.STATUS = 'Delayed' THEN 1 ELSE 0 END)*100/COUNT(SH.ShipmentID)) AS ShipmentDelay
FROM Shipments SH 
JOIN Orders O 
ON SH.OrderID = O.OrderID
JOIN Products P 
ON O.ProductID = P.ProductID
JOIN Suppliers S 
ON P.SupplierID = S.SupplierID
GROUP BY S.Region
HAVING (SUM(CASE WHEN SH.STATUS = 'Delayed' THEN 1 ELSE 0 END)*100/COUNT(SH.ShipmentID)) >10

--11. Find pairs of products from the same category but supplied by different suppliers.


SELECT * FROM Orders
SELECT * FROM Inventory
SELECT * FROM Warehouses
SELECT * FROM Products
SELECT * FROM Shipments
SELECT * FROM Suppliers







