use mimings_cuisine;

-- ALTER TABLE shift 
-- ADD CONSTRAINT shift_empShift_fk04 FOREIGN KEY (managerID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType),
-- ADD CONSTRAINT shift__empShift_fk05 FOREIGN KEY (chefID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType);

-- before inserting into shift and empshift
-- SET FOREIGN_KEY_CHECKS=0; 

-- after inserting
-- SET FOREIGN_KEY_CHECKS=1; 

INSERT INTO employees (empID, empName, dob, designatedArea, incomeType)
VALUES 
(1004, 'Shona Kidd', '1993-03-19', 'BOH', 'Salary'),
(1015, 'Sharna Gaines', '1993-03-07', 'BOH', 'Salary'),
(1016, 'Edward Mercer', '1991-04-27', 'BOH', 'Salary'),
(1017, 'Giselle Joyce', '1984-11-18', 'BOH', 'Salary'),
(1101, 'Angela Mcdonald', '1989-01-26', 'BOH', 'Salary'),
(1114, 'Guy Salas', '1988-05-14', 'BOH', 'Salary'),
(1142, 'Tina Thompson', '1983-12-06', 'BOH', 'Salary'),
(1145, 'Khadija Espinoza', '1987-03-25', 'BOH', 'Salary'),
(1149, 'Montgomery Pena', '1985-01-19', 'BOH', 'Salary'),
(1152, 'Emme Houston', '1994-01-25', 'BOH', 'Salary'),
(1153, 'Nancie Colley', '1995-10-29', 'BOH', 'Salary'),
(1208, 'Kaeden Swan', '1994-02-04', 'BOH', 'Salary'),
(1215, 'Catrin Hall', '1980-04-03', 'BOH', 'Salary'),
(1223, 'Beauden Reynolds', '1982-03-04', 'BOH', 'Salary'),
(1235, 'Stanislaw Clark', '1996-09-26', 'BOH', 'Salary'),
(1236, 'Viktoria Watson', '1988-03-19', 'BOH', 'Salary'),
(1239, 'Ashton Buck', '1985-11-30', 'BOH', 'Salary'),
(1240, 'Zoha Whelan', '1988-01-06', 'BOH', 'Salary'),
(1241, 'Jeanne Sanford', '1994-06-23', 'BOH', 'Salary'),
(1247, 'Emilija Padilla', '1988-05-20', 'BOH', 'Salary'),
(2008, 'Weronika Day', '1998-10-17', 'FOH', 'Hourly'),
(2082, 'Warwick Scott', '1982-02-04', 'FOH', 'Hourly'),
(2175, 'Cadi Quinn', '1988-07-12', 'FOH', 'Hourly'),
(2373, 'Iestyn Bowes', '1983-06-20', 'FOH', 'Hourly'),
(9410, 'Saniya Penn', '1996-07-26', 'FOH', 'Salary'),
(9465, 'Anas Howell', '1982-04-21', 'FOH', 'Salary'),
(9732, 'Nylah Lynn', '1986-09-16', 'FOH', 'Salary'),
(9811, 'Graeme Bailey', '1990-09-16', 'FOH', 'Salary'),
(9899, 'Ray Castillo', '1998-02-18', 'FOH', 'Salary'),
(3028, 'Alma Gibbons', '1992-01-09', 'FOH', 'Hourly'),
(3065, 'Arlene Meza', '1983-10-28', 'FOH', 'Hourly'),
(3067, 'Dimitri Sharpe', '1990-05-05', 'FOH', 'Hourly'),
(3069, 'Daisy Duran', '1991-08-28', 'FOH', 'Hourly'),
(3147, 'Vicki Crane', '1998-07-20', 'FOH', 'Hourly'),
(3178, 'Aryaan Vo', '1981-03-20', 'FOH', 'Hourly'),
(3253, 'Karam Deacon', '1991-05-08', 'FOH', 'Hourly'),
(3366, 'Mariyah Chen', '1998-09-26', 'FOH', 'Hourly'),
(3370, 'Amelia-Rose Mcfadden', '1991-08-14', 'FOH', 'Hourly'),
(3371, 'Yousif Begum', '1991-10-15', 'FOH', 'Hourly'),
(4292, 'Ioana Barrera', '1985-11-28', 'BOH', 'Hourly'),
(4314, 'Ammaarah Wright', '1993-02-02', 'BOH', 'Hourly'),
(4402, 'Sachin Orozco', '1995-09-12', 'BOH', 'Hourly');

SET FOREIGN_KEY_CHECKS=0;

INSERT INTO empShift (empID, shiftDate, dayType, managerID, chefID)
VALUES 
(1004, '2020-01-01', 'Afternoon', 9410, 1004),
(1015, '2020-01-01', 'Evening', 9410, 1004),
(1016, '2020-01-02', 'Afternoon', 9465, 1015),
(1017, '2020-01-02', 'Evening', 9465, 1015),
(1004, '2020-01-03', 'Afternoon', 9732, 1016),
(1015, '2020-01-03', 'Evening', 9732, 1016),
(1016, '2020-01-04', 'Afternoon', 9811, 1017),
(1017, '2020-01-04', 'Evening', 9811, 1017),
(1004, '2020-01-05', 'Afternoon', 9899, 1022),
(1015, '2020-01-05', 'Evening', 9899, 1022),
(1016, '2020-01-06', 'Afternoon', 9410, 1026),
(1017, '2020-01-06', 'Evening', 9410, 1026),
(1004, '2020-01-07', 'Afternoon', 9465, 1042),
(1015, '2020-01-07', 'Evening', 9465, 1042),
(1016, '2020-01-08', 'Afternoon', 9732, 1055),
(1017, '2020-01-08', 'Evening', 9732, 1055),
(1101, '2020-01-01', 'Afternoon', 9410, 1004),
(1114, '2020-01-01', 'Evening', 9410, 1004),
(1142, '2020-01-02', 'Afternoon', 9465, 1015),
(1145, '2020-01-02', 'Evening', 9465, 1015),
(1149, '2020-01-03', 'Afternoon', 9732, 1016),
(1152, '2020-01-03', 'Evening', 9732, 1016),
(1153, '2020-01-04', 'Afternoon', 9811, 1017),
(1101, '2020-01-04', 'Evening', 9811, 1017),
(1114, '2020-01-05', 'Afternoon', 9899, 1022),
(1142, '2020-01-05', 'Evening', 9899, 1022),
(1145, '2020-01-06', 'Afternoon', 9410, 1026),
(1149, '2020-01-06', 'Evening', 9410, 1026),
(1152, '2020-01-07', 'Afternoon', 9465, 1042),
(1153, '2020-01-07', 'Evening', 9465, 1042),
(1101, '2020-01-08', 'Afternoon', 9732, 1055),
(1114, '2020-01-08', 'Evening', 9732, 1055),
(1208, '2020-01-01', 'Afternoon', 9410, 1004),
(1215, '2020-01-01', 'Evening', 9410, 1004),
(1223, '2020-01-02', 'Afternoon', 9465, 1015),
(1235, '2020-01-02', 'Evening', 9465, 1015),
(1236, '2020-01-03', 'Afternoon', 9732, 1016),
(1239, '2020-01-03', 'Evening', 9732, 1016),
(1240, '2020-01-04', 'Afternoon', 9811, 1017),
(1241, '2020-01-04', 'Evening', 9811, 1017),
(1247, '2020-01-05', 'Afternoon', 9899, 1022),
(1208, '2020-01-05', 'Evening', 9899, 1022),
(1215, '2020-01-06', 'Afternoon', 9410, 1026),
(1223, '2020-01-06', 'Evening', 9410, 1026),
(1235, '2020-01-07', 'Afternoon', 9465, 1042),
(1236, '2020-01-07', 'Evening', 9465, 1042),
(1239, '2020-01-08', 'Afternoon', 9732, 1055),
(1240, '2020-01-08', 'Evening', 9732, 1055),
(2008, '2020-01-01', 'Afternoon', 9410, 1004),
(2082, '2020-01-01', 'Evening', 9410, 1004),
(2175, '2020-01-02', 'Afternoon', 9465, 1015),
(2373, '2020-01-02', 'Evening', 9465, 1015),
(2008, '2020-01-03', 'Afternoon', 9732, 1016),
(2082, '2020-01-03', 'Evening', 9732, 1016),
(2175, '2020-01-04', 'Afternoon', 9811, 1017),
(2373, '2020-01-04', 'Evening', 9811, 1017),
(2008, '2020-01-05', 'Afternoon', 9899, 1022),
(2082, '2020-01-05', 'Evening', 9899, 1022),
(2175, '2020-01-06', 'Afternoon', 9410, 1026),
(2373, '2020-01-06', 'Evening', 9410, 1026),
(2008, '2020-01-07', 'Afternoon', 9465, 1042),
(2082, '2020-01-07', 'Evening', 9465, 1042),
(2175, '2020-01-08', 'Afternoon', 9732, 1055),
(2373, '2020-01-08', 'Evening', 9732, 1055),
(9410, '2020-01-01', 'Afternoon', 9410, 1004),
(9410, '2020-01-01', 'Evening', 9410, 1004),
(9465, '2020-01-02', 'Afternoon', 9465, 1015),
(9465, '2020-01-02', 'Evening', 9465, 1015),
(9732, '2020-01-03', 'Afternoon', 9732, 1016),
(9732, '2020-01-03', 'Evening', 9732, 1016),
(9811, '2020-01-04', 'Afternoon', 9811, 1017),
(9811, '2020-01-04', 'Evening', 9811, 1017),
(9899, '2020-01-05', 'Afternoon', 9899, 1022),
(9899, '2020-01-05', 'Evening', 9899, 1022),
(9410, '2020-01-06', 'Afternoon', 9410, 1026),
(9410, '2020-01-06', 'Evening', 9410, 1026),
(9465, '2020-01-07', 'Afternoon', 9465, 1042),
(9465, '2020-01-07', 'Evening', 9465, 1042),
(9732, '2020-01-08', 'Afternoon', 9732, 1055),
(9732, '2020-01-08', 'Evening', 9732, 1055),
(3028, '2020-01-01', 'Afternoon', 9410, 1004),
(3065, '2020-01-01', 'Evening', 9410, 1004),
(3067, '2020-01-02', 'Afternoon', 9465, 1015),
(3069, '2020-01-02', 'Evening', 9465, 1015),
(3147, '2020-01-03', 'Afternoon', 9732, 1016),
(3178, '2020-01-03', 'Evening', 9732, 1016),
(3253, '2020-01-04', 'Afternoon', 9811, 1017),
(3366, '2020-01-04', 'Evening', 9811, 1017),
(3370, '2020-01-05', 'Afternoon', 9899, 1022),
(3371, '2020-01-05', 'Evening', 9899, 1022),
(3377, '2020-01-06', 'Afternoon', 9410, 1026),
(3410, '2020-01-06', 'Evening', 9410, 1026),
(3448, '2020-01-07', 'Afternoon', 9465, 1042),
(3456, '2020-01-07', 'Evening', 9465, 1042),
(3457, '2020-01-08', 'Afternoon', 9732, 1055),
(3498, '2020-01-08', 'Evening', 9732, 1055),
(4292, '2020-01-01', 'Afternoon', 9410, 1004),
(4314, '2020-01-01', 'Evening', 9410, 1004),
(4402, '2020-01-02', 'Afternoon', 9465, 1015),
(4292, '2020-01-02', 'Evening', 9465, 1015),
(4314, '2020-01-03', 'Afternoon', 9732, 1016),
(4402, '2020-01-03', 'Evening', 9732, 1016),
(4292, '2020-01-04', 'Afternoon', 9811, 1017),
(4314, '2020-01-04', 'Evening', 9811, 1017),
(4402, '2020-01-05', 'Afternoon', 9899, 1022),
(4292, '2020-01-05', 'Evening', 9899, 1022),
(4314, '2020-01-06', 'Afternoon', 9410, 1026),
(4402, '2020-01-06', 'Evening', 9410, 1026),
(4292, '2020-01-07', 'Afternoon', 9465, 1042),
(4314, '2020-01-07', 'Evening', 9465, 1042),
(4402, '2020-01-08', 'Afternoon', 9732, 1055),
(4292, '2020-01-08', 'Evening', 9732, 1055);

SET FOREIGN_KEY_CHECKS=1;

INSERT INTO chef (empID)
VALUES 
(1004),
(1015),
(1016),
(1017),
(1101),
(1114),
(1142),
(1145),
(1149),
(1152),
(1153),
(1208),
(1215),
(1223),
(1235),
(1236),
(1239),
(1240),
(1241),
(1247);

INSERT INTO headChef(empID)
VALUES 
(1004),
(1015),
(1016),
(1017);

INSERT INTO lineCook (empID)
VALUES 
(1208),
(1215),
(1223),
(1235),
(1236),
(1239),
(1240),
(1241),
(1247);

INSERT INTO station (stationName)
VALUES 
('butcher'),
('fry cook'),
('grill'),
('pantry'),
('pastry'),
('roast'),
('saute');
 
INSERT INTO lineCookStation (stationName, chefID, shiftDate, dayType)
VALUES 
('butcher', 1208, '2020-01-01', 'Afternoon'),
('butcher', 1215, '2020-01-01', 'Evening'),
('butcher', 1223, '2020-01-02', 'Afternoon'),
('butcher', 1235, '2020-01-02', 'Evening'),
('butcher', 1236, '2020-01-03', 'Afternoon'),
('butcher', 1239, '2020-01-03', 'Evening'),
('butcher', 1240, '2020-01-04', 'Afternoon'),
('butcher', 1241, '2020-01-04', 'Evening'),
('butcher', 1247, '2020-01-05', 'Afternoon'),
('butcher', 1208, '2020-01-05', 'Evening'),
('butcher', 1215, '2020-01-06', 'Afternoon'),
('butcher', 1223, '2020-01-06', 'Evening'),
('butcher', 1235, '2020-01-07', 'Afternoon'),
('fry cook', 1236, '2020-01-07', 'Evening'),
('fry cook', 1239, '2020-01-08', 'Afternoon'),
('fry cook', 1240, '2020-01-08', 'Evening'),
('fry cook', 1208, '2020-01-01', 'Afternoon'),
('fry cook', 1215, '2020-01-01', 'Evening'),
('fry cook', 1223, '2020-01-02', 'Afternoon'),
('fry cook', 1235, '2020-01-02', 'Evening'),
('fry cook', 1236, '2020-01-03', 'Afternoon'),
('fry cook', 1239, '2020-01-03', 'Evening'),
('grill', 1240, '2020-01-04', 'Afternoon'),
('grill', 1241, '2020-01-04', 'Evening'),
('grill', 1247, '2020-01-05', 'Afternoon'),
('grill', 1208, '2020-01-05', 'Evening'),
('grill', 1215, '2020-01-06', 'Afternoon'),
('grill', 1223, '2020-01-06', 'Evening'),
('grill', 1235, '2020-01-07', 'Afternoon'),
('grill', 1236, '2020-01-07', 'Evening'),
('grill', 1239, '2020-01-08', 'Afternoon'),
('grill', 1240, '2020-01-08', 'Evening'),
('grill', 1208, '2020-01-01', 'Afternoon'),
('grill', 1215, '2020-01-01', 'Evening'),
('grill', 1223, '2020-01-02', 'Afternoon'),
('pantry', 1235, '2020-01-02', 'Evening'),
('pantry', 1236, '2020-01-03', 'Afternoon'),
('pantry', 1239, '2020-01-03', 'Evening'),
('pantry', 1240, '2020-01-04', 'Afternoon'),
('pantry', 1241, '2020-01-04', 'Evening'),
('pantry', 1247, '2020-01-05', 'Afternoon'),
('pantry', 1208, '2020-01-05', 'Evening'),
('pantry', 1215, '2020-01-06', 'Afternoon'),
('pantry', 1223, '2020-01-06', 'Evening'),
('pastry', 1235, '2020-01-07', 'Afternoon'),
('pastry', 1236, '2020-01-07', 'Evening'),
('pastry', 1239, '2020-01-08', 'Afternoon'),
('pastry', 1240, '2020-01-08', 'Evening'),
('pastry', 1208, '2020-01-01', 'Afternoon'),
('pastry', 1215, '2020-01-01', 'Evening'),
('pastry', 1223, '2020-01-02', 'Afternoon'),
('pastry', 1235, '2020-01-02', 'Evening'),
('pastry', 1236, '2020-01-03', 'Afternoon'),
('pastry', 1239, '2020-01-03', 'Evening'),
('roast', 1240, '2020-01-04', 'Afternoon'),
('roast', 1241, '2020-01-04', 'Evening'),
('roast', 1247, '2020-01-05', 'Afternoon'),
('roast', 1208, '2020-01-05', 'Evening'),
('roast', 1215, '2020-01-06', 'Afternoon'),
('roast', 1223, '2020-01-06', 'Evening'),
('roast', 1235, '2020-01-07', 'Afternoon'),
('roast', 1236, '2020-01-07', 'Evening'),
('roast', 1239, '2020-01-08', 'Afternoon'),
('roast', 1240, '2020-01-08', 'Evening'),
('roast', 1208, '2020-01-01', 'Afternoon'),
('saute', 1215, '2020-01-01', 'Evening'),
('saute', 1223, '2020-01-02', 'Afternoon'),
('saute', 1235, '2020-01-02', 'Evening'),
('saute', 1236, '2020-01-03', 'Afternoon'),
('saute', 1239, '2020-01-03', 'Evening'),
('saute', 1240, '2020-01-04', 'Afternoon'),
('saute', 1241, '2020-01-04', 'Evening'),
('saute', 1247, '2020-01-05', 'Afternoon'),
('saute', 1208, '2020-01-05', 'Evening'),
('saute', 1215, '2020-01-06', 'Afternoon'),
('saute', 1223, '2020-01-06', 'Evening'),
('saute', 1235, '2020-01-07', 'Afternoon'),
('saute', 1236, '2020-01-07', 'Evening'),
('saute', 1239, '2020-01-08', 'Afternoon'),
('saute', 1240, '2020-01-08', 'Evening');

INSERT INTO maitre_d (empID)
VALUES 
(2008),
(2082),
(2175),
(2373);

INSERT INTO manager (empID)
VALUES 
(9410),
(9465),
(9732),
(9811),
(9899);

INSERT INTO timeOfDay (dayType)
VALUES 
('Afternoon'),
('Evening');

INSERT INTO shift (shiftDate, dayType, managerID, chefID)
VALUES 
('2020-01-01', 'Afternoon', 9410, 1004),
('2020-01-01', 'Evening', 9410, 1004),
('2020-01-02', 'Afternoon', 9465, 1015),
('2020-01-02', 'Evening', 9465, 1015),
('2020-01-03', 'Afternoon', 9732, 1016),
('2020-01-03', 'Evening', 9732, 1016),
('2020-01-04', 'Afternoon', 9811, 1017),
('2020-01-04', 'Evening', 9811, 1017),
('2020-01-05', 'Afternoon', 9899, 1004),
('2020-01-05', 'Evening', 9899, 1004),
('2020-01-06', 'Afternoon', 9410, 1015),
('2020-01-06', 'Evening', 9410, 1015),
('2020-01-07', 'Afternoon', 9465, 1016),
('2020-01-07', 'Evening', 9465, 1016),
('2020-01-08', 'Afternoon', 9732, 1017),
('2020-01-08', 'Evening', 9732, 1017);

INSERT INTO sousChef (empID)
VALUES 
(1101),
(1114),
(1142),
(1145),
(1149),
(1152),
(1153);

INSERT INTO waitStaff(empID)
VALUES 
(3028),
(3065),
(3067),
(3069),
(3147),
(3178),
(3253),
(3366),
(3370),
(3371);

INSERT INTO recipes (recipeNo, recipeName, chefID)
VALUES 
(1, 'Hot and Sour Soup', 1004),
(2, 'Wonton Soup', 1015),
(3, 'Egg Drop Soup', 1016),
(4, 'Fried Wontons', 1017),
(5, 'Egg Rolls', 1004),
(6, 'Chow Mein', 1015),
(7, 'Egg Foo Young', 1016),
(8, 'Chop Suey', 1017);


<<<<<<< HEAD
-- populate after customers table
-- INSERT INTO Orders (orderNumber, paymentType, orderDateTime, AccountNo)
-- VALUES 
-- ('1000','Credit Card'		,'2020-01-01 9:30:00'	,'1000'),
-- ('1001','Cash'				,'2020-01-01 10:00:00'	,'1000'),
-- ('1002','Debit Card'		,'2020-01-01 14:30:00'	,'1000'),
-- ('1003','Miming\'s Money'	,'2020-01-01 17:00:00'	,'1000'),
-- ('1004','Debit Card'		,'2020-01-02 10:45:00'	,'1000'),
-- ('1005','Credit Card'		,'2020-01-02 14:30:00'	,'1000'),
-- ('1006','Credit Card'		,'2020-01-02 15:15:00'	,'1000'),
-- ('1007','Cash'				,'2020-01-02 16:00:00'	,'1000'),
-- ('1008','Cash'				,'2020-01-02 16:30:00'	,'1000'),
-- ('1009','Credit Card'		,'2020-01-03 8:30:00'	,'1000'),
-- ('1010','Miming\'s Money'	,'2020-01-03 10:15:00'	,'1000'),
-- ('1011','Cash'				,'2020-01-03 10:30:00'	,'1000'),
-- ('1012','Credit Card'		,'2020-01-03 11:45:00'	,'1000'),
-- ('1013','Miming\'s Money'	,'2020-01-03 13:30:00'	,'1000'),
-- ('1014','Credit Card'		,'2020-01-04 8:30:00'	,'1000'),
-- ('1015','Debit Card'		,'2020-01-04 10:15:00'	,'1000'),
-- ('1016','Debit Card'		,'2020-01-04 14:15:00'	,'1000'),
-- ('1017','Credit Card'		,'2020-01-04 15:00:00'	,'1000'),
-- ('1018','Cash'				,'2020-01-05 7:45:00'	,'1000'),
-- ('1019','Credit Card'		,'2020-01-06 8:30:00'	,'1000'),
-- ('1020','Debit Card'		,'2020-01-06 9:45:00'	,'1000'),
-- ('1021','Miming\'s Money'	,'2020-01-06 13:00:00'	,'1000'),
-- ('1022','Miming\'s Money'	,'2020-01-07 9:30:00'	,'1000'),
-- ('1023','Cash'				,'2020-01-07 10:15:00'	,'1000'),
-- ('1024','Credit Card'		,'2020-01-07 13:45:00'	,'1000'),
-- ('1025','Debit Card'		,'2020-01-08 10:30:00'	,'1000'),
-- ('1026','Credit Card'		,'2020-01-08 12:30:00'	,'1000'),
-- ('1027','Credit Card'		,'2020-01-08 14:15:00'	,'1000'),
-- ('1028','Debit Card'		,'2020-01-08 14:45:00'	,'1000'),
-- ('1029','Credit Card'		,'2020-01-08 15:15:00'	,'1000');

-- populate after orders
-- INSERT INTO `Online` (orderNumber, OrdererEmail, EstPickupTime, ReadyPickupTime)
-- VALUES 
-- ('1000',''				,'2020-01-01 9:45:00'	,'2020-01-01 9:45:00'),
-- ('1001',''				,'2020-01-01 10:45:00'	,'2020-01-01 11:00:00'),
-- ('1002',''				,'2020-01-01 14:45:00'	,'2020-01-01 14:45:00'),
-- ('1003',''				,'2020-01-01 17:15:00'	,'2020-01-01 17:15:00'),
-- ('1004',''				,'2020-01-02 11:45:00'	,'2020-01-02 12:00:00'),
-- ('1005',''				,'2020-01-02 15:00:00'	,'2020-01-02 15:30:00'),
-- ('1006',''				,'2020-01-02 15:45:00'	,'2020-01-02 15:45:00'),
-- ('1007',''				,'2020-01-02 16:15:00'	,'2020-01-02 16:15:00'),
-- ('1008',''				,'2020-01-02 16:45:00'	,'2020-01-02 17:00:00'),
-- ('1009',''				,'2020-01-03 9:15:00'	,'2020-01-03 9:30:00');

-- populate after orders
-- INSERT INTO Phone (orderNumber, PhonerNumber, EstPickupTime, ReadyPickupTime)
-- VALUES 
-- ('1010',' '				,'2020-01-03 11:15:00'	,'2020-01-03 10:45:00'),
-- ('1011',''				,'2020-01-03 11:15:00'	,'2020-01-03 11:45:00'),
-- ('1012',''				,'2020-01-03 12:15:00'	,'2020-01-03 12:00:00'),
-- ('1013',''				,'2020-01-03 14:30:00'	,'2020-01-03 14:15:00'),
-- ('1014',''				,'2020-01-04 9:00:00'	,'2020-01-04 9:15:00'),
-- ('1015',''				,'2020-01-04 10:30:00'	,'2020-01-04 10:45:00'),
-- ('1016',''				,'2020-01-04 14:30:00'	,'2020-01-04 14:30:00'),
-- ('1017',''				,'2020-01-04 15:15:00'	,'2020-01-04 15:30:00'),
-- ('1018',''				,'2020-01-05 8:45:00'	,'2020-01-05 9:00:00'),
-- ('1019',''				,'2020-01-06 9:30:00'	,'2020-01-06 9:45:00');

-- populate after orders
-- INSERT INTO EatIn (orderNumber)
-- VALUES
-- ('1020'),
-- ('1021'),
-- ('1022'),
-- ('1023'),
-- ('1024'),
-- ('1025'),
-- ('1026'),
-- ('1027'),
-- ('1028'),
-- ('1029');
=======



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
('1000'	,'hedwig@aol.com'				,'2020-01-01 9:45:00'	,'2020-01-01 9:45:00'),
('1001'	,'leocharre@outlook.com'				,'2020-01-01 10:45:00'	,'2020-01-01 11:00:00'),
('1002'	,'njpayne@hotmail.com'				,'2020-01-01 14:45:00'	,'2020-01-01 14:45:00'),
('1003'	,'amichalo@gmail.com'				,'2020-01-01 17:15:00'	,'2020-01-01 17:15:00'),
('1004'	,'pthomsen@icloud.com'				,'2020-01-02 11:45:00'	,'2020-01-02 12:00:00'),
('1005'	,'elflord@gmail.com'				,'2020-01-02 15:00:00'	,'2020-01-02 15:30:00'),
('1006'	,'cantu@outlook.com'				,'2020-01-02 15:45:00'	,'2020-01-02 15:45:00'),
('1007'	,'cumarana@yahoo.ca'				,'2020-01-02 16:15:00'	,'2020-01-02 16:15:00'),
('1008'	,'lukka@msn.com'				,'2020-01-02 16:45:00'	,'2020-01-02 17:00:00'),
('1009'	,'mahbub@yahoo.ca'				,'2020-01-03 9:15:00'	,'2020-01-03 9:30:00');

INSERT INTO Phone (orderNumber, PhonerNumber, EstPickupTime, ReadyPickupTime)
VALUES 
('1010'	,'202-555-0133'				,'2020-01-03 11:15:00'	,'2020-01-03 10:45:00'),
('1011'	,'202-555-0168'				,'2020-01-03 11:15:00'	,'2020-01-03 11:45:00'),
('1012'	,'202-555-0159'				,'2020-01-03 12:15:00'	,'2020-01-03 12:00:00'),
('1013'	,'202-555-0196'				,'2020-01-03 14:30:00'	,'2020-01-03 14:15:00'),
('1014'	,'202-555-0178'				,'2020-01-04 9:00:00'	,'2020-01-04 9:15:00'),
('1015'	,'202-555-0191'				,'2020-01-04 10:30:00'	,'2020-01-04 10:45:00'),
('1016'	,'920-663-3172'				,'2020-01-04 14:30:00'	,'2020-01-04 14:30:00'),
('1017'	,'903-987-7380'				,'2020-01-04 15:15:00'	,'2020-01-04 15:30:00'),
('1018'	,'917-749-4473'				,'2020-01-05 8:45:00'	,'2020-01-05 9:00:00'),
('1019'	,'334-544-4020'				,'2020-01-06 9:30:00'	,'2020-01-06 9:45:00');

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
>>>>>>> b8c3529f27fff5793c9acc821d43e3c479e14ab3

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

-- populate after orders
-- INSERT INTO Seat (TableNumber, SeatNumber, orderNumber, empID)
-- VALUES
-- ('0', '1', '1020', '3028'),
-- ('2', '3', '1021', '3065'),
-- ('3', '1', '1022', '3067'),
-- ('5', '3', '1023', '3069'),
-- ('6', '1', '1024', '3069'),
-- ('7', '5', '1025', '3178'),
-- ('10', '4', '1026', '3178'),
-- ('13', '2', '1027', '3366'),
-- ('15', '5', '1028', '3370'),
-- ('18', '4', '1029', '3371');

-- populate after orders
-- INSERT INTO Bill (orderNumber, paymentType, AccountNo)
-- VALUES
-- ('1000','Credit Card'		, '1000'),
-- ('1001','Cash'				, '1000'),
-- ('1002','Debit Card'		, '1000'),
-- ('1003','Miming\'s Money'	, '1000'),
-- ('1004','Debit Card'		, '1000'),
-- ('1005','Credit Card'		, '1000'),
-- ('1006','Credit Card'		, '1000'),
-- ('1007','Cash'				, '1000'),
-- ('1008','Cash'				, '1000'),
-- ('1009','Credit Card'		, '1000'),
-- ('1010','Miming\'s Money'	, '1000'),
-- ('1011','Cash'				, '1000'),
-- ('1012','Credit Card'		, '1000'),
-- ('1013','Miming\'s Money'	, '1000'),
-- ('1014','Credit Card'		, '1000'),
-- ('1015','Debit Card'		, '1000'),
-- ('1016','Debit Card'		, '1000'),
-- ('1017','Credit Card'		, '1000'),
-- ('1018','Cash'				, '1000'),
-- ('1019','Credit Card'		, '1000'),
-- ('1020','Debit Card'		, '1000'),
-- ('1021','Miming\'s Money'	, '1000'),
-- ('1022','Miming\'s Money'	, '1000'),
-- ('1023','Cash'				, '1000'),
-- ('1024','Credit Card'		, '1000'),
-- ('1025','Debit Card'		, '1000'),
-- ('1026','Credit Card'		, '1000'),
-- ('1027','Credit Card'		, '1000'),
-- ('1028','Debit Card'		, '1000'),
-- ('1029','Credit Card'		, '1000');

insert into Menus (name)
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
    
insert into Meats (name)
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

INSERT INTO expertise(itemNum, chefID)
VALUES 
(1, 1101),
(2, 1114),
(3, 1101),
(4, 1114),
(5, 1101),
(6, 1114),
(7, 1101),
(8, 1114);


insert into MenuUsage (name, day, useStartTime, useEndTime) 
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

insert into menuPrices (menuItemNum, menu, price) 
	values (1, 'Lunch', 4),
	(1, 'Evening', 5),
	(1, 'Childrens', 3),
	(2, 'Lunch', 4),
	(2, 'Evening', 5),
	(2, 'Childrens', 3),
	(3, 'Lunch', 4),
	(3, 'Evening', 5),
	(3, 'Childrens', 3),
	(4, 'Lunch', 4),
	(4, 'Evening', 5),
	(4, 'Childrens', 3),
	(5, 'Lunch', 4),
	(5, 'Evening', 5),
	(5, 'Childrens', 3),
	(6, 'Lunch', 7),
	(6, 'Evening', 9),
	(6, 'Childrens', 5),
	(7, 'Lunch', 7),
	(7, 'Evening', 9),
	(7, 'Childrens', 5),
	(8, 'Lunch', 7),
	(8, 'Evening', 9),
	(8, 'Childrens', 5),
	(9, 'Sunday Brunch Buffet', 16),
	(10, 'Sunday Brunch Buffet', 12);
