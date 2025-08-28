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
