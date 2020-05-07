-- 1) MenuItem_v – For each menu item, give it’s spiciness, and all of the different costs for
-- that item. If a given item is not on a particular menu, then report “N/A” for that particular
-- item for that particular menu. Also, if an item only appears as a single serving portion,
-- put in “N/A” into the report for the gallon, … prices.
create or replace view MenuItem_v as
    (select MenuItems.name as "Dish Name", "Mild" as "Spiciness",
    MenuPrices.menu as "Menu", MenuPrices.price as "Price"
    from MenuPrices
    inner join MenuItems on MenuItems.itemNum = MenuPrices.menuItemNum);

-- 2) Customer_addresses_v – for each customer, indicate whether they are an individual or a
-- corporate account, and display all of the information that we are managing for that
-- customer.
create or replace view Customer_addresses_v as
    (SELECT 'Individual' as "Category",c.custName,c.city,c.address,c.state,c.custName,c.mimingMoney,i.emailAddress as "Email",i.DOB as "DOB",NULL as "companyDep",NULL as "companyName",NULL as "contactPhone" FROM customers c 
    INNER JOIN individual i ON (c.accountNo = i.accountNo)
    UNION
	SELECT 'Individual' as "Category",c.custName,c.city,c.address,c.state,c.custName,c.mimingMoney,comp.contactEmail as "Email",NULL as "DOB",comp.companyDep as "companyDep",comp.companyName as "companyName",comp.contactPhone as "contactPhone" FROM customers c 
    INNER JOIN company comp ON (c.accountNo = comp.accountNo));


-- 5) Customer_Value_v – List each customer and the total $ amount of their orders for the
-- past year (365 days), in order of the value of customer orders, from highest to the lowest.
create or replace view  Customer_Value_v  as(
SELECT c.custName as "customer", SUM(mp.price) as "amount", DATEDIFF(CURDATE(),o.orderDateTime) as numDays FROM customers c
INNER JOIN Orders o ON (c.accountNo = o.accountNo)
INNER JOIN OrderItem oi ON (o.orderNumber = oi.orderNumber)
INNER JOIN MenuPrices mp ON (oi.menuItemNum =  mp.menuItemNum)
GROUP BY c.custName
HAVING numDays < 365
ORDER BY SUM(mp.price) DESC);


-- Please perform a select * from each view and put the results of that select into a single
-- file called view_output.docx, or .pdf. If you like, you can put the SQL for the view in the
-- same file with the output.






