-- PES2UG20CS389 Vishwa Mehul Mehta
-- Trigger 1

DELIMITER $$
CREATE TRIGGER before_delete_ticket
BEFORE DELETE
ON ticket FOR EACH ROW
BEGIN
DECLARE err_msg varchar(200);
    	SET err_msg = ("cannot insert!! pnr not in paymentinfo");
	CREATE TABLE IF NOT EXISTS backup (Transaction_id int NOT NULL, Bank varchar(20), Card_no varchar(255), Price float, PNR varchar(255));
    	IF old.PNR IN paymentinfo.PNR THEN
    		INSERT INTO backup VALUES (SELECT * FROM paymentinfo WHERE paymentinfo.PNR = old.PNR);
    	ELSE
    		SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = err_msg;
    	END IF;
END $$
DELIMITER ;

-- Negative case
INSERT INTO compartment VALUES ('G02', 'III Class', 60, 9, 62621);

-- Positive case
INSERT INTO compartment VALUES ('F02', 'I Class', 16, 4, 58451);


-- Trigger 2
DELIMITER $$
CREATE TRIGGER before_delete_ticket
BEFORE DELETE
ON ticket FOR EACH ROW
BEGIN
	DECLARE err_msg varchar(200);
    	SET err_msg = ("cannot insert!! pnr not in paymentinfo");
    	IF old.PNR IN (SELECT PNR FROM paymentinfo WHERE paymentinfo.PNR = old.PNR) THEN
    		INSERT INTO backup (SELECT * FROM paymentinfo WHERE paymentinfo.PNR = old.PNR);
    	ELSE
    		SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = err_msg;
    	END IF;
END $$
DELIMITER ;

-- Backup table creation
CREATE TABLE IF NOT EXISTS backup (Transaction_id int NOT NULL, Bank varchar(20), Card_no varchar(255), Price float, PNR varchar(255));

-- Negative case
DELETE FROM ticket WHERE ticket.PNR = ‘PNR021’;

-- Positive case
DELETE FROM ticket WHERE ticket.PNR = ‘PNR003’;

-- END