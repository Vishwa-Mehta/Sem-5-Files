TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `before_insert_comp` BEFORE INSERT ON `compartment` FOR EACH ROW BEGIN\n	DECLARE err_msg varchar(500);\n    DECLARE c int;\n    SET err_msg = ("Cannot insert!! the number of compartments in the train exceeds 4");\n    SET c = (SELECT COUNT(*) FROM compartment WHERE compartment.Train_no = new.Train_no);\n    IF c >= 4 THEN\n    	SIGNAL SQLSTATE \'45000\'\n    	SET MESSAGE_TEXT = err_msg;\n    END IF;\nEND'
sql_modes=364904448
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='utf8_general_ci'
created=166744681989
