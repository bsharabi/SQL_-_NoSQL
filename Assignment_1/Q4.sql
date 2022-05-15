use northwind;
select 
e.EmployeeID ,
e.FirstName,
e.LastName,
e.HomePhone,
DATE_ADD(max(o.OrderDate),INTERVAL 7 DAY) as 'insulation ends at...'
 from  employees as e JOIN  orders as o
 on o.EmployeeID=e.EmployeeID 
 where o.OrderDate Between date_sub("1998-05-08",interval 7 day) AND "1998-05-08"
 and o.OrderDate in (select  OrderDate from orders
where Employeeid=8 ) and e.employeeid !=8
 group by e.employeeid
 order by e.lastname

