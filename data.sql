-- Insert sample data into the Users table
INSERT INTO Users (username, password, email, phone_number, registration_date)
VALUES
    ('user1', 'password1', 'user1@example.com', '1234567890', '2023-10-01'),
    ('user2', 'password2', 'user2@example.com', '9876543210', '2023-10-02'),
    ('user3', 'password3', 'user3@example.com', '5555555555', '2023-10-03'),
    ('user4', 'password4', 'user4@example.com', '1111111111', '2023-10-04'),
    ('user5', 'password5', 'user5@example.com', '9999999999', '2023-10-05'),
    ('user6', 'password6', 'user6@example.com', '8888888888', '2023-10-06'),
    ('user7', 'password7', 'user7@example.com', '7777777777', '2023-10-07'),
    ('user8', 'password8', 'user8@example.com', '6666666666', '2023-10-08'),
    ('user9', 'password9', 'user9@example.com', '4444444444', '2023-10-09'),
    ('user10', 'password10', 'user10@example.com', '3333333331', '2023-10-10'),
    ('user11', 'password11', 'user11@example.com', '1234567891', '2023-10-01'),
    ('user12', 'password12', 'user12@example.com', '9876543211', '2023-10-02'),
    ('user13', 'password13', 'user13@example.com', '5555555551', '2023-10-03'),
    ('user14', 'password14', 'user14@example.com', '1111111110', '2023-10-04'),
    ('user15', 'password15', 'user15@example.com', '9999999991', '2023-10-05'),
    ('user16', 'password16', 'user16@example.com', '8888888881', '2023-10-06'),
    ('user17', 'password17', 'user17@example.com', '7777777771', '2023-10-07'),
    ('user18', 'password18', 'user18@example.com', '6666666661', '2023-10-08'),
    ('user19', 'password19', 'user19@example.com', '4444444441', '2023-10-09'),
    ('user20', 'password20', 'user20@example.com', '3333333331', '2023-10-10');

-- Insert sample data into the Drivers table
INSERT INTO Drivers (user_id, driver_license, vehicle_model, vehicle_plate, rating)
VALUES
    (1, 'DL123', 'Car1', 'AB123CD', 4.5),
    (2, 'DL456', 'Car2', 'EF456GH', 4.2),
    (3, 'DL789', 'Car3', 'IJ789KL', 4.7),
    (4, 'DL101', 'Car4', 'MN101OP', 3.8),
    (5, 'DL112', 'Car5', 'QR112ST', 4.9),
    (6, 'DL131', 'Car6', 'UV131WX', 4.1),
    (7, 'DL415', 'Car7', 'YZ415AB', 3.5),
    (8, 'DL161', 'Car8', 'CD161EF', 4.3),
    (9, 'DL718', 'Car9', 'GH718IJ', 4.6),
    (10, 'DL192', 'Car10', 'KL192MN', 3.9);

-- Insert sample data into the Riders table
INSERT INTO Riders (user_id, payment_method, loyalty_points)
VALUES
    (11, 'Credit Card', 100),
    (12, 'PayPal', 50),
    (13, 'Credit Card', 75),
    (14, 'PayPal', 30),
    (15, 'Credit Card', 60),
    (16, 'PayPal', 80),
    (17, 'Credit Card', 40),
    (18, 'PayPal', 90),
    (19, 'Credit Card', 20),
    (20, 'PayPal', 70);

-- Insert sample data into the Locations table
INSERT INTO Locations (name, latitude, longitude)
VALUES
    ('Location A', 40.123456, -74.654321),
    ('Location B', 40.987654, -74.123456),
    ('Location C', 40.567890, -73.987654),
    ('Location D', 41.112233, -73.456789),
    ('Location E', 41.987654, -73.123456),
    ('Location F', 41.345678, -72.789012),
    ('Location G', 42.123456, -72.543210),
    ('Location H', 42.789012, -72.109876),
    ('Location I', 42.345678, -71.876543),
    ('Location J', 42.567890, -71.234567);

-- Insert sample data into the Trips table
INSERT INTO Trips (rider_id, driver_id, start_location_id, end_location_id, start_time, end_time, fare, status)
VALUES
    (11, 1, 1, 2, '2023-10-11 08:00:00', '2023-10-11 09:00:00', 25.00, 'Completed'),
    (12, 2, 2, 1, '2023-10-11 10:00:00', '2023-10-11 11:00:00', 30.00, 'Completed'),
    (13, 3, 3, 4, '2023-10-11 12:00:00', '2023-10-11 13:00:00', 22.50, 'Completed'),
    (14, 4, 4, 5, '2023-10-11 14:00:00', '2023-10-11 15:00:00', 18.75, 'Completed'),
    (15, 5, 5, 6, '2023-10-11 16:00:00', '2023-10-11 17:00:00', 35.00, 'Completed'),
    (16, 6, 6, 7, '2023-10-11 18:00:00', '2023-10-11 19:00:00', 28.50, 'Completed'),
    (17, 7, 7, 8, '2023-10-11 20:00:00', '2023-10-11 21:00:00', 15.00, 'Completed'),
    (18, 8, 8, 9, '2023-10-11 22:00:00', '2023-10-11 23:00:00', 20.00, 'Completed'),
    (19, 9, 9, 10, '2023-10-12 08:00:00', '2023-10-12 09:00:00', 27.50, 'Completed'),
    (20, 10, 10, 1, '2023-10-12 10:00:00', '2023-10-12 11:00:00', 32.00, 'Completed');

-- Insert sample data into the Payments table
INSERT INTO Payments (trip_id, payment_date, payment_amount)
VALUES
    (1, '2023-10-11', 25.00),
    (2, '2023-10-11', 30.00),
    (3, '2023-10-11', 22.50),
    (4, '2023-10-11', 18.75),
    (5, '2023-10-11', 35.00),
    (6, '2023-10-11', 28.50),
    (7, '2023-10-11', 15.00),
    (8, '2023-10-11', 20.00),
    (9, '2023-10-12', 27.50),
    (10, '2023-10-12', 32.00);

-- Insert sample data into the Ratings table
INSERT INTO Ratings (trip_id, rider_rating, driver_rating, comments)
VALUES
    (11, 4, 5, 'Great ride!'),
    (12, 3, 4, 'Good driver.'),
    (13, 5, 5, 'Excellent service.'),
    (14, 2, 3, 'Average trip.'),
    (15, 5, 4, 'Awesome experience!'),
    (16, 3, 4, 'Driver was late.'),
    (17, 4, 2, 'Smooth ride.'),
    (18, 4, 5, 'Friendly driver.'),
    (19, 5, 3, 'Highly recommended.'),
    (20, 4, 4, 'Comfortable ride.');

-- Insert sample data into the PromoCodes table
INSERT INTO Promotions (code, description, start_date, end_date)
VALUES
    ('SUMMER10', 'Summer Discount10', '2023-06-01', '2023-08-31'),
    ('FALL20', 'Fall Promotion20', '2023-09-01', '2023-11-30'),
    ('WINTER15', 'Winter Special15', '2023-12-01', '2024-02-28'),
    ('SPRING25', 'Spring Savings25', '2024-03-01', '2024-05-31'),
    ('HOLIDAY30', 'Holiday Sale30', '2024-12-01', '2024-12-31'),
    ('BACKTOSCHOOL10', 'Back to School10', '2023-08-01', '2023-08-31'),
    ('NEWYEAR20', 'New Year Offer20', '2024-01-01', '2024-01-31'),
    ('BLACKFRIDAY25', 'Black Friday Deal25', '2023-11-24', '2023-11-24'),
    ('CYBERMONDAY15', 'Cyber Monday Special15', '2023-11-27', '2023-11-27'),
    ('LABORDAY10', 'Labor Day Discount10', '2023-09-04', '2023-09-04');

-- Insert sample data into the PromoUsage table
INSERT INTO PromoUsage (user_id, promotion_id, used_date)
VALUES
    (1, 1, '2023-07-15'),
    (2, 2, '2023-10-10'),
    (3, 3, '2024-01-20'),
    (4, 4, '2024-04-05'),
    (5, 5, '2024-12-15'),
    (6, 1, '2023-08-20'),
    (7, 2, '2023-11-24'),
    (8, 3, '2024-02-15'),
    (9, 4, '2024-05-01'),
    (10, 5, '2024-12-25');
    
-- Insert sample data into the RideHistory table
INSERT INTO RideHistory (rider_id, trip_id)
VALUES
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 10);

-- Insert sample data into the DriverAvailability table
INSERT INTO DriverAvailability (driver_id, is_available, last_update)
VALUES
    (1, 1, NOW()),
    (2, 0, NOW()),
    (3, 1, NOW()),
    (4, 0, NOW()),
    (5, 1, NOW()),
    (6, 0, NOW()),
    (7, 1, NOW()),
    (8, 0, NOW()),
    (9, 1, NOW()),
    (10, 0, NOW());  

-- Insert sample data into the VehicleTypes table
INSERT INTO VehicleTypes (name, capacity, description)
VALUES
    ('Economy', 4, 'Standard vehicle'),
    ('Luxury', 2, 'High-end luxury car'),
    ('SUV', 6, 'Sport Utility Vehicle'),
    ('Van', 8, 'Passenger van'),
    ('Electric', 4, 'Electric vehicle'),
    ('Convertible', 2, 'Convertible car'),
    ('Motorcycle', 1, 'Motorcycle'),
    ('Truck', 2, 'Pickup truck'),
    ('Hybrid', 5, 'Hybrid vehicle'),
    ('Limousine', 10, 'Limousine');

COMMIT;
