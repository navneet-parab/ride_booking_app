-- Create the database
CREATE DATABASE RideBookingApp;

-- Switch to the new database
USE RideBookingApp;

-- Create the Users table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone_number VARCHAR(20),
    registration_date DATE
);

-- Create the Drivers table
CREATE TABLE Drivers (
    driver_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    driver_license VARCHAR(20) NOT NULL,
    vehicle_model VARCHAR(255) NOT NULL,
    vehicle_plate VARCHAR(15) NOT NULL,
    rating DECIMAL(3, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create the Riders table
CREATE TABLE Riders (
    rider_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    payment_method VARCHAR(50),
    loyalty_points INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Create the Locations table
CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6)
);

-- Create the Trips table
CREATE TABLE Trips (
    trip_id INT AUTO_INCREMENT PRIMARY KEY,
    rider_id INT NOT NULL,
    driver_id INT,
    start_location_id INT NOT NULL,
    end_location_id INT,
    start_time DATETIME,
    end_time DATETIME,
    fare DECIMAL(8, 2),
    status VARCHAR(20),
    FOREIGN KEY (rider_id) REFERENCES Riders(rider_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
    FOREIGN KEY (start_location_id) REFERENCES Locations(location_id),
    FOREIGN KEY (end_location_id) REFERENCES Locations(location_id)
);

-- Create the Payments table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    trip_id INT NOT NULL,
    payment_date DATE,
    payment_amount DECIMAL(8, 2),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

-- Create the Ratings table
CREATE TABLE Ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    trip_id INT NOT NULL,
    rider_rating DECIMAL(2, 1),
    driver_rating DECIMAL(2, 1),
    comments TEXT,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

-- Create the RideHistory table (Many-to-Many relationship)
CREATE TABLE RideHistory (
    rider_id INT,
    trip_id INT,
    PRIMARY KEY (rider_id, trip_id),
    FOREIGN KEY (rider_id) REFERENCES Riders(rider_id),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

-- Create the DriverAvailability table
CREATE TABLE DriverAvailability (
    driver_id INT PRIMARY KEY,
    is_available BOOLEAN,
    last_update DATETIME,
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

-- Create the VehicleTypes table
CREATE TABLE VehicleTypes (
    vehicle_type_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INT,
    description TEXT
);

-- Create the Promotions table
CREATE TABLE Promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(20) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE
);

-- Create the PromoUsage table (Many-to-One relationship)CalculateFareCalculateFareCheckPromoCodeValidity
CREATE TABLE PromoUsage (
    promo_usage_id INT AUTO_INCREMENT PRIMARY KEY,
    promotion_id INT NOT NULL,
    user_id INT NOT NULL,
    used_date DATE,
    FOREIGN KEY (promotion_id) REFERENCES Promotions(promotion_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
