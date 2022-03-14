use northwind;
SELECT o.ProductId,p.ProductName,
SUM(o.Quantity) as totalQuantity, 
CONCAT('$', round(SUM(o.UnitPrice*o.Quantity),2)) as totalPrice,
CONCAT('$', round(SUM(o.UnitPrice*o.Quantity)*1.0/ SUM(o.Quantity),2)) as WeightedAvgPrice,
CONCAT('$', round(AVG(o.UnitPrice),2)) as AvgPrice ,
CONCAT('$', round(p.UnitPrice,2)) as CurrentPrice
FROM `order details` as o join products as p
on o.ProductID=p.ProductID
GROUP BY p.ProductName
ORDER BY p.UnitPrice ASC
