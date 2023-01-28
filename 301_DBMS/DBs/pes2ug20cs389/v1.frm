TYPE=VIEW
query=select `pes2ug20cs389`.`ticket`.`PNR` AS `PNR`,`pes2ug20cs389`.`ticket`.`Train_no` AS `Train_no`,`pes2ug20cs389`.`ticket`.`Departure` AS `Departure`,`pes2ug20cs389`.`ticket`.`Arrival` AS `Arrival`,`pes2ug20cs389`.`routeinfo`.`Distance` AS `Distance`,`pes2ug20cs389`.`faretable`.`fare_per_km` AS `fare_per_km` from ((`pes2ug20cs389`.`routeinfo` join `pes2ug20cs389`.`ticket`) join `pes2ug20cs389`.`faretable`) where ((`pes2ug20cs389`.`routeinfo`.`From_station_name` = `pes2ug20cs389`.`ticket`.`Departure`) and (`pes2ug20cs389`.`routeinfo`.`To_station_name` = `pes2ug20cs389`.`ticket`.`Arrival`) and (`pes2ug20cs389`.`faretable`.`train_type` = `pes2ug20cs389`.`ticket`.`Train_type`) and (`pes2ug20cs389`.`faretable`.`compartment_type` = `pes2ug20cs389`.`ticket`.`Compartment_type`))
md5=33329bfa5ebe84693e44816dbc3f38db
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2022-09-25 14:38:37
create-version=1
source=SELECT ticket.PNR, ticket.Train_no, ticket.Departure, ticket.Arrival, routeinfo.Distance, faretable.fare_per_km\nFROM routeinfo JOIN ticket JOIN faretable\nWHERE routeinfo.From_station_name = ticket.Departure and routeinfo.To_station_name = ticket.Arrival and faretable.train_type = ticket.Train_type and faretable.compartment_type = ticket.Compartment_type
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `pes2ug20cs389`.`ticket`.`PNR` AS `PNR`,`pes2ug20cs389`.`ticket`.`Train_no` AS `Train_no`,`pes2ug20cs389`.`ticket`.`Departure` AS `Departure`,`pes2ug20cs389`.`ticket`.`Arrival` AS `Arrival`,`pes2ug20cs389`.`routeinfo`.`Distance` AS `Distance`,`pes2ug20cs389`.`faretable`.`fare_per_km` AS `fare_per_km` from ((`pes2ug20cs389`.`routeinfo` join `pes2ug20cs389`.`ticket`) join `pes2ug20cs389`.`faretable`) where ((`pes2ug20cs389`.`routeinfo`.`From_station_name` = `pes2ug20cs389`.`ticket`.`Departure`) and (`pes2ug20cs389`.`routeinfo`.`To_station_name` = `pes2ug20cs389`.`ticket`.`Arrival`) and (`pes2ug20cs389`.`faretable`.`train_type` = `pes2ug20cs389`.`ticket`.`Train_type`) and (`pes2ug20cs389`.`faretable`.`compartment_type` = `pes2ug20cs389`.`ticket`.`Compartment_type`))
