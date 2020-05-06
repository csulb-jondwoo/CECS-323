use mimings_cuisine;

-- ALTER TABLE shift 
-- ADD CONSTRAINT shift_empShift_fk04 FOREIGN KEY (managerID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType),
-- ADD CONSTRAINT shift__empShift_fk05 FOREIGN KEY (chefID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType);

-- SET FOREIGN_KEY_CHECKS=0; when inserting into shift and empshift
-- SET FOREIGN_KEY_CHECKS=1; after done

-- Data for employees
INSERT INTO employees (empID, empName, dob, designatedArea, incomeType)
VALUES ('1001','Felicity Castaneda','1980-09-18','BOH','Salary'),
 ('1001','Felicity Castaneda','1983-12-01','BOH','Salary'),
 ('1002','Zayne Bonilla','2003-12-31','BOH','Salary'),
 ('1003','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1004','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1005','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1006','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1007','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1008','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1009','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1010','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1011','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1012','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1013','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1014','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1015','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1016','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1017','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1018','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1019','Felicity Castaneda','2003-12-31','BOH','Salary'),
 ('1020','Felicity Castaneda','2003-12-31','BOH','Salary');

# NEED ACCOUNTNO (FOR ORDERS AND BILL) FROM OMAR's CUSTOMER CLASS
# NEED EMPID (FOR SEATS) FROM JON's WAITSTAFF CLASS
INSERT INTO Orders (orderNumber, paymentType, orderDateTime, AccountNo)
VALUES 
('1000'	,'Credit Card'		,'2020-01-01 9:30:00'	,'1000'),
('1001'	,'Cash'				,'2020-01-01 10:00:00'	,'1000'),
('1002'	,'Debit Card'		,'2020-01-01 14:30:00'	,'1000'),
('1003'	,'Miming\'s Money'	,'2020-01-01 17:00:00'	,'1000'),
('1004'	,'Debit Card'		,'2020-01-02 10:45:00'	,'1000'),
('1005'	,'Credit Card'		,'2020-01-02 14:30:00'	,'1000'),
('1006'	,'Credit Card'		,'2020-01-02 15:15:00'	,'1000'),
('1007'	,'Cash'				,'2020-01-02 16:00:00'	,'1000'),
('1008'	,'Cash'				,'2020-01-02 16:30:00'	,'1000'),
('1009'	,'Credit Card'		,'2020-01-03 8:30:00'	,'1000'),
('1010'	,'Miming\'s Money'	,'2020-01-03 10:15:00'	,'1000'),
('1011'	,'Cash'				,'2020-01-03 10:30:00'	,'1000'),
('1012'	,'Credit Card'		,'2020-01-03 11:45:00'	,'1000'),
('1013'	,'Miming\'s Money'	,'2020-01-03 13:30:00'	,'1000'),
('1014'	,'Credit Card'		,'2020-01-04 8:30:00'	,'1000'),
('1015'	,'Debit Card'		,'2020-01-04 10:15:00'	,'1000'),
('1016'	,'Debit Card'		,'2020-01-04 14:15:00'	,'1000'),
('1017'	,'Credit Card'		,'2020-01-04 15:00:00'	,'1000'),
('1018'	,'Cash'				,'2020-01-05 7:45:00'	,'1000'),
('1019'	,'Credit Card'		,'2020-01-06 8:30:00'	,'1000'),
('1020'	,'Debit Card'		,'2020-01-06 9:45:00'	,'1000'),
('1021'	,'Miming\'s Money'	,'2020-01-06 13:00:00'	,'1000'),
('1022'	,'Miming\'s Money'	,'2020-01-07 9:30:00'	,'1000'),
('1023'	,'Cash'				,'2020-01-07 10:15:00'	,'1000'),
('1024'	,'Credit Card'		,'2020-01-07 13:45:00'	,'1000'),
('1025'	,'Debit Card'		,'2020-01-08 10:30:00'	,'1000'),
('1026'	,'Credit Card'		,'2020-01-08 12:30:00'	,'1000'),
('1027'	,'Credit Card'		,'2020-01-08 14:15:00'	,'1000'),
('1028'	,'Debit Card'		,'2020-01-08 14:45:00'	,'1000'),
('1029'	,'Credit Card'		,'2020-01-08 15:15:00'	,'1000');

INSERT INTO `Online` (orderNumber, OrdererEmail, EstPickupTime, ReadyPickupTime)
VALUES 
('1000'	,''				,'2020-01-01 9:45:00'	,'2020-01-01 9:45:00'),
('1001'	,''				,'2020-01-01 10:45:00'	,'2020-01-01 11:00:00'),
('1002'	,''				,'2020-01-01 14:45:00'	,'2020-01-01 14:45:00'),
('1003'	,''				,'2020-01-01 17:15:00'	,'2020-01-01 17:15:00'),
('1004'	,''				,'2020-01-02 11:45:00'	,'2020-01-02 12:00:00'),
('1005'	,''				,'2020-01-02 15:00:00'	,'2020-01-02 15:30:00'),
('1006'	,''				,'2020-01-02 15:45:00'	,'2020-01-02 15:45:00'),
('1007'	,''				,'2020-01-02 16:15:00'	,'2020-01-02 16:15:00'),
('1008'	,''				,'2020-01-02 16:45:00'	,'2020-01-02 17:00:00'),
('1009'	,''				,'2020-01-03 9:15:00'	,'2020-01-03 9:30:00');

INSERT INTO Phone (orderNumber, PhonerNumber, EstPickupTime, ReadyPickupTime)
VALUES 
('1010'	,''				,'2020-01-03 11:15:00'	,'2020-01-03 10:45:00'),
('1011'	,''				,'2020-01-03 11:15:00'	,'2020-01-03 11:45:00'),
('1012'	,''				,'2020-01-03 12:15:00'	,'2020-01-03 12:00:00'),
('1013'	,''				,'2020-01-03 14:30:00'	,'2020-01-03 14:15:00'),
('1014'	,''				,'2020-01-04 9:00:00'	,'2020-01-04 9:15:00'),
('1015'	,''				,'2020-01-04 10:30:00'	,'2020-01-04 10:45:00'),
('1016'	,''				,'2020-01-04 14:30:00'	,'2020-01-04 14:30:00'),
('1017'	,''				,'2020-01-04 15:15:00'	,'2020-01-04 15:30:00'),
('1018'	,''				,'2020-01-05 8:45:00'	,'2020-01-05 9:00:00'),
('1019'	,''				,'2020-01-06 9:30:00'	,'2020-01-06 9:45:00');

INSERT INTO EatIn (orderNumber)
VALUES
('1020'),
('1021'),
('1022'),
('1023'),
('1024'),
('1025'),
('1026'),
('1027'),
('1028'),
('1029');

INSERT INTO `Table` (TableNumber)
VALUES
('0'),
('1'),
('2'),
('3'),
('4'),
('5'),
('6'),
('7'),
('8'),
('9'),
('10'),
('11'),
('12'),
('13'),
('14'),
('15'),
('16'),
('17'),
('18'),
('19');

INSERT INTO Seat (TableNumber, SeatNumber, orderNumber, empID)
VALUES
('0'	, '1'	, '1020'	, '1000'),
('2'	, '3'	, '1021'	, '1000'),
('3'	, '1'	, '1022'	, '1000'),
('5'	, '3'	, '1023'	, '1000'),
('6'	, '1'	, '1024'	, '1000'),
('7'	, '5'	, '1025'	, '1000'),
('10'	, '4'	, '1026'	, '1000'),
('13'	, '2'	, '1027'	, '1000'),
('15'	, '5'	, '1028'	, '1000'),
('18'	, '4'	, '1029'	, '1000');

INSERT INTO Bill (orderNumber, paymentType, AccountNo)
VALUES
('1000'	,'Credit Card'		, '1000'),
('1001'	,'Cash'				, '1000'),
('1002'	,'Debit Card'		, '1000'),
('1003'	,'Miming\'s Money'	, '1000'),
('1004'	,'Debit Card'		, '1000'),
('1005'	,'Credit Card'		, '1000'),
('1006'	,'Credit Card'		, '1000'),
('1007'	,'Cash'				, '1000'),
('1008'	,'Cash'				, '1000'),
('1009'	,'Credit Card'		, '1000'),
('1010'	,'Miming\'s Money'	, '1000'),
('1011'	,'Cash'				, '1000'),
('1012'	,'Credit Card'		, '1000'),
('1013'	,'Miming\'s Money'	, '1000'),
('1014'	,'Credit Card'		, '1000'),
('1015'	,'Debit Card'		, '1000'),
('1016'	,'Debit Card'		, '1000'),
('1017'	,'Credit Card'		, '1000'),
('1018'	,'Cash'				, '1000'),
('1019'	,'Credit Card'		, '1000'),
('1020'	,'Debit Card'		, '1000'),
('1021'	,'Miming\'s Money'	, '1000'),
('1022'	,'Miming\'s Money'	, '1000'),
('1023'	,'Cash'				, '1000'),
('1024'	,'Credit Card'		, '1000'),
('1025'	,'Debit Card'		, '1000'),
('1026'	,'Credit Card'		, '1000'),
('1027'	,'Credit Card'		, '1000'),
('1028'	,'Debit Card'		, '1000'),
('1029'	,'Credit Card'		, '1000');

insert into menus (name)
    values ('Evening'),
    ('Lunch'),
    ('Childrens'),
    ('Sunday Brunch Buffet');
    
insert into AvailableDays (dayName)
    values ('Sunday'),
    ('Monday'),
    ('Tuesday'),
    ('Wednesday'),
    ('Thursday'),
    ('Friday'),
    ('Saturday');
    
insert into meats (name)
values ('Chefs Special'),
    ('Pork'),
    ('Chicken'),
    ('Beef'),
    ('Seafood'),
    ('Vegetables'),
    ('N/A');
    
insert into SpiceLevels (name)
values ('Tangy'),
    ('Piquant'),
    ('Hot'),
    ('Oh My God');
    
insert into MenuItems (itemNum, name, description, recipeNo)
    values (1, 'Hot and Sour Soup', 'Spicy and savory soup, made with pork, mushrooms, bamboo shoots, tofu, and eggs in a savory seasoned broth with soy sauce and vinegar.', 1),
    (2, 'Wonton Soup', 'Light and airy pork wontons in a chicken broth.', 2),
    (3, 'Egg Drop Soup', 'Wispy beaten eggs in boiled chicken broth.', 3),
    (4, 'Fried Wontons', 'Tender wrappers stuffed with ground pork, mushrooms and seasonings, then deep fried to crispy golden brown', 4),
    (5, 'Egg Rolls', 'Deep-fried appetizers. Savory roll with shredded cabbage, chopped pork, and other fillings.', 5),
    (6, 'Chow Mein', 'Chinese stir-fried noodles with choice of meat.', 6),
    (7, 'Egg Foo Young', 'Chinese egg omelette dish made with an easy gravy topping, vegatable and choice of meat', 7),
    (8, 'Chop Suey', 'Choice of meat and eggs, cooked quickly with vegetables such as bean sprouts, cabbage, and celery and flavorful ', 8);
    
insert into menuusage (name, day, useStartTime, useEndTime) 
    values ('Lunch', 'Monday', '10:00', '14:00'),
    ('Lunch', 'Tuesday', '10:00', '14:00'),
    ('Lunch', 'Wednesday', '10:00', '14:00'),
    ('Lunch', 'Thursday', '10:00', '14:00'),
    ('Lunch', 'Friday', '10:00', '14:00'),
    ('Lunch', 'Saturday', '10:00', '14:00'),
    ('Evening', 'Monday', '14:00', '23:00'),
    ('Evening', 'Tuesday', '14:00', '23:00'),
    ('Evening', 'Wednesday', '14:00', '23:00'),
    ('Evening', 'Thursday', '14:00', '23:00'),
    ('Evening', 'Friday', '14:00', '23:00'),
    ('Evening', 'Saturday', '14:00', '23:00'),
    ('Evening', 'Sunday', '10:00', '23:00'),
    ('Childrens', 'Monday', '10:00', '23:00'),
    ('Childrens', 'Tuesday', '10:00', '23:00'),
    ('Childrens', 'Wednesday', '10:00', '23:00'),
    ('Childrens', 'Thursday', '10:00', '23:00'),
    ('Childrens', 'Friday', '10:00', '23:00'),
    ('Childrens', 'Saturday', '10:00', '23:00'),
    ('Childrens', 'Sunday', '10:00', '23:00'),
    ('Sunday Brunch Buffet', 'Sunday', '10:00', '14:00');
