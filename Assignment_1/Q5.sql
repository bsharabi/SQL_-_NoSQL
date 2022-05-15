SELECT 
p.ProductName,
c.CompanyName,
YEAR(o.OrderDate) as OrderYear,
case when quarter(o.OrderDate)=1 then
CEILING(od.UnitPrice*od.Quantity)else CEILING(0) end as Qrt1 ,
 case when quarter(o.OrderDate)=2 then
CEILING((od.UnitPrice*od.Quantity ))else CEILING(0)   end as Qrt2,
 case when quarter(o.OrderDate)=3 then
CEILING(od.UnitPrice*od.Quantity)else CEILING(0)  end as Qrt3,
 case when quarter(o.OrderDate)=4 then
CEILING(od.UnitPrice*od.Quantity)else CEILING(0)  end as Qrt4
FROM products as p 
join `order details` as od
on p.ProductID = od.ProductID
join orders as o
on o.OrderID=od.OrderID
join customers as c 
on o.CustomerID=c.CustomerID
order by p.ProductName,c.CompanyName
