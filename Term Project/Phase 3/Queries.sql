-- 1) List the customers. For each customer, indicate which category he or she fall into, and
-- his or her contact information. If you have more than one independent categorization of customers, 
-- please indicate which category the customer falls into for all of the
-- categorizations.
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN individuals i ON (c.accountNo = i.accountNo)
    UNION
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN company comp ON (c.accountNo = comp.accountNo);

-- 2) List the top three customers in terms of their net spending for the past two years (last
-- 730 days), and the total that they have spent in that period.
SELECT c.custName, SUM(mp.price) as "Bill Total" , DATEDIFF(NOW(),o.orderDateTime) as numDays FROM customers as c
INNER JOIN Orders as o ON (c.accountNo = o.AccountNo)
INNER JOIN OrderItem as oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices as mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName, mp.price
HAVING numDays < 731
ORDER BY SUM(mp.price)
LIMIT 3;

-- 3) Find all of the sous chefs who have three or more menu items that they can prepare. For
-- each sous chef, list their name, the number of menu items that they can prepare, and
-- each of the menu items. You can use group_concat to get all of a given sous chef’s data
-- on one row, or print out one row per sous chef per menu item.
	-- count sousChef expertise
    SELECT itemNum, chefID, mentorID, menteeID
    FROM expertise
    INNER JOIN mentorship USING itemNum;
    
    -- filter by three or more
    
    
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
SELECT cust.CustName FROM Customer as cust 
ORDER BY cust.MimingMoney;


-- 8) List the customers and the total that they have spent at Miming’s ever, in descending
-- order by the amount that they have spent.
SELECT c.custName, SUM(mp.price) as "Bill Total" FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNumber)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
ORDER BY SUM(mp.price) DESC;


-- 9) Report on the customers at Miming’s by the number of timesthat they come in by month
-- and order the report from most frequent to the least frequent. Each row in the output
-- should have the Customer name, the month, the year, and the number of times that
-- customer came in during that month of that year.
SELECT * FROM customer c
INNER JOIN Orders o ON(c.accountNo = o.accountNumber)


-- 10) List the three customers who have spent the most at Miming’s over the past year (365
-- days). Order by the amount that they spent, from largest to smallest.
SELECT c.custName, SUM(mp.price) as "Bill Total", DATEDIFF(day,o.orderDateTime,CURDATE()) as numDays FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNo)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING numDays < 366
ORDER BY SUM(mp.price) ASC;


-- 11) List the five menu items that have generated the most revenue for Miming’s over the past
-- year (365 days).


-- 12) Find the sous chef who is mentoring the most other sous chef. List the menu items that
-- the sous chef is passing along to the other sous chefs.


-- 13) Find the three menu items that have the fewest sous chefs skilled in those menu items.


-- 14) List all of the customers who eat at Miming’s on their own as well as ordering for their
-- corporation.
SELECT custName
FROM Customer INNER JOIN (Individual INNER JOIN Company ON Individual.emailAddress = Company.contactEmail as IndivCustom) ON Customer.accountNo = IndivCustom.accountNo;


-- 15) List the contents and prices of each of the menus.


-- 16) Three additional queries that demonstrate the five additional business rules. Feel free to
-- create additional views to support these queries if you so desire

-- Business Rules
-- 1) An individual customer can only have one miming account
-- 2) company accounts can share a contact (the person ordering the food)
-- 3) During Birthday Month, customers (individuals) receive double the miming dollar amount
































