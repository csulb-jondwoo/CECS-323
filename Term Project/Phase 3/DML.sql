use mimings_cuisine;

ALTER TABLE shift 
ADD CONSTRAINT shift_empShift_fk04 FOREIGN KEY (managerID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType),
ADD CONSTRAINT shift__empShift_fk05 FOREIGN KEY (chefID, shiftDate, dayType) REFERENCES empShift(empID, shiftDate, dayType);

-- SET FOREIGN_KEY_CHECKS=0; when inserting into shift and empshift
-- SET FOREIGN_KEY_CHECKS=1; after done
