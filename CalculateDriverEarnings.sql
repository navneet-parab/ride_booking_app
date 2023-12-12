CREATE DEFINER=`root`@`localhost` PROCEDURE `CalculateDriverEarnings`(
	IN driverID INT
)
BEGIN
	SELECT SUM(fare) AS earnings
    FROM Trips
    WHERE driver_id = driverID;
END