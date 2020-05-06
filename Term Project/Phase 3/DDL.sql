CREATE DATABASE mimings_cuisine;	
use mimings_cuisine;

-- create employees table
	-- empID: employee ID
	-- empName: name of employee
	-- dob: employee date of birth
	-- designatedArea: where the employee is stationed (front of house/back of house)
CREATE TABLE employees (
	empID			INT NOT NULL,
    empName			VARCHAR(20) NOT NULL,
	dob				DATE NOT NULL,
    designatedArea	VARCHAR(15) NOT NULL,
    incomeType		VARCHAR(10),
    CONSTRAINT emp_pk PRIMARY KEY (empID),
    CONSTRAINT emp_uk01 UNIQUE (empName, dob, designatedArea)
);

-- create manager table
	-- empID: employee ID
CREATE TABLE manager (
	empID		INT NOT NULL,
    CONSTRAINT manager_pk PRIMARY KEY (empID),
    CONSTRAINT manager_employees__fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

-- create chef table
	-- empID: employee ID
CREATE TABLE chef (
	empID		INT NOT NULL,
    CONSTRAINT chef_pk PRIMARY KEY (empID),
    CONSTRAINT chef_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

-- create headChef table
	-- empID: employee ID
CREATE TABLE headChef (
	empID		INT NOT NULL,
    CONSTRAINT headChef_pk PRIMARY KEY (empID),
    CONSTRAINT headChef_chef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

-- create recipes table
	-- recipeNo: recipe number
    -- recipeName: name of the recipe
    -- chefID: head chef's employee ID
CREATE TABLE recipes (
	recipeNo	INT NOT NULL,
	recipeName	VARCHAR(30) NOT NULL,
    chefID		INT NOT NULL,
    CONSTRAINT recipes_pk PRIMARY KEY (recipeNo),
    CONSTRAINT recipes_headChef_fk01 FOREIGN KEY (chefID) REFERENCES headChef(empID),
    CONSTRAINT recipes_uk01 UNIQUE (recipeName, chefID)
);

-- create sousChef table
	-- empID: employee ID
CREATE TABLE sousChef (
	empID		INT NOT NULL,
    CONSTRAINT sousChef_pk PRIMARY KEY (empID),
    CONSTRAINT sousChef_chef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

-- create menus table
	-- name: name of the menu
create table Menus(
    name varchar(20) not null,
    primary key (name));
    
-- create enumeration of day of the week
	-- dayName: a list of weekdays
create table AvailableDays(
    dayName varchar(10) not null,
    primary key (dayName));

-- create table to show when certain menu's can be used
	-- name: name of the menu
    -- day: day of week that the menu is available on
    -- useStartTime: the time a menu is available
    -- useEndTime: the time a menu is no longer available
create table MenuUsage(
    name varchar(20) not null,
    day varchar(10) not null,
    useStartTime time not null,
    useEndTime time not null,
    primary key (name, day),
    constraint menuUsage_menus_fk01 foreign key (name) references Menus(name),
    constraint menuUsage_availableDays_fk01 foreign key (day) references AvailableDays(dayName));
    
-- create enumeration of meats
	-- name: name of the meat
create table Meats(
    name varchar(20) not null,
    primary key (name));
    
-- create enumeration of spice levels
	-- name: name of the spcie level
create table SpiceLevels(
    name varchar(20) not null,
    primary key (name));
    
-- create table to represent a conceptual figure of an item on the menu
	-- itemNum: item number on the menu
    -- name: name of the item on the menu
    -- description: description of the item on the menu
    -- recipeNo: the recipe number of the item
create table MenuItems(
    itemNum int not null,
    name varchar(40) not null,
    description varchar(200) not null,
    recipeNo INT,
    primary key (itemNum),
    constraint menuItems_uk01 unique (name, description),
    constraint menuItems_recipes_fk01 foreign key (recipeNo) references recipes(recipeNo));

-- create table depicting the price of a particular item on the menu
	-- menuItemNum: the item number on the menu
    -- menu: the name of the menu
    -- price: the price of the item on the menu
create table MenuPrices(
    menuItemNum int not null,
    menu varchar(20) not null,
    price decimal(5,2) not null,
    primary key (menuItemNum, menu),
    constraint menuPrices_menuItems_fk01 foreign key (menuItemNum) references MenuItems(itemNum),
    constraint menuPrices_menu_fk01 foreign key (menu) references Menus(name));

-- create table of sousChef's expertise
	-- itemNum: the item number the chef is a expert in
    -- chefID: the ID of the chef
CREATE TABLE expertise (
    itemNum 	INT NOT NULL,
    chefID		INT NOT NULL,
    CONSTRAINT expertise_pk PRIMARY KEY (itemNum, chefID),
    CONSTRAINT expertise_menuItems_fk01 FOREIGN KEY (itemNum) REFERENCES MenuItems(itemNum),
    CONSTRAINT expertise_sousChef_fk02 FOREIGN KEY (chefID) REFERENCES sousChef(empID)
);

-- create a table depicting a sousChef to sousChef mentorship where a sousChef mentor teaches a sousChef mentee
	-- itemNum: item number of the item on the menu
    -- mentorID: sousChef mentor ID
    -- menteeID: sousChef mentee ID
    -- startDate: start date of the mentorship
    -- endDate: end date of the mentorship
CREATE TABLE mentorship (
    itemNum		INT NOT NULL,
    mentorID	INT NOT NULL,
    menteeID	INT NOT NULL,
    startDate	DATE,
    endDate		DATE,
    CONSTRAINT mentorship_pk PRIMARY KEY (itemNum, mentorID, menteeID),
    CONSTRAINT mentorship_expertise_fk01 FOREIGN KEY (itemNum, mentorID) REFERENCES expertise(itemNum, chefID),
    CONSTRAINT mentorship_sousChef_fk02 FOREIGN KEY (menteeID) REFERENCES sousChef(empID)
);

-- create table for lineCooks
	-- empID: employee ID
CREATE TABLE lineCook (
    empID		INT NOT NULL,
    CONSTRAINT lineCook_pk PRIMARY KEY (empID),
    CONSTRAINT lineCook_chef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

-- create enumeration of stations
	-- stationName: name of the station
CREATE TABLE station (
    stationName	VARCHAR(10) NOT NULL,
    CONSTRAINT station_pk PRIMARY KEY (stationName)
);

-- create table for maitre_d
	-- empID: employee ID
CREATE TABLE maitre_d (
    empID		INT NOT NULL,
    CONSTRAINT maitre_d_pk PRIMARY KEY (empID),
    CONSTRAINT maitre_d_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

-- create table for dishwasher
	-- empID: employee ID
CREATE TABLE dishwasher (
	empID		INT NOT NULL,
    CONSTRAINT dishwasher_pk PRIMARY KEY (empID),
    CONSTRAINT dishwasher_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

-- create table for waitStaff
	-- empID: employee ID
CREATE TABLE waitStaff (
	empID		INT NOT NULL,
    CONSTRAINT waitStaff_pk PRIMARY KEY (empID),
    CONSTRAINT waitStaff_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

-- create enumeration for timeOfDay
	-- dayType: what type of hour it is in the day (Afternoon/Evening)
CREATE TABLE timeOfDay (
	dayType		VARCHAR(10) NOT NULL,
    CONSTRAINT timeOfDay_pk PRIMARY KEY (dayType)
);

-- create tables for shifts
	-- shiftDate: the date of the shift
	-- dayType: what type of hour it is in the day (Afternoon/Evening)
    -- managerID: employee ID for manager
    -- chefID: employee ID for headChef
CREATE TABLE shift (
	shiftDate	DATE NOT NULL,
    dayType		VARCHAR(10) NOT NULL,
    managerID	INT NOT NULL,
    chefID		INT NOT NULL,
    CONSTRAINT shift_pk PRIMARY KEY (shiftDate, dayType),
    CONSTRAINT shift_manager_fk01 FOREIGN KEY (managerID) REFERENCES manager(empID),
    CONSTRAINT shift__headChef_fk02 FOREIGN KEY (chefID) REFERENCES headChef(empID),
    CONSTRAINT shift_timeOfDay_fk03 FOREIGN KEY (dayType) REFERENCES timeOfDay(dayType)
);


-- create table to capture instance of an employee's shift
	-- empID: employee ID
    -- shiftDate: the date of the shift
    -- dayType: what type of hour it is in the day (Afternoon/Evening)
    -- managerID: employee ID for manager
    -- chefID: employee ID for headChef
CREATE TABLE empShift (
	empID		INT NOT NULL,
    shiftDate	DATE NOT NULL,
    dayType		VARCHAR(10) NOT NULL,
    managerID	INT NOT NULL,
    chefID		INT NOT NULL,
    CONSTRAINT empShift_pk PRIMARY KEY (empID, shiftDate, dayType),
    CONSTRAINT empShift_shift_fk01 FOREIGN KEY (shiftDate, dayType) REFERENCES shift(shiftDate, dayType),
    CONSTRAINT empShift_employees_fk02 FOREIGN KEY (empID) REFERENCES employees(empID)
);

-- create table to capture instance of a lineCook chef and the station they work at in a given shift
	-- stationName: name of the cook station
    -- chefID: employee ID for lineCook Chef
    -- shiftDate: the date of the shift
    -- dayType: what type of hour it is in the day (Afternoon/Evening)
CREATE TABLE lineCookStation (
	stationName	VARCHAR(10) NOT NULL,
    chefID		INT NOT NULL,
    shiftDate	DATE NOT NULL,
    dayType		VARCHAR(10) NOT NULL,
    CONSTRAINT lineCookStation_pk PRIMARY KEY (stationName, chefID, shiftDate, dayType),
    CONSTRAINT lineCookStation_station_fk01 FOREIGN KEY (stationName) REFERENCES station(stationName),
    CONSTRAINT lineCookStation_lineCook_fk02 FOREIGN KEY (chefID) REFERENCES lineCook(empID),
    CONSTRAINT lineCookStation_empShift_fk03 FOREIGN KEY (chefID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType)
);

-- create customers table
	-- accountNo: a customer's account number
    -- city: city name of residence
    -- address: street name of residence
	-- state: state of residence
    -- custName: name of customer
    -- mimingMoney: how Miming Money a given customer has
CREATE TABLE customers (
    accountNo INT NOT NULL,
    city VARCHAR (50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    state VARCHAR(2) NOT NULL,
    custName VARCHAR(50) NOT NULL,
    mimingMoney INT,
    CONSTRAINT customers_pk PRIMARY KEY (accountNo),
    CONSTRAINT customers_uk01 UNIQUE (city, address, state, custName)
);

-- create a table for individual customers
	-- accountNo: a customer's account number
    -- emailAddress: the email address of the customer
    -- DOB: customer's date of birth
CREATE TABLE individual (
    accountNo INT NOT NULL,
    emailAddress VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    CONSTRAINT individual_customer_pk PRIMARY KEY(accountNo),
    CONSTRAINT individual_uk01 UNIQUE (emailAddress,DOB),
    CONSTRAINT ind_customer_fk01 FOREIGN KEY (accountNo) REFERENCES customers(accountNo)
);

-- create a table for comapny customers
	-- accountNo: a customer's account number
    -- companyDep: company department
    -- companyName: name of the company
    -- contactEmail: company's contact email address
    -- contactPhone: compant's contact phone number
CREATE TABLE company (
    accountNo INT NOT NULL,
    companyDep VARCHAR(50) NOT NULL,
    companyName VARCHAR(50) NOT NULL,
    contactEmail VARCHAR(50) NOT NULL,
    contactPhone VARCHAR(20) NOT NULL,
    CONSTRAINT company_customer_pk PRIMARY KEY(accountNo),
    CONSTRAINT copmany_ck01 UNIQUE (companyDep,companyName,contactEmail,contactPhone),
    CONSTRAINT comp_customer_fk01 FOREIGN KEY (accountNo) REFERENCES customers(accountNo)
);

-- create bill table
	-- orderNumber: the number of a given order
    -- paymentType: type of payment to pay for the bill
	-- accountNo: account number of the customer
CREATE TABLE Bill (
    orderNumber INT NOT NULL,
    paymentType VARCHAR(20) NOT NULL,
    AccountNo INT,
    CONSTRAINT Bill_pk PRIMARY KEY (orderNumber, paymentType),
    CONSTRAINT Bill_customer_fk01 FOREIGN KEY (AccountNo) REFERENCES customers(AccountNo)
);

-- create orders table
	-- orderNumber: the number of a given order
    -- paymentType: type of payment to pay for the bill
    -- orderDateTime: the date and time in which the order took place
    -- accountNo: account number of the customer
CREATE TABLE Orders (
    orderNumber INT NOT NULL,
    paymentType VARCHAR(20),
    orderDateTime DATETIME,
    AccountNo INT,
    CONSTRAINT Order_pk PRIMARY KEY (orderNumber),
    CONSTRAINT Order_customer_fk01 FOREIGN KEY (AccountNo) REFERENCES customers(AccountNo),
    CONSTRAINT Order_Bill_fk02 FOREIGN KEY (orderNumber, paymentType) REFERENCES Bill(orderNumber, paymentType)
);

-- create instance of an order with a given item from the menu
	-- orderNumber: the number of a given order
    -- orderItemNum: the number of the instace of the given order
    -- menuItemNum: the item number of the item in the menu
    -- menu: the name of the menu
    -- meat: the name of the type of meat
    -- spiciness: the name of the type of spiciness
create table OrderItem(
    orderNumber int not null,
    orderItemNum int not null,
    menuItemNum int not null,
    menu varchar(20) not null,
    meat varchar(20) not null,
    spiciness varchar(20),
    primary key (orderNumber, orderItemNum),
    constraint orderItem_orders_fk01 foreign key (orderNumber) references Orders(orderNumber),
    constraint orderItem_menuPrices_fk01 foreign key (menuItemNum, menu) references MenuPrices(menuItemNum, menu),
    constraint orderItem_meats_fk01 foreign key (meat) references Meats(name),
    constraint orderItem_spiceLevels_fk01 foreign key (spiciness) references SpiceLevels(name));
    
-- create table for online orders
	-- orderNumber: the number of a given order
    -- OrdererEmail: the email address of the customer
    -- EstPickupTime: an estimated pickup time for when the food is ready
    -- ReadyPickupTime: the actual time the order is ready
CREATE TABLE `Online` (
    orderNumber INT NOT NULL,
    OrdererEmail VARCHAR(35),
    EstPickupTime TIMESTAMP,
    ReadyPickupTime TIMESTAMP,
    CONSTRAINT Online_pk PRIMARY KEY (orderNumber),
    CONSTRAINT Online_Order_fk01 FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber)
);

-- create phone orders table
	-- orderNumber: the number of a given order
    -- phoneNumber: phone number of the customeer
    -- EstPickupTime: an estimated pickup time for when the food is ready
    -- ReadyPickupTime: the actual time the order is ready
CREATE TABLE Phone (
    orderNumber INT NOT NULL,
    PhonerNumber VARCHAR(20),
    EstPickupTime TIMESTAMP,
    ReadyPickupTime TIMESTAMP,
    CONSTRAINT Phone_pk PRIMARY KEY (orderNumber),
    CONSTRAINT Phone_Order_fk01 FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber)
);

-- create table for dine in orders
	-- orderNumber: the number of a given order
CREATE TABLE EatIn (
    orderNumber INT NOT NULL,
    CONSTRAINT EatIn_pk PRIMARY KEY (orderNumber),
    CONSTRAINT EatIn_Order_fk01 FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber)
);

-- create table for the individual table numbers in the restaurant
	-- tableNumber: the table number of a table
CREATE TABLE `Table` (
    TableNumber INT NOT NULL,
    CONSTRAINT Table_pk PRIMARY KEY (TableNumber)
);

-- create table for seat instance of a customer when they dine in
	-- tableNumber: the table number of a table
    -- seatNumber: the seat number on the specified table
    -- orderNumber: the number of a given order
    -- empID: employee ID
CREATE TABLE Seat (
    TableNumber INT NOT NULL,
    SeatNumber INT NOT NULL,
    orderNumber INT NOT NULL,
    empID INT NOT NULL,
    CONSTRAINT Seat_pk PRIMARY KEY (TableNumber, SeatNumber, orderNumber, empID),
    CONSTRAINT Seat_Table_fk01 FOREIGN KEY (TableNumber) REFERENCES `Table`(TableNumber),
    CONSTRAINT Seat_EatIn_fk02 FOREIGN KEY (orderNumber) REFERENCES EatIn(orderNumber),
    CONSTRAINT Seat_waitStaff_fk03 FOREIGN KEY (empID) REFERENCES waitStaff(empID)
);


-- DROP DATABASE mimings_cuisine;