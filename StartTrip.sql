CREATE DEFINER=`root`@`localhost` PROCEDURE `StartTrip`(
	IN riderID INT,
    IN driverID INT,
    IN startLocationID INT)
BEGIN
	INSERT INTO Trips (rider_id, driver_id, start_location_id, start_time, status)
    VALUES (riderID, driverID, startLocationID, NOW(), 'In Progress');
END