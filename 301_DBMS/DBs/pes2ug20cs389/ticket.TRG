TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER before_delete_ticket\nBEFORE DELETE\nON ticket FOR EACH ROW\nBEGIN\n	DECLARE err_msg varchar(200);\n    SET err_msg = ("cannot insert!! pnr not in paymentinfo");\n    IF old.PNR IN (SELECT PNR FROM paymentinfo WHERE paymentinfo.PNR = old.PNR) THEN\n    	INSERT INTO backup (SELECT * FROM paymentinfo WHERE paymentinfo.PNR = old.PNR);\n    ELSE\n    	SIGNAL SQLSTATE \'45000\'\n        SET MESSAGE_TEXT = err_msg;\n    END IF;\nEND'
sql_modes=364904448
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8_general_ci'
created=166745004887
