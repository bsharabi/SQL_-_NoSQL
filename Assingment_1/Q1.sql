select s.CompanyName, s.Phone, 
case when min(o.RequiredDate) < CURDATE() then 'pass'
else min(CURDATE() - o.RequiredDate) end as 'Days Left'
from orders as o join shippers as s
on o.shipvia = s.shipperID
where o.ShippedDate is NULL and date_sub(o.RequiredDate, INTERVAL 7 DAY) <= 
CURDATE()
group by s.shipperID


מטרת השאילתה לאתר עבור כל חברת משלוחים,
את שמה s.CompanyName,
את מספר הטלפון שלה s.Phone,
ומספר הימים שנותרו להשלמת המשלוח המינימלי היכן שלא קיים תאריך משלוח כאשר נסתכל על תאריך הבקשה למשלוח בשבעה ימים האחרונים החל מהתאריך הנוכחי.
נחזיר את אלה שמספר הימים להגעתו הוא לכל היותר שבוע והוא עוד לו נשלח ומסומן בעמודת Days Left
שתי אפשרויות 


