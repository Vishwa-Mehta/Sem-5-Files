-- PES2UG20CS389 Vishwa Mehul Mehta
-- Procedures

DELIMITER $$
CREATE procedure age_updation(IN age date)
BEGIN
   update users set users.Age = (year(CURRENT_DATE) - year(age)) where users.DOB = age;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE age()
BEGIN
  DECLARE dob DATE;
  DECLARE is_updated INT DEFAULT FALSE;
  DECLARE age_update CURSOR FOR SELECT users.DOB FROM users;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET is_updated = TRUE;
  OPEN age_update;
  iterate_through_rows:LOOP
    FETCH age_update INTO dob;
    IF is_updated THEN
      LEAVE iterate_through_rows;
    END IF;
    call age_updation(dob);
  END LOOP;
  CLOSE age_update;
END; $$
DELIMITER ;

-- Procedure Call

CALL age();

-- END