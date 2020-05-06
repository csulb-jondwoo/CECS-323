-- Customer_addresses_v – for each customer, indicate whether they are an individual or a
-- corporate account, and display all of the information that we are managing for that
-- customer.
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN individuals i ON (c.accountNo = i.accountNo)
    UNION
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN company comp ON (c.accountNo = comp.accountNo);

-- Customer_Value_v – List each customer and the total $ amount of their orders for the
-- past year (365 days), in order of the value of customer orders, from highest to the lowest.
SELECT c.custName, SUM(mp.price) as "Bill Total" , DATEDIFF(CURDATE(),o.orderDateTime) as numDays FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNumber)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING numDays < 731
ORDER BY SUM(mp.price);
