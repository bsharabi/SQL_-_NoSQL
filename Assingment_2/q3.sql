SELECT OrderId, RequiredDate
FROM orders 
WHERE shippedDate=null and RequiredDate < NOW();

מטרת השאילתה היא לאתר את כל ההזמנות שטרם נשלחו ליעדן וכבר חלפה מועד הקבלה ביעד. השאילתה תחזיר עבור הזמנות אלו את המזהה שלהן ואת זמן ההגעה שכבר חלף (RequiredDate).