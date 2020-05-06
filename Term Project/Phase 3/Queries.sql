-- 1) List the customers. For each customer, indicate which category he or she fall into, and
-- his or her contact information. If you have more than one independent categorization of customers, 
-- please indicate which category the customer falls into for all of the
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
SELECT custName AS Customer, mimingMoney FROM individual
NATURAL JOIN customers
GROUP BY Customer, mimingMoney
UNION
SELECT companyName AS Customer, mimingMoney FROM company
NATURAL JOIN customers
GROUP BY Customer, mimingMoney
ORDER BY mimingMoney DESC;

-- 8) List the customers and the total that they have spent at Miming’s ever, in descending
-- order by the amount that they have spent.



-- 9) Report on the customers at Miming’s by the number of times that they come in by month
-- and order the report from most frequent to the least frequent. Each row in the output
-- should have the Customer name, the month, the year, and the number of times that
-- customer came in during that month of that year.



-- 10) List the three customers who have spent the most at Miming’s over the past year (365
-- days). Order by the amount that they spent, from largest to smallest.
-- SELECT c.custName, SUM(mp.price) as "Bill Total", DATEDIFF(day,o.orderDateTime,CURDATE()) as numDays FROM customer c


-- 11) List the five menu items that have generated the most revenue for Miming’s over the past
-- year (365 days).

-- 12) Find the sous chef who is mentoring the most other sous chef. List the menu items that
-- the sous chef is passing along to the other sous chefs.


-- 13) Find the three menu items that have the fewest sous chefs skilled in those menu items.


-- 14) List all of the customers who eat at Miming’s on their own as well as ordering for their
-- corporation.
SELECT custName
FROM customers
INNER JOIN company USING (accountNo)
INNER JOIN individual ON individual.emailAddress = company.contactEmail;

-- 15) List the contents and prices of each of the menus.

-- Business Rules
-- 1) An individual customer can only have one miming account
-- 2) company accounts can share a contact (the person ordering the food)
-- 3) During Birthday Month, customers (individuals) receive double the miming dollar amount
































