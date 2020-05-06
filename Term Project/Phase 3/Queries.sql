-- List the customers. For each customer, indicate which category he or she fall into, and
-- his or her contact information. If you have more than one independent categorization of 
-- CECS 323 Term Project.docx 1/13/2020 1:47:00 PM 9
-- customers, please indicate which category the customer falls into for all of the
-- categorizations

SELECT "Catergory" as 'Individual Customer' FROM ;

-- List the top three customers in terms of their net spending for the past two years (last
-- 730 days), and the total that they have spent in that period.
SELECT c.custName, SUM(mp.price) as "Bill Total" FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNo)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING DATEDIFF(day,o.orderDateTime,CURRENT_DATE) < 731
ORDER BY SUM(mp.price);

-- List the customers, sorted by the amount of Miming’s Money that they have, from largest
-- to smallest.
SELECT cust.CustName FROM Customer as cust 
ORDER BY cust."Miming Money";

-- List the customers and the total that they have spent at Miming’s ever, in descending
-- order by the amount that they have spent.
SELECT c.accountNo, SUM(c.MimingMoney) as "TotalSpent"FROM customers as c
INNER JOIN Orders as o  ON (o.Account# = c.Account#)
GROUP BY c.accountNo
ORDER BY SUM(c.MimingMoney);
-- Report on the customers at Miming’s by the number of times that they come in by month
-- and order the report from most frequent to the least frequent. Each row in the output
-- should have the Customer name, the month, the year, and the number of times that
-- customer came in during that month of that year.
SELECT c.accountNo,COUNT() FROM customer c 
INNER JOIN Orders o ON (c.AccountNo = o.'Account#');


SELECT c.accountNo, COUNT() FROM (SELECT c.accountNo,o.orderDateTime FROM customer c 
INNER JOIN Orders o ON (c.AccountNo = o."Account#")) as "VisitsTable"

-- List the three customers who have spent the most at Miming’s over the past year (365
-- days). Order by the amount that they spent, from largest to smallest
SELECT SUM(o.) as "TotalSpent", c.CustName FROM customers as c
INNER JOIN Orders as o  ON (o.Account# = c.Account#)
WHERE DATEDIFF(day, o.DATEDIFF, CURRENT_DATE) < 366
ORDER BY SUM(o.MimingMoney);

-- List all of the customers who eat at Miming’s on their own as well as ordering for their
-- corporation.
SELECT custName
FROM Customer INNER JOIN (Individual INNER JOIN Company ON Individual.emailAddress = Company.contactEmail as IndivCustom) ON Customer.accountNo = IndivCustom.accountNo;

--An individual customer can only have one miming account

--company accounts can share a contact (the person ordering the food)

--During Birthday Month, customers (individuals) receive double the miming dollar amount
