create database ola;
use ola;

CREATE TABLE rides (
  ride_id INT PRIMARY KEY,
  rider_id INT NOT NULL,
  driver_id INT NOT NULL,
  pickup_location VARCHAR(50) NOT NULL,
  dropoff_location VARCHAR(50) NOT NULL,
  ride_fare decimal(10,2) NOT NULL
);

INSERT INTO rides (ride_id, rider_id, driver_id, pickup_location, dropoff_location,ride_fare)
VALUES
  (1, 101, 201, 'Chennai', 'Coimbatore',500.00),
  (2, 102, 202, 'Delhi', 'Coimbatore',500.00),
  (3, 103, 203, 'Banglore', 'Mumbai',500.00);
      
select * from rides;

select * from rides
where dropoff_location = 'Coimbatore';

select * from rides
where dropoff_location = 'Coimbatore'
order by ride_id desc;

select ride_fare, count(*) AS total_fares
from rides
group by ride_fare;

select dropoff_location, sum(ride_fare) AS total_fares
from rides
group by dropoff_location;

select count(*) AS pickup_loction_not_in_chennai_or_delhi
from rides
where pickup_location not in ('Chennai','Delhi');

select dropoff_location, max(ride_fare) AS highest_ride_fare
from rides
group by dropoff_location;

SELECT * FROM rides
ORDER BY ride_id desc
OFFSET 1 ROWS FETCH NEXT 2 ROWS ONLY;

SELECT * FROM rides
ORDER BY ride_id desc
LIMIT 2 OFFSET 1;

SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY ride_id) AS rn
    FROM rides
) AS temp
WHERE rn>1;  

SELECT * FROM rides
WHERE ride_id NOT IN (
    SELECT ride_id FROM rides
    ORDER BY ride_id
    LIMIT 1
);

select dropoff_location, sum(ride_fare)
from rides
group by dropoff_location having sum(ride_fare)>500;

select ride_id, avg(ride_fare)
from rides
group by ride_id having sum(ride_fare)>200;

select ride_id, max(ride_fare)
from rides
group by ride_id having max(ride_fare)=500;

select pickup_location, count(*) as total_rides ,sum(ride_fare) as total_fare
from rides
group by pickup_location having total_rides > 1 and total_fare < 1000;

select dropoff_location, avg(ride_fare) as Average_Fare
from rides
group by dropoff_location having Average_Fare between 50 and 2000;

create database lkq;
use lkq;

create table award_winners(
id int,
name varchar(25),
award_name varchar(30));

insert into award_winners values(001,'Karthick','Volleyball winners'),(002,'Gopi','Basketball Runners'),(003,'Adib','Oscar winners'),
(004,'Harij','English SpellBee 2nd Runner-up'),(005,'Loki','Volleyball winners'),(006,'Sakthi','Badminton Nationals runners'),
(007,'Iqhlas','Debug winners'),(008,'AK','Basketball runners'),(009,'Kamal','Hackathon runners'),
(010,'Barath','Hackathon winners');

select * from award_winners;

create table students(
id int,
name varchar(25));

insert into students values(005,'Loki'),(1001,'Srihari'),(1003,'Dinesh'),(001,'Karthick'),(1005,'Tharun'),
(1006,'Vamsi'),(1007,'Monish'),(1008,'Rohith'),(1009,'Alwyn'),(1010,'Akash');

select * from students;

select * from students 
where id=(select id from award_winners where id=5);

select * from students 
where id=(select id from award_winners where name="karthick");

select * from award_winners
where id=(select id from students where id=1);

select * from award_winners
where id=(select id from students where name="Loki");
