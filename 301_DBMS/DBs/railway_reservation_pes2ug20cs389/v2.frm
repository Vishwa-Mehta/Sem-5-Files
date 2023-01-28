TYPE=VIEW
query=select `railway_reservation_pes2ug20cs389`.`ticketpassenger`.`PNR` AS `PNR`,count(`railway_reservation_pes2ug20cs389`.`ticketpassenger`.`PNR`) AS `Passenger_number` from `railway_reservation_pes2ug20cs389`.`ticketpassenger` group by `railway_reservation_pes2ug20cs389`.`ticketpassenger`.`PNR`
md5=1c54a841fda53d6c4e32b2b400a90fc6
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2022-09-25 13:25:42
create-version=1
source=SELECT PNR, COUNT(PNR) as Passenger_number\nFROM ticketpassenger GROUP BY ticketpassenger.PNR
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `railway_reservation_pes2ug20cs389`.`ticketpassenger`.`PNR` AS `PNR`,count(`railway_reservation_pes2ug20cs389`.`ticketpassenger`.`PNR`) AS `Passenger_number` from `railway_reservation_pes2ug20cs389`.`ticketpassenger` group by `railway_reservation_pes2ug20cs389`.`ticketpassenger`.`PNR`
