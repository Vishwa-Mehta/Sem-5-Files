TYPE=VIEW
query=select `pes2ug20cs389`.`ticketpassenger`.`PNR` AS `PNR`,count(`pes2ug20cs389`.`ticketpassenger`.`PNR`) AS `Passenger_number` from `pes2ug20cs389`.`ticketpassenger` group by `pes2ug20cs389`.`ticketpassenger`.`PNR`
md5=dcdc13aad948ab802d1a6dd89b4b9c03
updatable=0
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2022-09-25 14:38:37
create-version=1
source=SELECT PNR, COUNT(PNR) as Passenger_number\nFROM ticketpassenger GROUP BY ticketpassenger.PNR
client_cs_name=utf8mb4
connection_cl_name=utf8mb4_unicode_ci
view_body_utf8=select `pes2ug20cs389`.`ticketpassenger`.`PNR` AS `PNR`,count(`pes2ug20cs389`.`ticketpassenger`.`PNR`) AS `Passenger_number` from `pes2ug20cs389`.`ticketpassenger` group by `pes2ug20cs389`.`ticketpassenger`.`PNR`
