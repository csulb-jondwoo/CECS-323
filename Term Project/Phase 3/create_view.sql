-- 1) MenuItem_v – For each menu item, give it’s spiciness, and all of the different costs for
-- that item. If a given item is not on a particular menu, then report “N/A” for that particular
-- item for that particular menu. Also, if an item only appears as a single serving portion,
-- put in “N/A” into the report for the gallon, … prices.

-- 2) Customer_addresses_v – for each customer, indicate whether they are an individual or a
-- corporate account, and display all of the information that we are managing for that
-- customer.
create or replace view Customer_addresses_v as
    (SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN individuals i ON (c.accountNo = i.accountNo)
    UNION
    SELECT "Catergory" as 'Individual', * FROM customers c 
    INNER JOIN company comp ON (c.accountNo = comp.accountNo));

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
SELECT c.custName, SUM(mp.price) as "Bill Total" , DATEDIFF(CURDATE(),o.orderDateTime) as numDays FROM customer c
INNER JOIN Orders o ON (c.accountNo = o.accountNumber)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING numDays < 731
ORDER BY SUM(mp.price);





=======
create or replace view Customer_Value_v as
    (SELECT c.custName, SUM(mp.price) as "Bill Total" , DATEDIFF(CURDATE(),o.orderDateTime) as numDays FROM customer c
    INNER JOIN Orders o ON (c.accountNo = o.accountNumber)
    INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
    INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
    GROUP BY c.custName
    HAVING numDays < 731
    ORDER BY SUM(mp.price));

create or replace view MenuItem_v as
    (select menuItems.name as "Dish Name", "Mild" as "Spiciness",
    menuPrices.menu as "Menu", menuPrices.price as "Price"
    from menuPrices
    inner join menuItems on menuItems.itemNum = menuPrices.menuItemNum);
>>>>>>> 4960be050ed4c4957b6c8217c49d69fd3d323612
