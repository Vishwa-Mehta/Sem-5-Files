TYPE=VIEW
query=select `railway_reservation_pes2ug20cs389`.`ticket`.`PNR` AS `PNR`,`railway_reservation_pes2ug20cs389`.`ticket`.`Train_No` AS `Train_No`,`railway_reservation_pes2ug20cs389`.`ticket`.`Departure` AS `Departure`,`railway_reservation_pes2ug20cs389`.`ticket`.`Arrival` AS `Arrival`,`railway_reservation_pes2ug20cs389`.`routeinfo`.`Distance` AS `Distance`,`railway_reservation_pes2ug20cs389`.`faretable`.`FarePerKM` AS `FarePerKM` from ((`railway_reservation_pes2ug20cs389`.`routeinfo` join `railway_reservation_pes2ug20cs389`.`ticket`) join `railway_reservation_pes2ug20cs389`.`faretable`) where ((`railway_reservation_pes2ug20cs389`.`routeinfo`.`From_Station_Name` = `railway_reservation_pes2ug20cs389`.`ticket`.`Departure`) and (`railway_reservation_pes2ug20cs389`.`routeinfo`.`To_Station_Name` = `railway_reservation_pes2ug20cs389`.`ticket`.`Arrival`) and (`railway_reservation_pes2ug20cs389`.`faretable`.`Train_Type` = `railway_reservation_pes2ug20cs389`.`ticket`.`Train_Type`) and (`railway_reservation_pes2ug20cs389`.`faretable`.`Compartment_Type` = `railway_reservation_pes2ug20cs389`.`ticket`.`Compartment_type`))
md5=8113e58af659e4f8fe35686e751a69bc
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2022-09-25 13:25:42
create-version=1
source=SELECT ticket.PNR, ticket.Train_No, ticket.Departure, ticket.Arrival, routeinfo.Distance, faretable.FarePerKM\nFROM routeinfo JOIN ticket JOIN faretable\nWHERE routeinfo.From_Station_Name = ticket.Departure and routeinfo.To_Station_Name = ticket.Arrival and faretable.Train_Type = ticket.Train_Type and faretable.Compartment_Type = ticket.Compartment_type
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `railway_reservation_pes2ug20cs389`.`ticket`.`PNR` AS `PNR`,`railway_reservation_pes2ug20cs389`.`ticket`.`Train_No` AS `Train_No`,`railway_reservation_pes2ug20cs389`.`ticket`.`Departure` AS `Departure`,`railway_reservation_pes2ug20cs389`.`ticket`.`Arrival` AS `Arrival`,`railway_reservation_pes2ug20cs389`.`routeinfo`.`Distance` AS `Distance`,`railway_reservation_pes2ug20cs389`.`faretable`.`FarePerKM` AS `FarePerKM` from ((`railway_reservation_pes2ug20cs389`.`routeinfo` join `railway_reservation_pes2ug20cs389`.`ticket`) join `railway_reservation_pes2ug20cs389`.`faretable`) where ((`railway_reservation_pes2ug20cs389`.`routeinfo`.`From_Station_Name` = `railway_reservation_pes2ug20cs389`.`ticket`.`Departure`) and (`railway_reservation_pes2ug20cs389`.`routeinfo`.`To_Station_Name` = `railway_reservation_pes2ug20cs389`.`ticket`.`Arrival`) and (`railway_reservation_pes2ug20cs389`.`faretable`.`Train_Type` = `railway_reservation_pes2ug20cs389`.`ticket`.`Train_Type`) and (`railway_reservation_pes2ug20cs389`.`faretable`.`Compartment_Type` = `railway_reservation_pes2ug20cs389`.`ticket`.`Compartment_type`))
