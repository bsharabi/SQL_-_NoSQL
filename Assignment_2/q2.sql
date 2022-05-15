CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
DELETE FROM employeeterritories
WHERE OLD.EmployeeID = EmployeeID;
