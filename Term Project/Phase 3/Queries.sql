-- List the customers. For each customer, indicate which category he or she fall into, and
-- his or her contact information. If you have more than one independent categorization of 
-- customers, please indicate which category the customer falls into for all of the
-- categorizations
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN individuals i ON (c.accountNo = i.accountNo)
    UNION
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN company comp ON (c.accountNo = comp.accountNo);

-- List the top three customers in terms of their net spending for the past two years (last
-- 730 days), and the total that they have spent in that period.
SELECT c.custName, SUM(mp.price) as "Bill Total" , DATEDIFF(NOW(),o.orderDateTime) as numDays FROM customers as c
INNER JOIN Orders as o ON (c.accountNo = o.AccountNo)
INNER JOIN OrderItem as oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices as mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName, mp.price
HAVING numDays < 731
ORDER BY SUM(mp.price)
LIMIT 3;

-- List the customers, sorted by the amount of Miming’s Money that they have, from largest
-- to smallest.
SELECT cust.CustName FROM Customer as cust 
ORDER BY cust.MimingMoney;

-- List the customers and the total that they have spent at Miming’s ever, in descending
-- order by the amount that they have spent.
SELECT c.custName, SUM(mp.price) as "Bill Total" FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNumber)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
ORDER BY SUM(mp.price) DESC;

-- Report on the customers at Miming’s by the number of times that they come in by month
-- and order the report from most frequent to the least frequent. Each row in the output
-- should have the Customer name, the month, the year, and the number of times that
-- customer came in during that month of that year.
SELECT * FROM customer c
INNER JOIN Orders o ON(c.accountNo = o.accountNumber)

-- List the three customers who have spent the most at Miming’s over the past year (365
-- days). Order by the amount that they spent, from largest to smallest
SELECT c.custName, SUM(mp.price) as "Bill Total", DATEDIFF(day,o.orderDateTime,CURDATE()) as numDays FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNo)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING numDays < 366
ORDER BY SUM(mp.price) ASC;

-- List all of the customers who eat at Miming’s on their own as well as ordering for their
-- corporation.
SELECT custName
FROM Customer INNER JOIN (Individual INNER JOIN Company ON Individual.emailAddress = Company.contactEmail as IndivCustom) ON Customer.accountNo = IndivCustom.accountNo;

--An individual customer can only have one miming account

--company accounts can share a contact (the person ordering the food)

--During Birthday Month, customers (individuals) receive double the miming dollar amount
