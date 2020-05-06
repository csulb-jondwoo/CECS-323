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
