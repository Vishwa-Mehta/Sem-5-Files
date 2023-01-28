TYPE=VIEW
query=select `mydb_pes2ug20cs389`.`usr`.`fname` AS `fname`,`mydb_pes2ug20cs389`.`usr`.`lname` AS `lname`,`mydb_pes2ug20cs389`.`usr`.`age` AS `age`,`mydb_pes2ug20cs389`.`usr`.`dob` AS `dob` from `mydb_pes2ug20cs389`.`usr` where (`mydb_pes2ug20cs389`.`usr`.`user_type` = \'passenger\')
md5=a46b33c818949992cf9d5ccaf90ed8ce
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2022-09-03 12:48:18
create-version=1
source=SELECT fname, lname, age, dob FROM usr WHERE user_type = "passenger"
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `mydb_pes2ug20cs389`.`usr`.`fname` AS `fname`,`mydb_pes2ug20cs389`.`usr`.`lname` AS `lname`,`mydb_pes2ug20cs389`.`usr`.`age` AS `age`,`mydb_pes2ug20cs389`.`usr`.`dob` AS `dob` from `mydb_pes2ug20cs389`.`usr` where (`mydb_pes2ug20cs389`.`usr`.`user_type` = \'passenger\')
