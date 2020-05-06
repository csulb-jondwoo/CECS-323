-- Customer_addresses_v – for each customer, indicate whether they are an individual or a
-- corporate account, and display all of the information that we are managing for that
-- customer.
    SELECT 'Individual' as "Category",c.custName,c.city,c.address,c.state,c.custName,c.mimingMoney,i.emailAddress as "Email",i.DOB as "DOB",NULL as "companyDep",NULL as "companyName",NULL as "contactPhone" FROM customers c 
    INNER JOIN individual i ON (c.accountNo = i.accountNo)
    UNION
	SELECT 'Individual' as "Category",c.custName,c.city,c.address,c.state,c.custName,c.mimingMoney,comp.contactEmail as "Email",NULL as "DOB",comp.companyDep as "companyDep",comp.companyName as "companyName",comp.contactPhone as "contactPhone" FROM customers c 
    INNER JOIN company comp ON (c.accountNo = comp.accountNo);

-- Customer_Value_v – List each customer and the total $ amount of their orders for the
-- past year (365 days), in order of the value of customer orders, from highest to the lowest.
SELECT c.custName as "customer", SUM(mp.price) as "amount", DATEDIFF(CURDATE(),o.orderDateTime) as numDays FROM customers c
INNER JOIN Orders o ON (c.accountNo = o.accountNo)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING numDays < 365
ORDER BY SUM(mp.price) DESC;