use mimings_cuisine;

-- must alter table to avoid "chicken and egg" problem for "shift" and "empShift" table
ALTER TABLE shift 
ADD CONSTRAINT shift_empShift_fk04 FOREIGN KEY (managerID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType),
ADD CONSTRAINT shift__empShift_fk05 FOREIGN KEY (chefID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType);

-- insert data into employees table
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

-- set to 0 to intialize empShift with data
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

-- insert data into chef table
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

-- insert data into headChef table
INSERT INTO headChef(empID)
VALUES 
(1004),
(1015),
(1016),
(1017);

-- insert data into lineCook table
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

-- insert data into station table
INSERT INTO station (stationName)
VALUES 
('butcher'),
('fry cook'),
('grill'),
('pantry'),
('pastry'),
('roast'),
('saute');
 
-- insert data into lineCookStation table
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

-- insert data into maitre_d table
INSERT INTO maitre_d (empID)
VALUES 
(2008),
(2082),
(2175),
(2373);

-- insert data into manager table
INSERT INTO manager (empID)
VALUES 
(9410),
(9465),
(9732),
(9811),
(9899);

-- insert data into timeOfDay table
INSERT INTO timeOfDay (dayType)
VALUES 
('Afternoon'),
('Evening');

-- set to 0 to intialize shift with data
SET FOREIGN_KEY_CHECKS=0;
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
SET FOREIGN_KEY_CHECKS=1;

-- insert data into sousChef table
INSERT INTO sousChef (empID)
VALUES 
(1101),
(1114),
(1142),
(1145),
(1149),
(1152),
(1153);

-- insert data into waitStaff table
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

-- insert data into recipes table
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

-- insert data into Table table
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

-- insert data into Menus table
insert into Menus (name)
    values ('Evening'),
    ('Lunch'),
    ('Childrens'),
    ('Sunday Brunch Buffet');
    
-- insert data into AvailableDays table
insert into AvailableDays (dayName)
    values ('Sunday'),
    ('Monday'),
    ('Tuesday'),
    ('Wednesday'),
    ('Thursday'),
    ('Friday'),
    ('Saturday');
    
-- insert data into Meats table
insert into Meats (name)
values ('Chefs Special'),
    ('Pork'),
    ('Chicken'),
    ('Beef'),
    ('Seafood'),
    ('Vegetables'),
    ('N/A');
    
-- insert data into SpiceLevels table
insert into SpiceLevels (name)
    values ('Mild'),
    ('Tangy'),
    ('Piquant'),
    ('Hot'),
    ('Oh My God');

-- insert data into MenuItems table
insert into MenuItems (itemNum, name, description, recipeNo)
    values (1, 'Hot and Sour Soup', 'Spicy and savory soup, made with pork, mushrooms, bamboo shoots, tofu, and eggs in a savory seasoned broth with soy sauce and vinegar.', 1),
    (2, 'Wonton Soup', 'Light and airy pork wontons in a chicken broth.', 2),
    (3, 'Egg Drop Soup', 'Wispy beaten eggs in boiled chicken broth.', 3),
    (4, 'Fried Wontons', 'Tender wrappers stuffed with ground pork, mushrooms and seasonings, then deep fried to crispy golden brown', 4),
    (5, 'Egg Rolls', 'Deep-fried appetizers. Savory roll with shredded cabbage, chopped pork, and other fillings.', 5),
    (6, 'Chow Mein', 'Chinese stir-fried noodles with choice of meat.', 6),
    (7, 'Egg Foo Young', 'Chinese egg omelette dish made with an easy gravy topping, vegatable and choice of meat', 7),
    (8, 'Chop Suey', 'Choice of meat and eggs, cooked quickly with vegetables such as bean sprouts, cabbage, and celery and flavorful ', 8),
    (9, 'N/A', 'Sunday Afternoon Brunch Special', NULL),
    (10, 'N/A', 'Sunday Evening Brunch Special', NULL);

-- insert data into expertise table
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

-- insert data into MenuUsage table
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

-- insert data into customers table
INSERT INTO customers (accountNo, city, address, state, custName, mimingMoney)
VALUES
('61515', 'Los Angeles', '15296 The Walks', 'CA', 'Openlane accounting', '0'),
('25514', 'San Diego', '22029 Kings Parade', 'CA', 'Yearin finance', '1'),
('63146', 'San Jose', '92418 Whitfield Street', 'CA', 'Goodsilron sales', '0'),
('31169', 'San Francisco', '35483 Old Heath Road', 'CA', 'Condax research and development', '0'),
('2635', 'Fresno', '61252 Beechcroft Road', 'CA', 'Opentech IT', '0'),
('31095', 'Sacramento', '81976 Quay Hill', 'CA', 'Golddex management', '12'),
('13125', 'Long Beach', '56312 Whitestone Road', 'CA', 'year-job administration', '0'),
('40619', 'Oakland', '74079 Erskine Street', 'CA', 'Isdom customer service', '70'),
('79632', 'Bakersfield', '80816 Cheviot Place', 'CA', 'Gogozoom customer support', '0'),
('93817', 'Anaheim', '92799 Old Edinburgh Road', 'CA', 'Y-corporation technical support', '0'),
('30649', 'Santa Ana', '88658 Bray Close', 'CA', 'Nam-zim marketing', '52'),
('95749', 'Riverside', '31156 Cardigan Terrace', 'CA', 'Donquadtech logistics', '0'),
('26442', 'Stockton', '20534 Braeside Gardens', 'CA', 'Warephase operations', '42'),
('71860', 'Chula Vista', '15660 Church Plain', 'CA', 'Donware planning', '101'),
('3557', 'Irvine', '35929 Dovecote Mews', 'CA', 'Faxquote human resources', '0'),
('69309', 'Fremont', '32514 Old Dairy Court', 'CA', 'Sunnamplex purchasing', '0'),
('66269', 'San Bernardino', '96843 Rosemary Crescent', 'CA', 'Lexiqvolax quality assurance', '0'),
('74945', 'Modesto', '63774 Marles Close', 'CA', 'Sumace engineering', '0'),
('45028', 'Santa Clarita', '13305 Alyth Gardens', 'CA', 'Treequote export', '0'),
('40394', 'Fontana', '13825 Folly Way', 'CA', 'Iselectrics shipping', '0'),
('14443', 'Oxnard', '14687 Bridgwater Road', 'CA', 'Zencorporation public relations', '0'),
('14145', 'Moreno Valley', '71448 Edison Close', 'CA', 'Plusstrip production', '0'),
('79501', 'Huntington Beach', '92514 Claremont Grove', 'CA', 'dambase supervision', '0'),
('44014', 'Glendale', '2069 Southwood Close', 'CA', 'Toughzap product quality', '0'),
('92978', 'Santa Rosa', '75793 Blockley Road', 'CA', 'Codehow inventory', '0'),
('14771', 'Rancho Cucamonga', '17653 Bryn Hafod', 'CA', 'Zotware technical support', '0'),
('84760', 'Oceanside', '27983 St Andrews Place', 'CA', 'Statholdings marketing', '0'),
('85537', 'Garden Grove', '75375 Blackwood Street', 'CA', 'Conecom logistics', '0'),
('55372', 'Ontario', '62237 College Yard', 'CA', 'Zathunicon operations', '5'),
('81859', 'Elk Grove', '2896 Larkins Close', 'CA', 'Labdrill planning', '0'),
('26054', 'Long Beach', '16835 Blossom Way', 'CA', 'Alannah Monaghan', '0'),
('55864', 'Oakland', '84314 Latham Court', 'CA', 'Kaine Olsen', '0'),
('94439', 'Bakersfield', '54839 Cherry Garden Road', 'CA', 'Ferne Lott', '0'),
('7052', 'Anaheim', '4052 Walsall Street', 'CA', 'Sidney Acevedo', '0'),
('20818', 'Santa Ana', '24045 Fell Road', 'CA', 'Kianna Cottrell', '0'),
('4599', 'Riverside', '28405 Bryan Street', 'CA', 'Gabija Gaines', '0'),
('41407', 'Stockton', '11141 Whitley Lane', 'CA', 'Kyle Mcdonald', '0'),
('15874', 'Chula Vista', '93102 Hiley Road', 'CA', 'Macaulay Dodson', '0'),
('7520', 'Irvine', '98137 Hall Rise', 'CA', 'Lacey-Mai Milner', '0'),
('25442', 'Fontana', '92211 Mylor Close', 'CA', 'Ahsan Bass', '4'),
('70975', 'Oxnard', '62393 Fleming Court', 'CA', 'Clarice Pennington', '0'),
('87373', 'Moreno Valley', '36958 Admiralty Way', 'CA', 'Antony Miller', '0'),
('99286', 'Huntington Beach', '91140 Cheriton Road', 'CA', 'Ibrar Goddard', '25'),
('64016', 'Glendale', '33304 Carnegie Drive', 'CA', 'Bibi Mcdonnell', '12'),
('98149', 'Santa Rosa', '5499 Warburton Street', 'CA', 'Finnlay Cope', '0'),
('78032', 'Rancho Cucamonga', '9385 Kings Mount', 'CA', 'Kelsie Bouvet', '47'),
('69522', 'Oceanside', '2764 Slad Lane', 'CA', 'Charley Velez', '0'),
('60052', 'Garden Grove', '56015 North Cross Street', 'CA', 'Paris Kenny', '6'),
('84461', 'Ontario', '11180 Hall Green Lane', 'CA', 'Conrad Branch', '150'),
('72735', 'Elk Grove', '72097 Burlington Street', 'CA', 'Chester Walter', '2'),
('1093', 'Long Beach', '30039 Fernside Close', 'CA', 'Fletcher Emerson', '7'),
('9434', 'Oakland', '54265 Noel Street', 'CA', 'Clementine Faulkner', '0'),
('99215', 'Bakersfield', '68114 Beacon Way', 'CA', 'Kajus Marsh', '0'),
('89635', 'Oceanside', '24399 Ashwell Place', 'CA', 'Ingrid Browning', '0'),
('55897', 'Garden Grove', '52190 Eaton Mews', 'CA', 'Yusha Wilson', '6'),
('9347', 'Ontario', '12158 Bellevue Street', 'CA', 'Freyja Graves', '0'),
('12787', 'Elk Grove', '56976 Hanworth Road', 'CA', 'Taryn Reeve', '0'),
('18763', 'Long Beach', '45949 Parkfield Road', 'CA', 'Tracy Miranda', '0'),
('23283', 'Oakland', '29857 Medway Street', 'CA', 'Elena Sellers', '0'),
('48131', 'Bakersfield', '44795 Hall Park Road', 'CA', 'Eliza Mccray', '0');

-- insert data into company table
INSERT INTO company (accountNo, companyName, companyDep, contactEmail, contactPhone)
VALUES
('61515', 'Openlane', 'accounting', 'cgarcia@live.com', '909-555-0103'),
('25514', 'Yearin', 'finance', 'jhardin@optonline.net', '909-555-0197'),
('63146', 'Goodsilron', 'sales', 'gtaylor@msn.com', '909-555-0141'),
('31169', 'Condax', 'research and development', 'singer@mac.com', '909-555-0161'),
('2635', 'Opentech', 'IT', 'kiddailey@att.net', '909-555-0185'),
('31095', 'Golddex', 'management', 'rkobes@sbcglobal.net', '909-555-0163'),
('13125', 'year-job', 'administration', 'jmmuller@yahoo.com', '323-555-0104'),
('40619', 'Isdom', 'customer service', 'konit@mac.com', '323-555-0146'),
('79632', 'Gogozoom', 'customer support', 'arathi@optonline.net', '323-555-0141'),
('93817', 'Y-corporation', 'technical support', 'gordonjcp@verizon.net', '323-555-0165'),
('30649', 'Nam-zim', 'marketing', 'rjones@att.net', '323-555-0150'),
('95749', 'Donquadtech', 'logistics', 'cliffski@msn.com', '323-555-0115'),
('26442', 'Warephase', 'operations', 'rnewman@icloud.com', '714-555-0170'),
('71860', 'Donware', 'planning', 'nelson@yahoo.ca', '714-555-0177'),
('3557', 'Faxquote', 'human resources', 'jugalator@verizon.net', '714-555-0166'),
('69309', 'Sunnamplex', 'purchasing', 'giafly@comcast.net', '714-555-0181'),
('66269', 'Lexiqvolax', 'quality assurance', 'drjlaw@live.com', '714-555-0158'),
('74945', 'Sumace', 'engineering', 'multiplx@yahoo.com', '714-555-0172'),
('45028', 'Treequote', 'export', 'ournews@outlook.com', '805-555-0186'),
('40394', 'Iselectrics', 'shipping', 'kassiesa@comcast.net', '805-555-0112'),
('14443', 'Zencorporation', 'public relations', 'pierce@msn.com', '805-555-0114'),
('14145', 'Plusstrip', 'production', 'syrinx@icloud.com', '805-555-0170'),
('79501', 'dambase', 'supervision', 'dimensio@live.com', '805-555-0112'),
('44014', 'Toughzap', 'product quality', 'jkegl@mac.com', '805-555-0173'),
('92978', 'Codehow', 'inventory', 'amimojo@verizon.net', '562-555-0113'),
('14771', 'Zotware', 'technical support', 'rafasgj@comcast.net', '562-555-0126'),
('84760', 'Statholdings', 'marketing', 'rwelty@yahoo.ca', '562-555-0181'),
('85537', 'Conecom', 'logistics', 'hauma@aol.com', '562-555-0104'),
('55372', 'Zathunicon', 'operations', 'notaprguy@msn.com', '562-555-0170'),
('81859', 'Labdrill', 'planning', 'isotopian@att.net', '562-555-0161')
;

-- insert data into individual table
INSERT INTO individual (accountNo, emailAddress, DOB)
VALUES
('26054', 'cgarcia@live.com', '1981-10-03'),
('55864', 'jhardin@optonline.net', '1996-05-24'),
('94439', 'gtaylor@msn.com', '1993-03-23'),
('7052', 'dwheeler@hotmail.com', '1990-07-29'),
('20818', 'mrsam@yahoo.com', '1971-06-07'),
('4599', 'cgcra@live.com', '1971-08-09'),
('41407', 'jcholewa@live.com', '2001-09-18'),
('15874', 'sherzodr@outlook.com', '1990-05-31'),
('7520', 'ideguy@yahoo.com', '1971-08-19'),
('25442', 'kspiteri@sbcglobal.net', '1998-06-22'),
('70975', 'okroeger@yahoo.ca', '1969-06-01'),
('87373', 'dhwon@aol.com', '1990-08-14'),
('99286', 'amaranth@sbcglobal.net', '1993-02-25'),
('64016', 'jaxweb@icloud.com', '1966-09-15'),
('98149', 'ilial@att.net', '1994-06-02'),
('78032', 'wayward@yahoo.ca', '1983-06-04'),
('69522', 'emcleod@aol.com', '1972-12-15'),
('60052', 'loscar@yahoo.ca', '1984-09-10'),
('84461', 'malvar@att.net', '1982-09-13'),
('72735', 'treit@comcast.net', '1979-03-22'),
('1093', 'denism@msn.com', '1993-07-15'),
('9434', 'arandal@me.com', '2000-10-06'),
('99215', 'nichoj@att.net', '2001-11-18'),
('89635', 'russotto@yahoo.ca', '1995-11-08'),
('55897', 'bjornk@hotmail.com', '1991-08-25'),
('9347', 'dimensio@gmail.com', '1993-05-25'),
('12787', 'crobles@msn.com', '1981-10-31'),
('18763', 'miltchev@yahoo.com', '1971-01-23'),
('23283', 'wikinerd@yahoo.com', '1993-02-03'),
('48131', 'sopwith@yahoo.ca', '2000-02-01');

-- insert data into Bill table
INSERT INTO Bill (orderNumber, paymentType, AccountNo)
VALUES
('1000','Credit Card'		, '71860'),
('1001','Cash'				, '3557'),
('1002','Debit Card'		, '69309'),
('1003','Miming\'s Money'	, '66269'),
('1004','Debit Card'		, '74945'),
('1005','Credit Card'		, '45028'),
('1006','Credit Card'		, '40394'),
('1007','Cash'				, '14443'),
('1008','Cash'				, '14145'),
('1009','Credit Card'		, '79501'),
('1010','Miming\'s Money'	, '44014'),
('1011','Cash'				, '92978'),
('1012','Credit Card'		, '14771'),
('1013','Miming\'s Money'	, '84760'),
('1014','Credit Card'		, '85537'),
('1015','Debit Card'		, '55372'),
('1016','Debit Card'		, '81859'),
('1017','Credit Card'		, '26054'),
('1018','Cash'				, '55864'),
('1019','Credit Card'		, '94439'),
('1020','Debit Card'		, '7052'),
('1021','Miming\'s Money'	, '20818'),
('1022','Miming\'s Money'	, '4599'),
('1023','Cash'				, '41407'),
('1024','Credit Card'		, '15874'),
('1025','Debit Card'		, '7520'),
('1026','Credit Card'		, '25442'),
('1027','Credit Card'		, '70975'),
('1028','Debit Card'		, '87373'),
('1029','Credit Card'		, '99286');

-- insert data into Orders table
INSERT INTO Orders (orderNumber, paymentType, orderDateTime, AccountNo)
VALUES 
('1000'	,'Credit Card'		,'2020-01-01 9:30:00'	,'71860'),
('1001'	,'Cash'				,'2020-01-01 10:00:00'	,'3557'),
('1002'	,'Debit Card'		,'2020-01-01 14:30:00'	,'69309'),
('1003'	,'Miming\'s Money'	,'2020-01-01 17:00:00'	,'66269'),
('1004'	,'Debit Card'		,'2020-01-02 10:45:00'	,'74945'),
('1005'	,'Credit Card'		,'2020-01-02 14:30:00'	,'45028'),
('1006'	,'Credit Card'		,'2020-01-02 15:15:00'	,'40394'),
('1007'	,'Cash'				,'2020-01-02 16:00:00'	,'14443'),
('1008'	,'Cash'				,'2020-01-02 16:30:00'	,'14145'),
('1009'	,'Credit Card'		,'2020-01-03 8:30:00'	,'79501'),
('1010'	,'Miming\'s Money'	,'2020-01-03 10:15:00'	,'44014'),
('1011'	,'Cash'				,'2020-01-03 10:30:00'	,'92978'),
('1012'	,'Credit Card'		,'2020-01-03 11:45:00'	,'14771'),
('1013'	,'Miming\'s Money'	,'2020-01-03 13:30:00'	,'84760'),
('1014'	,'Credit Card'		,'2020-01-04 8:30:00'	,'85537'),
('1015'	,'Debit Card'		,'2020-01-04 10:15:00'	,'55372'),
('1016'	,'Debit Card'		,'2020-01-04 14:15:00'	,'81859'),
('1017'	,'Credit Card'		,'2020-01-04 15:00:00'	,'26054'),
('1018'	,'Cash'				,'2020-01-05 7:45:00'	,'55864'),
('1019'	,'Credit Card'		,'2020-01-06 8:30:00'	,'94439'),
('1020'	,'Debit Card'		,'2020-01-06 9:45:00'	,'7052'),
('1021'	,'Miming\'s Money'	,'2020-01-06 13:00:00'	,'20818'),
('1022'	,'Miming\'s Money'	,'2020-01-07 9:30:00'	,'4599'),
('1023'	,'Cash'				,'2020-01-07 10:15:00'	,'41407'),
('1024'	,'Credit Card'		,'2020-01-07 13:45:00'	,'15874'),
('1025'	,'Debit Card'		,'2020-01-08 10:30:00'	,'7520'),
('1026'	,'Credit Card'		,'2020-01-08 12:30:00'	,'25442'),
('1027'	,'Credit Card'		,'2020-01-08 14:15:00'	,'70975'),
('1028'	,'Debit Card'		,'2020-01-08 14:45:00'	,'87373'),
('1029'	,'Credit Card'		,'2020-01-08 15:15:00'	,'99286');

-- insert data into Online table
INSERT INTO `Online` (orderNumber, OrdererEmail, EstPickupTime, ReadyPickupTime)
VALUES 
('1000'	,'hedwig@aol.com','2020-01-01 9:45:00','2020-01-01 9:45:00'),
('1001'	,'leocharre@outlook.com','2020-01-01 10:45:00','2020-01-01 11:00:00'),
('1002'	,'njpayne@hotmail.com','2020-01-01 14:45:00','2020-01-01 14:45:00'),
('1003'	,'amichalo@gmail.com','2020-01-01 17:15:00','2020-01-01 17:15:00'),
('1004'	,'pthomsen@icloud.com','2020-01-02 11:45:00','2020-01-02 12:00:00'),
('1005'	,'elflord@gmail.com','2020-01-02 15:00:00','2020-01-02 15:30:00'),
('1006'	,'cantu@outlook.com','2020-01-02 15:45:00','2020-01-02 15:45:00'),
('1007'	,'cumarana@yahoo.ca','2020-01-02 16:15:00','2020-01-02 16:15:00'),
('1008'	,'lukka@msn.com','2020-01-02 16:45:00','2020-01-02 17:00:00'),
('1009'	,'mahbub@yahoo.ca','2020-01-03 9:15:00','2020-01-03 9:30:00');

-- insert data into Phone table
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

-- insert data into EatIn table
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

-- insert data into Seat table
INSERT INTO Seat (TableNumber, SeatNumber, orderNumber, empID)
VALUES
('0', '1', '1020', '3028'),
('2', '3', '1021', '3065'),
('3', '1', '1022', '3067'),
('5', '3', '1023', '3069'),
('6', '1', '1024', '3069'),
('7', '5', '1025', '3178'),
('10', '4', '1026', '3178'),
('13', '2', '1027', '3366'),
('15', '5', '1028', '3370'),
('18', '4', '1029', '3371');

-- insert data into MenuPrices table
insert into MenuPrices (menuItemNum, menu, price) 
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

-- insert data into OrderItem table
INSERT INTO OrderItem (orderNumber, orderItemNum, menuItemNum, menu, meat, spiciness)
VALUES 
(1000, 1, 1, 'Lunch', 'Pork', 'Hot'),
(1001, 2, 2, 'Childrens', 'Pork', 'Mild'),
(1002, 3, 3, 'Evening', 'Pork', 'Hot'),
(1003, 4, 4, 'Lunch', 'Seafood', 'Hot'),
(1004, 5, 5, 'Lunch', 'Chicken', 'Piquant'),
(1005, 6, 1, 'Childrens', 'Chicken', 'Mild'),
(1006, 7, 2, 'Lunch', 'Chicken', 'Piquant'),
(1007, 8, 6, 'Childrens', 'Beef', 'Tangy'),
(1008, 9, 7, 'Childrens', 'Chefs Special', 'Mild'),
(1009, 10, 8, 'Evening', 'Chefs Special', 'Hot'),
(1010, 11, 2, 'Evening', 'Chefs Special', 'Piquant'),
(1011, 12, 7, 'Evening', 'Beef', 'Hot'),
(1012, 13, 4, 'Evening', 'Beef', 'Oh My God'),
(1013, 14, 2, 'Evening', 'Vegetables', 'Mild'),
(1014, 15, 4, 'Evening', 'Vegetables', 'Piquant'),
(1015, 16, 6, 'Lunch', 'Beef', 'Oh My God'),
(1016, 17, 5, 'Lunch', 'Seafood', 'Oh My God'),
(1017, 18, 3, 'Lunch', 'Beef', 'Oh My God'),
(1018, 19, 1, 'Lunch', 'Seafood', 'Mild'),
(1019, 20, 8, 'Lunch', 'Pork', 'Tangy'),
(1020, 21, 9, 'Sunday Brunch Buffet', 'N/A', NULL),
(1021, 22, 9, 'Sunday Brunch Buffet', 'N/A', NULL),
(1022, 23, 10, 'Sunday Brunch Buffet', 'N/A', NULL),
(1023, 24, 9, 'Sunday Brunch Buffet', 'N/A', NULL),
(1024, 25, 10, 'Sunday Brunch Buffet', 'N/A', NULL),
(1025, 26, 8, 'Evening', 'Beef', 'Piquant'),
(1026, 27, 7, 'Evening', 'Beef', 'Piquant'),
(1027, 28, 5, 'Childrens', 'Seafood', 'Tangy'),
(1028, 29, 4, 'Childrens', 'Vegetables', 'Mild'),
(1029, 30, 6, 'Childrens', 'Vegetables', 'Tangy');
