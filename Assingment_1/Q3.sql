use northwind;
SELECT p.ProductID,
p.ProductName,
p.SupplierID,
s.CompanyName,
s.Phone,
100-p.UnitsInStock  as ' to order'
FROM products as p join  suppliers as s
on s.SupplierID=p.SupplierID or  p.SupplierID is null
where p.UnitsInStock + P.UnitsOnOrder <10 
ORDER BY p.SupplierID ASC

 