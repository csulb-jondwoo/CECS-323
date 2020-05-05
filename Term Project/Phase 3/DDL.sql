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

-- placeholder until shak's implementation
-- required for expertise table 
CREATE TABLE menuItems (
	recipeNo		INT(3),
    itemNum			INT(2),
    itemName		VARCHAR(30),
    itemDescription	VARCHAR(50),
    CONSTRAINT menuItems_pk PRIMARY KEY (itemNum),
    CONSTRAINT menuItem_uk01 UNIQUE (itemName, itemDescription)
);

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






-- DROP DATABASE mimings_cuisine;