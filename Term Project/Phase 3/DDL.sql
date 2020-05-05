CREATE DATABASE mimings_cuisine;
use mimings_cuisine;

-- create tables for Staff
CREATE TABLE employees (
	empID			INT(5),
    empName			VARCHAR(20),
	dob				DATE,
    designatedArea	VARCHAR(15),
    incomeType		VARCHAR(10),
    CONSTRAINT emp_pk PRIMARY KEY (empID),
    CONSTRAINT emp_uk01 UNIQUE (empName, dob, designatedArea)
);

CREATE TABLE manager (
	empID		INT(5),
    CONSTRAINT manager_pk PRIMARY KEY (empID),
    CONSTRAINT manager_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE chef (
	empID		INT(5),
    CONSTRAINT chef_pk PRIMARY KEY (empID),
    CONSTRAINT chef_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE headChef (
	empID		INT(5),
    CONSTRAINT headChef_pk PRIMARY KEY (empID),
    CONSTRAINT headChef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

CREATE TABLE recipes (
	recipeNo	INT(3),
	recipeName	VARCHAR(30),
    chefID		INT(5),
    CONSTRAINT recipes_pk PRIMARY KEY (recipeNo),
    CONSTRAINT recipes_fk01 FOREIGN KEY (chefID) REFERENCES headChef(empID),
    CONSTRAINT recipes_uk01 UNIQUE (recipeName, chefID)
);

CREATE TABLE sousChef (
	empID		INT(5),
    CONSTRAINT sousChef_pk PRIMARY KEY (empID),
    CONSTRAINT sousChef_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
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
    itemNum int(2) not null,
    name varchar(40) not null,
    description varchar(200) not null,
    recipeNo int(3) not null,
    primary key (itemNum),
    constraint menuItems_uk01 unique (name, description),
    constraint menuItems_recipes_fk01 foreign key (recipeNo) references recipes(recipeNo));
    
create table MenuPrices(
    menuItemNum int(2) not null,
    menu varchar(20) not null,
    price decimal(5,2) not null,
    primary key (menuItemNum, menu),
    constraint menuPrices_menuItems_fk01 foreign key (menuItemNum) references MenuItems(itemNum),
    constraint menuPrices_menu_fk01 foreign key (menu) references menus(name));

CREATE TABLE expertise (
    itemNum 	INT(2),
    chefID		INT(5),
    CONSTRAINT expertise_pk PRIMARY KEY (itemNum, chefID),
    CONSTRAINT expertse_fk01 FOREIGN KEY (itemNum) REFERENCES menuItems(itemNum),
    CONSTRAINT expertse_fk02 FOREIGN KEY (chefID) REFERENCES sousChef(empID)
);

CREATE TABLE mentorship (
    itemNum		INT(3),
    mentorID	INT(5),
    menteeID	INT(5),
    startDate	DATE,
    endDate		DATE,
    CONSTRAINT mentorship_pk PRIMARY KEY (itemNum, mentorID, menteeID),
    CONSTRAINT mentorship_fk01 FOREIGN KEY (itemNum, mentorID) REFERENCES expertise(itemNum, chefID),
    CONSTRAINT mentorship_fk02 FOREIGN KEY (menteeID) REFERENCES sousChef(empID)
);

CREATE TABLE lineCook (
    empID		INT(5),
    CONSTRAINT lineCook_pk PRIMARY KEY (empID),
    CONSTRAINT lineCook_fk01 FOREIGN KEY (empID) REFERENCES chef(empID)
);

CREATE TABLE station (
    stationName	VARCHAR(10),
    CONSTRAINT station_pk PRIMARY KEY (stationName)
);

CREATE TABLE maitre_d (
    empID		INT(5),
    CONSTRAINT maitre_d_pk PRIMARY KEY (empID),
    CONSTRAINT maitre_d_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE dishwasher (
	empID		INT(5),
    CONSTRAINT dishwasher_pk PRIMARY KEY (empID),
    CONSTRAINT dishwasher_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE waitStaff (
	empID		INT(5),
    CONSTRAINT waitStaff_pk PRIMARY KEY (empID),
    CONSTRAINT waitStaff_fk01 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE timeOfDay (
	dayType		VARCHAR(10),
    CONSTRAINT timeOfDay_pk PRIMARY KEY (dayType)
);

CREATE TABLE shift (
	shiftDate	DATE,
    dayType		VARCHAR(10),
    managerID	INT(5),
    chefID		INT(5),
    CONSTRAINT shift_pk PRIMARY KEY (shiftDate, dayType),
    CONSTRAINT shift_fk01 FOREIGN KEY (managerID) REFERENCES manager(empID),
    CONSTRAINT shift_fk02 FOREIGN KEY (chefID) REFERENCES headChef(empID),
    CONSTRAINT shift_fk03 FOREIGN KEY (dayType) REFERENCES timeOfDay(dayType)
    
    -- how to add if these foreign keys are primary keys for empShift table which needs foreign keys migrated from shift table 
    --  CONSTRAINT shift_fk04 FOREIGN KEY (shiftDate, dayType, managerID) REFERENCES empShift(empID, shiftDate, dayType), 
    --  CONSTRAINT shift_fk05 FOREIGN KEY (shiftDate, dayType, chefID) REFERENCES empShift(empID, shiftDate, dayType) 
);

CREATE TABLE empShift (
	empID		INT(5),
    shiftDate	DATE,
    dayType		VARCHAR(10),
    managerID	INT(5),
    chefID		INT(5),
    CONSTRAINT empShift_pk PRIMARY KEY (empID, shiftDate, dayType),
    CONSTRAINT empShift_fk01 FOREIGN KEY (shiftDate, dayType) REFERENCES shift(shiftDate, dayType),
    CONSTRAINT empShift_fk02 FOREIGN KEY (empID) REFERENCES employees(empID)
);

CREATE TABLE lineCookStation (
	stationName	VARCHAR(10),
    chefID		INT(5),
    shiftDate	DATE,
    dayType		VARCHAR(10),
    CONSTRAINT lineCookStation_pk PRIMARY KEY (stationName, chefID, shiftDate, dayType),
    CONSTRAINT lineCookStation_fk01 FOREIGN KEY (stationName) REFERENCES station(stationName),
    CONSTRAINT lineCookStation_fk02 FOREIGN KEY (chefID) REFERENCES lineCook(empID),
    CONSTRAINT lineCookStation_fk03 FOREIGN KEY (chefID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType)
);


create table OrderItem(
    orderNumber int not null,
    orderDateTime datetime not null,
    orderItemNum int not null,
    menuItemNum int not null,
    menu varchar(20) not null,
    meat varchar(20) not null,
    spiciness varchar(20) not null,
    primary key (orderNumber, orderDateTime, orderItemNum),
    constraint orderItem_orders_fk01 foreign key (orderNumber, orderDateTime) references Orders(orderNumber, orderDateTime),
    constraint orderItem_menuPrices_fk01 foreign key (menuItemNum, menu) references MenuPrices(menuItemNum, menu),
    constraint orderItem_meats_fk01 foreign key (meat) references Meats(name),
    constraint orderItem_spiceLevels_fk01 foreign key (spiciness) references SpiceLevels(name));




-- DROP DATABASE mimings_cuisine;
