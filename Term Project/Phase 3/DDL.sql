CREATE DATABASE mimings_cuisine;	
use mimings_cuisine;

CREATE TABLE employees (
	empID			INT NOT NULL,
    empName			VARCHAR(20) NOT NULL,
	dob				DATE NOT NULL,
    designatedArea	VARCHAR(15) NOT NULL,
    incomeType		VARCHAR(10),
    CONSTRAINT emp_pk PRIMARY KEY (empID),
    CONSTRAINT emp_uk01 UNIQUE (empName, dob, designatedArea)
);

CREATE TABLE manager (
	empID		INT NOT NULL,
    CONSTRAINT manager_pk PRIMARY KEY (empID),
    CONSTRAINT manager_employees__fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE chef (
	empID		INT NOT NULL,
    CONSTRAINT chef_pk PRIMARY KEY (empID),
    CONSTRAINT chef_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE headChef (
	empID		INT NOT NULL,
    CONSTRAINT headChef_pk PRIMARY KEY (empID),
    CONSTRAINT headChef_chef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

CREATE TABLE recipes (
	recipeNo	INT NOT NULL,
	recipeName	VARCHAR(30) NOT NULL,
    chefID		INT NOT NULL,
    CONSTRAINT recipes_pk PRIMARY KEY (recipeNo),
    CONSTRAINT recipes_headChef_fk01 FOREIGN KEY (chefID) REFERENCES headChef(empID),
    CONSTRAINT recipes_uk01 UNIQUE (recipeName, chefID)
);

CREATE TABLE sousChef (
	empID		INT NOT NULL,
    CONSTRAINT sousChef_pk PRIMARY KEY (empID),
    CONSTRAINT sousChef_chef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

create table Menus(
    name varchar(20) not null,
    primary key (name));
    
create table AvailableDays(
    dayName varchar(10) not null,
    primary key (dayName));
    
create table MenuUsage(
    name varchar(20) not null,
    day varchar(10) not null,
    useStartTime time not null,
    useEndTime time not null,
    primary key (name, day),
    constraint menuUsage_menus_fk01 foreign key (name) references Menus(name),
    constraint menuUsage_availableDays_fk01 foreign key (day) references AvailableDays(dayName));
    
create table Meats(
    name varchar(20) not null,
    primary key (name));
    
create table SpiceLevels(
    name varchar(20) not null,
    primary key (name));
    
create table MenuItems(
    itemNum int not null,
    name varchar(40) not null,
    description varchar(200) not null,
    recipeNo int not null,
    primary key (itemNum),
    constraint menuItems_uk01 unique (name, description),
    constraint menuItems_recipes_fk01 foreign key (recipeNo) references recipes(recipeNo));
    
create table MenuPrices(
    menuItemNum int not null,
    menu varchar(20) not null,
    price decimal(5,2) not null,
    primary key (menuItemNum, menu),
    constraint menuPrices_menuItems_fk01 foreign key (menuItemNum) references MenuItems(itemNum),
    constraint menuPrices_menu_fk01 foreign key (menu) references Menus(name));

CREATE TABLE expertise (
    itemNum 	INT NOT NULL,
    chefID		INT NOT NULL,
    CONSTRAINT expertise_pk PRIMARY KEY (itemNum, chefID),
    CONSTRAINT expertise_menuItems_fk01 FOREIGN KEY (itemNum) REFERENCES MenuItems(itemNum),
    CONSTRAINT expertise_sousChef_fk02 FOREIGN KEY (chefID) REFERENCES sousChef(empID)
);

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

CREATE TABLE lineCook (
    empID		INT NOT NULL,
    CONSTRAINT lineCook_pk PRIMARY KEY (empID),
    CONSTRAINT lineCook_chef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

CREATE TABLE station (
    stationName	VARCHAR(10) NOT NULL,
    CONSTRAINT station_pk PRIMARY KEY (stationName)
);

CREATE TABLE maitre_d (
    empID		INT NOT NULL,
    CONSTRAINT maitre_d_pk PRIMARY KEY (empID),
    CONSTRAINT maitre_d_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE dishwasher (
	empID		INT NOT NULL,
    CONSTRAINT dishwasher_pk PRIMARY KEY (empID),
    CONSTRAINT dishwasher_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE waitStaff (
	empID		INT NOT NULL,
    CONSTRAINT waitStaff_pk PRIMARY KEY (empID),
    CONSTRAINT waitStaff_employees_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE timeOfDay (
	dayType		VARCHAR(10) NOT NULL,
    CONSTRAINT timeOfDay_pk PRIMARY KEY (dayType)
);

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

CREATE TABLE customer (
    accountNo INT NOT NULL,
    city VARCHAR (15),
    address VARCHAR(30),
    state VARCHAR(2),
    custName VARCHAR(20),
    mimingMoney INT,
    CONSTRAINT customers_pk PRIMARY KEY (accountNo),
    CONSTRAINT customers_uk01 UNIQUE (city, address, state, custName)
);

CREATE TABLE individual (
    accountNo INT NOT NULL,
    emailAddress VARCHAR(25) NOT NULL,
    DOB DATE NOT NULL,
    CONSTRAINT individual_customer_pk PRIMARY KEY(accountNo),
    CONSTRAINT individual_uk01 UNIQUE (emailAddress,DOB),
    CONSTRAINT ind_customer_fk01 FOREIGN KEY (accountNo) REFERENCES customer(accountNo)
);

CREATE TABLE company (
    accountNo INT NOT NULL,
    companyDep VARCHAR(15) NOT NULL,
    companyName VARCHAR(20) NOT NULL,
    contactEmail VARCHAR(25) NOT NULL,
    contactPhone VARCHAR(10) NOT NULL,
    CONSTRAINT company_customer_pk PRIMARY KEY(accountNo),
    CONSTRAINT copmany_ck01 UNIQUE (companyDep,companyName,contactEmail,contactPhone),
    CONSTRAINT comp_customer_fk01 FOREIGN KEY (accountNo) REFERENCES customer(accountNo)
);

CREATE TABLE Bill (
    orderNumber INT NOT NULL,
    paymentType VARCHAR(20) NOT NULL,
    AccountNo INT,
    CONSTRAINT Bill_pk PRIMARY KEY (orderNumber, paymentType),
    CONSTRAINT Bill_customer_fk01 FOREIGN KEY (AccountNo) REFERENCES customer(AccountNo)
);

CREATE TABLE Orders (
    orderNumber INT NOT NULL,
    paymentType VARCHAR(20),
    orderDateTime DATETIME,
    AccountNo INT,
    CONSTRAINT Order_pk PRIMARY KEY (orderNumber),
    CONSTRAINT Order_customer_fk01 FOREIGN KEY (AccountNo) REFERENCES customer(AccountNo),
    CONSTRAINT Order_Bill_fk02 FOREIGN KEY (orderNumber, paymentType) REFERENCES Bill(orderNumber, paymentType)
    
);

create table OrderItem(
    orderNumber int not null,
    orderItemNum int not null,
    menuItemNum int not null,
    menu varchar(20) not null,
    meat varchar(20) not null,
    spiciness varchar(20) not null,
    primary key (orderNumber, orderItemNum),
    constraint orderItem_orders_fk01 foreign key (orderNumber) references Orders(orderNumber),
    constraint orderItem_menuPrices_fk01 foreign key (menuItemNum, menu) references MenuPrices(menuItemNum, menu),
    constraint orderItem_meats_fk01 foreign key (meat) references Meats(name),
    constraint orderItem_spiceLevels_fk01 foreign key (spiciness) references SpiceLevels(name));
    
CREATE TABLE `Online` (
    orderNumber INT NOT NULL,
    OrdererEmail VARCHAR(35),
    EstPickupTime TIMESTAMP,
    ReadyPickupTime TIMESTAMP,
    CONSTRAINT Online_pk PRIMARY KEY (orderNumber),
    CONSTRAINT Online_Order_fk01 FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber)
);
CREATE TABLE Phone (
    orderNumber INT NOT NULL,
    PhonerNumber VARCHAR(20),
    EstPickupTime TIMESTAMP,
    ReadyPickupTime TIMESTAMP,
    CONSTRAINT Phone_pk PRIMARY KEY (orderNumber),
    CONSTRAINT Phone_Order_fk01 FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber)
);
CREATE TABLE EatIn (
    orderNumber INT NOT NULL,
    CONSTRAINT EatIn_pk PRIMARY KEY (orderNumber),
    CONSTRAINT EatIn_Order_fk01 FOREIGN KEY (orderNumber) REFERENCES Orders(orderNumber)
);
CREATE TABLE `Table` (
    TableNumber INT NOT NULL,
    CONSTRAINT Table_pk PRIMARY KEY (TableNumber)
);
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