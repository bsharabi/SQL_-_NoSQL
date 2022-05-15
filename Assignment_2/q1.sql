
CREATE PROCEDURE myPrecuder(IN cid VARCHAR(5))
BEGIN
SELECT o.OrderID, 
CASE WHEN SUM(od.UnitPrice * od.Quantity) - SUM(tavg.avgUnitPrice * od.Quantity) > 0 THEN "Loss"
WHEN SUM(od.UnitPrice * od.Quantity) - SUM(tavg.avgUnitPrice * od.Quantity) < 0 THEN "Profit"
ELSE "Equivalent" END AS "Profit/Loss", 
ABS(SUM(od.UnitPrice * od.Quantity) - SUM(tavg.avgUnitPrice * od.Quantity)) AS "Amount"
FROM orders AS o JOIN `order details` AS od ON o.OrderID = od.OrderID JOIN 
(SELECT p.ProductID AS pid, AVG(od.UnitPrice) AS avgUnitPrice
FROM `order details` AS od JOIN products AS p ON p.ProductID = od.ProductID
GROUP BY p.ProductID) AS tavg ON tavg.pid = od.ProductID
WHERE cid = o.CustomerID
GROUP BY od.OrderID
ORDER BY od.OrderID DESC;
END
