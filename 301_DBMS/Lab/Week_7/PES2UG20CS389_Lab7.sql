/*SRN - PES2UG20CS389 , NAME - VISHWA MEHUL MEHTA*/

/*Question 1*/
SELECT t1.User_ID, t1.User_type, t1.F_name, t1.L_name FROM users AS t1, ticket 
WHERE ticket.User_ID = t1.User_ID AND ticket.Departure = 'Bengaluru' AND ticket.Arrival = 'Chennai' AND MONTH(ticket.Travel_date) = 10 AND YEAR(ticket.Travel_date) = 2021 UNION (
    SELECT t2.User_ID, t2.User_type, t2.F_name, t2.L_name FROM users AS t2, ticket
    WHERE ticket.User_ID = t2.User_ID AND ticket.Departure = 'Bengaluru' AND ticket.Arrival = 'Chennai' AND MONTH(ticket.Travel_date) = 8 AND YEAR(ticket.Travel_date) = 2022);

/*Question 2*/
SELECT u1.User_ID, u1.User_type, u1.F_name, u1.L_name FROM users AS u1, ticket AS t1
WHERE t1.User_ID = u1.User_ID AND t1.Departure = 'Bengaluru' AND t1.Arrival = 'Chennai' AND MONTH(t1.Travel_date) = 10 AND YEAR(t1.Travel_date) = 2021 AND EXISTS (
    SELECT u2.User_ID, u2.User_type, u2.F_name, u2.L_name FROM users AS u2, ticket AS t2
    WHERE t2.User_ID = u2.User_ID AND t2.Departure = 'Bengaluru' AND t2.Arrival = 'Chennai' AND MONTH(t2.Travel_date) = 8 AND YEAR(t2.Travel_date) = 2022 AND t1.User_ID = t2.User_ID);

/*Question 3*/
SELECT u2.User_ID, u2.User_type, u2.F_name, u2.L_name FROM users AS u2, ticket AS t2 
WHERE t2.User_ID = u2.User_ID AND t2.Departure = 'Bengaluru' AND t2.Arrival = 'Chennai' AND MONTH(t2.Travel_date) = 8 AND YEAR(t2.Travel_date) = 2022 AND NOT EXISTS (
    SELECT u1.User_ID, u1.User_type, u1.F_name, u1.L_name FROM users AS u1, ticket AS t1
	WHERE t1.User_ID = u1.User_ID AND t1.Departure = 'Bengaluru' AND t1.Arrival = 'Chennai' AND MONTH(t1.Travel_date) = 10 AND YEAR(t1.Travel_date) = 2021 AND t1.User_ID = t2.User_ID);

/*Question 4*/
SELECT u2.User_ID, u2.User_type, u2.F_name, u2.L_name FROM users AS u2, ticket AS t2 
WHERE t2.User_ID = u2.User_ID AND t2.Departure = 'Bengaluru' AND t2.Arrival = 'Chennai' AND EXISTS (
    SELECT u1.User_ID, u1.User_type, u1.F_name, u1.L_name FROM users AS u1, ticket AS t1
	WHERE t1.User_ID = u1.User_ID AND t1.Departure = 'Chennai' AND t1.Arrival = 'Bengaluru' AND (DAY(t1.Travel_date) - DAY(t2.Travel_date) = 7) AND t2.User_ID = t1.User_ID);

/*Question 5*/
SELECT u2.User_ID, u2.User_type, u2.F_name, u2.L_name FROM users AS u2, ticket AS t2 
WHERE t2.User_ID = u2.User_ID AND t2.Departure = 'Bengaluru' AND t2.Arrival = 'Chennai' AND NOT EXISTS (
    SELECT u1.User_ID, u1.User_type, u1.F_name, u1.L_name FROM users AS u1, ticket AS t1
	WHERE t1.User_ID = u1.User_ID AND t1.Departure = 'Chennai' AND t1.Arrival = 'Bengaluru' AND t2.User_ID = t1.User_ID);
