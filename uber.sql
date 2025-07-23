--alter table Bookings drop column column21;
--select * from Bookings;
--alter table Bookings drop column Vehicle_Images
--select *from bookings;
use [uber DB];
DROP VIEW IF EXISTS Successful_bookingss;
DROP VIEW IF EXISTS ride_distance_for_each_vehicle;
DROP VIEW IF EXISTS canceled_rides_by_customers;
DROP VIEW IF EXISTS top_5_customers;


GO
create view Successful_bookingss as
select * from Bookings 
where Booking_Status = 'Success';
GO
-- 1. Retrieve All Successful Bookings:
select * from Successful_bookingss;


GO  
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, AVG(Ride_Distance) AS avg_distance
FROM bookings
GROUP BY Vehicle_Type;
GO
--2 find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;


GO
CREATE VIEW canceled_rides_by_customers AS
SELECT COUNT(*) AS total_canceled_rides
FROM Bookings
WHERE Booking_Status = 'Canceled by Customer';
Go

-- 3. get the total number of canceled rides by customer:
select * from canceled_rides_by_customers;

GO
CREATE VIEW top_5_customers as
select Top 5 Customer_ID, Count (Booking_ID)as total_rides
from bookings
group by Customer_ID
order by total_rides desc;
GO
--4. List the top 5 customers who booked the highest number of rides
select * from top_5_customers;


GO
create view canceled_by_drivers_p_c_issues as
SELECT COUNT(*) AS canceled_rides_due_pr
FROM Bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';
GO

--5. get the number of rides canceled by drivers due to personal and car related issues
select * from canceled_by_drivers_p_c_issues;


GO
create view max_and_min_rating as
select MAX(Driver_Ratings)as max_rating,
min(Driver_Ratings)as min_rating
from Bookings where Vehicle_Type = 'Prime Sedan';
GO
--6. find the maximum and minimum driver ratings for prime sedan
select * from max_and_min_rating;

GO
create view payment_method as
select * from Bookings 
where Payment_Method = 'UPI';
GO

--7. retrieve all rides where payment was made using upi
select * from payment_method;

GO
create view average_customer_rating as
select Vehicle_Type, avg(Customer_Rating)as avg_customer_rating
from Bookings
group by Vehicle_Type;
Go

-- 8. find average customer rating per vehicle type:
select * from average_customer_rating;

GO
create view total_booking_value as
select sum(Booking_Value) as total_successful_value
from Bookings
where Booking_Status = 'Success';
GO

-- 9. calculate the total booking value of rides completed successfully
select * from total_booking_value;


GO
create view incomplete_rides as
select Booking_ID , Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 1;
GO

--10. list all incomplete rides along with the reason
select * from incomplete_rides;




-- 1. Retrieve All Successful Bookings:
select * from Successful_bookingss;

--2 find the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;

-- 3. get the total number of canceled rides by customer:
select * from canceled_rides_by_customers;

--4. List the top 5 customers who booked the highest number of rides
select * from top_5_customers;

--5. get the number of rides canceled by drivers due to personal and car related issues
select * from canceled_by_drivers_p_c_issues;

--6. find the maximum and minimum driver ratings for prime sedan
select * from max_and_min_rating;

--7. retrieve all rides where payment was made using upi
select * from payment_method;

-- 8. find average customer rating per vehicle type:
select * from average_customer_rating;

-- 9. calculate the total booking value of rides completed successfully
select * from total_booking_value;

--10. list all incomplete rides along with the reason
select * from incomplete_rides;