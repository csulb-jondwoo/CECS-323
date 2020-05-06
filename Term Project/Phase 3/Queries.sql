-- Customer_addresses_v – for each customer, indicate whether they are an individual or a
-- corporate account, and display all of the information that we are managing for that
-- customer.
    SELECT * FROM Individual_Customer
    UNION 
    SELECT * FROM Company_Cusomer;

-- Customer_Value_v – List each customer and the total $ amount of their orders for the
-- past year (365 days), in order of the value of customer orders, from highest to the lowest.
SELECT SUM(cust.MimingMoney) as "TotalSpent", c.CustName FROM customers as c
INNER JOIN Orders as o  ON (o.Account# = c.Account#)
WHERE DATEDIFF(day, o.DATEDIFF, CURRENT_DATE) < 366;

-- List the customers. For each customer, indicate which category he or she fall into, and
-- his or her contact information. If you have more than one independent categorization of 
-- CECS 323 Term Project.docx 1/13/2020 1:47:00 PM 9
-- customers, please indicate which category the customer falls into for all of the
-- categorizations
SELECT "Catergory" as 'Individual Customer' FROM ;

-- List the top three customers in terms of their net spending for the past two years (last
-- 730 days), and the total that they have spent in that period.
SELECT TOP 3 * FROM (SELECT SUM(cust.MimingMoney) as "TotalSpent", c.CustName FROM customers as c
INNER JOIN Orders as o  ON (o.Account# = c.Account#)
WHERE DATEDIFF(day, o.DATEDIFF, CURRENT_DATE) < 731) as "SpentTable";

-- List the customers, sorted by the amount of Miming’s Money that they have, from largest
-- to smallest.
SELECT cust.CustName FROM Customer as cust 
ORDER BY cust."Miming Money";

-- List the customers and the total that they have spent at Miming’s ever, in descending
-- order by the amount that they have spent.
SELECT c.custName FROM Customer as c 
INNER JOIN Bill as b ON (C.Account# = b.Account#)
WHERE b.amount
-- Report on the customers at Miming’s by the number of timesthat they come in by month
-- and order the report from most frequent to the least frequent. Each row in the output
-- should have the Customer name, the month, the year, and the number of times that
-- customer came in during that month of that year.

-- List the three customers who have spent the most at Miming’s over the past year (365
-- days). Order by the amount that they spent, from largest to smallest

-- List all of the customers who eat at Miming’s on their own as well as ordering for their
-- corporation.

--An individual customer can only have one miming account

--company accounts can share a contact (the person ordering the food)

--During Birthday Month, customers (individuals) receive double the miming dollar amount