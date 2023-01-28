-- PES2UG20CS389 Vishwa Mehul Mehta
-- Functions

DELIMITER $$
CREATE FUNCTION number_of_tickets_booked(no_of_tickets int)
RETURNS varchar(50)
BEGIN
	DECLARE err varchar(50);
IF no_of_tickets > 3 THEN
    		SET err = 'cannot purchase tickets current limit is over';
ELSE
    		SET err = 'can purchase tickets';
END IF;
RETURN err;
END; $$
DELIMITER ;

-- Function Call

SELECT number_of_tickets_booked(COUNT(*)), ticketpassenger.PNR FROM ticketpassenger JOIN ticket
WHERE ticketpassenger.PNR = ticket.PNR AND MONTH(ticket.Travel_date) = MONTH(CURRENT_DATE) GROUP BY ticketpassenger.PNR;

-- END