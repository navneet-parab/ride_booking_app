CREATE DEFINER=`root`@`localhost` PROCEDURE `EndTrip`(
	IN tripID INT,
    IN endLocationID INT,
    IN fare DECIMAL(8, 2)
)
BEGIN
	UPDATE Trips
    SET end_location_id = endLocationID, end_time = NOW(), fare = fare, status = 'Completed'
    WHERE trip_id = tripID;
END