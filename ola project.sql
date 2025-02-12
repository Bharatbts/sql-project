CREATE DATABASE OLA;

USE OLA;

CREATE TABLE driver
(
id int unique primary key,
name varchar(20),
vehicle_type varchar(40),
age int,
availability boolean,
ride_date date,
cancelled_by_passenger boolean
);

INSERT INTO driver VALUES (1,"John Doe","Seden",30,true,'2023-05-02',false);
INSERT INTO driver VALUES (2,"Alex T Fitzgerald","SUV",28,true,'2023-06-23',true);
INSERT INTO driver VALUES (3,"Robert Turner","Minivan",35,false,'2023-02-27',false);
INSERT INTO driver VALUES (4,"Joe Brown","Hatchback",40,true,'2024-03-17',false);
INSERT INTO driver VALUES (5,"Harry Gray","Convertible",25,true,'2024-08-20',true);
INSERT INTO driver VALUES (6,"Isaac	Duncan","Pickup",32,false,'2024-11-29',false);
INSERT INTO driver VALUES (7,"John Wallace","Electric car",29,true,'2024-12-19',false);
INSERT INTO driver VALUES (8,"Keith	Berry","Luxury Sedan",45,true,'2024-06-07',true);
INSERT INTO driver VALUES (9,"Owen Manning","Motorcycle",22,true,'2025-01-12',false);
INSERT INTO driver VALUES (10,"Jonathan	Miller","Scooter",26,true,'2022-10-25',false);

CREATE TABLE passenger
(
id int unique primary key,
pickup_route varchar(100),
drop_route varchar(100),
price decimal(10, 2),
charge_per_km decimal(10, 2),
mobile_no varchar(15),
driver_id int,
cancelled_by_driver boolean,
foreign key (driver_id) references driver(id) 
);

INSERT INTO passenger VALUES (101,'123 Main St','456 Elm St',200.00,10.00,'555-1234',1,false);
INSERT INTO passenger VALUES (102,'789 Oak St','321 Pine St',150.00,25.00,'555-5678',2,true);
INSERT INTO passenger VALUES (103,'654 Maple St','987 Cedar St',170.00,13.00,'555-8765',3,false);
INSERT INTO passenger VALUES (104,'111 Birch St','222 Spruce St',120.00,6.00,'555-4321',4,false);
INSERT INTO passenger VALUES (105,'222 Willow St','333 Fir St',210.00,12.00,'555-1111',5,false);
INSERT INTO passenger VALUES (106,'444 Palm St','555 Chestnut St',250.00,25.00,'555-2222',6,true);
INSERT INTO passenger VALUES (107,'666 Walnut St','777 Ash St',190.00,18.00,'555-3333',7,false);
INSERT INTO passenger VALUES (108,'888 Cypress St','999 Redwood St',88.00,8.00,'555-4444',8,false);
INSERT INTO passenger VALUES (109,'1010 Maple St','2020 Oak St',70.00,7.00,'555-5555',9,false);
INSERT INTO passenger VALUES (110,'3030 Pine St','4040 Cedar St',140.00,14.00,'555-6666',10,false);

SELECT id,name,vehicle_type,age,availability,ride_date FROM driver;

SELECT id,pickup_route,drop_route,price,charge_per_km,mobile_no FROM passenger;

SELECT * FROM driver order by age;

SELECT * FROM driver order by age desc, id asc;

SELECT * FROM driver WHERE id = 5 AND age = 25;

SELECT * FROM driver WHERE id = 8 OR age = 28;

SELECT * FROM driver WHERE vehicle_type = "minivan";

SELECT * FROM passenger WHERE pickup_route = "444 Palm St";

SELECT p.id,pickup_route,drop_route,price,charge_per_km,mobile_no,name,vehicle_type,age,availability 
FROM passenger p JOIN driver d ON p.driver_id = d.id;

SELECT id,name,vehicle_type,age FROM driver WHERE availability = TRUE;

SELECT id,name,vehicle_type,age FROM driver WHERE cancelled_by_passenger = TRUE;

SELECT p.id,pickup_route,drop_route,price,name,vehicle_type FROM passenger p 
JOIN driver d ON p.driver_id = d.id WHERE cancelled_by_driver = TRUE;

SELECT p.id,pickup_route,drop_route,name,vehicle_type,ride_date FROM passenger p 
JOIN driver d ON p.driver_id = d.id WHERE ride_date = '2024-06-07';

SELECT p.id,pickup_route,drop_route,vehicle_type FROM passenger p 
JOIN driver d ON p.driver_id = d.id;

SELECT p.id,pickup_route,drop_route,price FROM passenger p WHERE price > 200.00;

SELECT d.id,d.name,p.id AS passenger_id FROM driver d 
JOIN passenger p ON d.id = p.driver_id WHERE cancelled_by_passenger = TRUE;

SELECT p.id,pickup_route,drop_route,price,charge_per_km,mobile_no,name,age,availability,ride_date FROM passenger p
JOIN driver d ON p.driver_id = d.id WHERE vehicle_type = "Hatchback";

SELECT * FROM passenger JOIN driver ON passenger.driver_id = driver.id;