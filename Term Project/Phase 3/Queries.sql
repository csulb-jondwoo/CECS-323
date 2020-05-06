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





-- create_view.sql
-- 1) MenuItem_v – For each menu item, give it’s spiciness, and all of the different costs for
-- that item. If a given item is not on a particular menu, then report “N/A” for that particular
-- item for that particular menu. Also, if an item only appears as a single serving portion,
-- put in “N/A” into the report for the gallon, … prices.

-- 2) Customer_addresses_v – for each customer, indicate whether they are an individual or a
-- corporate account, and display all of the information that we are managing for that
-- customer.

-- 3) Sous_mentor_v – reports all the mentor/mentee relationships at Miming’s, sorted by the
-- name of the mentor, then the name of the mentee. Show the skill that the mentorship
-- passes, as well as the start date.

-- 4) Customer_Sales_v – On a year by year basis, show how much each customer has spent at
-- Miming’s.

-- 5) Customer_Value_v – List each customer and the total $ amount of their orders for the
-- past year (365 days), in order of the value of customer orders, from highest to the lowest.
-- Please perform a select * from each view and put the results of that select into a single
-- file called view_output.docx, or .pdf. If you like, you can put the SQL for the view in the
-- same file with the output.







-- 1) List the customers. For each customer, indicate which category he or she fall into, and
-- his or her contact information. If you have more than one independent categorization of customers, please indicate which category the customer falls into for all of the
-- categorizations.

-- 2) List the top three customers in terms of their net spending for the past two years (last
-- 730 days), and the total that they have spent in that period.

-- 3) Find all of the sous chefs who have three or more menu items that they can prepare. For
-- each sous chef, list their name, the number of menu items that they can prepare, and
-- each of the menu items. You can use group_concat to get all of a given sous chef’s data
-- on one row, or print out one row per sous chef per menu item.

-- 4) Find all of the sous chefs who have three or more menu items in common.
-- i. Please give the name of each of the two sous chefs sharing three or more menu
-- items.
-- ii. Please make sure that any given pair of sous chefs only shows up once.
-- iii. Please list the items that the two Sous Chefs have in common. Again, you can use
-- group_concat to get all of those items into one value in the output.

-- 5) Find the three menu items most often ordered from the Children’s menu and order them
-- from most frequently ordered to least frequently ordered.

-- 6) Show by week, how many hours each employee works.

-- 7) List the customers, sorted by the amount of Miming’s Money that they have, from largest
-- to smallest.

-- 8) List the customers and the total that they have spent at Miming’s ever, in descending
-- order by the amount that they have spent.

-- 9) Report on the customers at Miming’s by the number of timesthat they come in by month
-- and order the report from most frequent to the least frequent. Each row in the output
-- should have the Customer name, the month, the year, and the number of times that
-- customer came in during that month of that year.

-- 10) List the three customers who have spent the most at Miming’s over the past year (365
-- days). Order by the amount that they spent, from largest to smallest.

-- 11) List the five menu items that have generated the most revenue for Miming’s over the past
-- year (365 days).

-- 12) Find the sous chef who is mentoring the most other sous chef. List the menu items that
-- the sous chef is passing along to the other sous chefs.

-- 13) Find the three menu items that have the fewest sous chefs skilled in those menu items.

-- 14) List all of the customers who eat at Miming’s on their own as well as ordering for their
-- corporation.

-- 15) List the contents and prices of each of the menus.

-- 16) Three additional queries that demonstrate the five additional business rules. Feel free to
-- create additional views to support these queries if you so desire