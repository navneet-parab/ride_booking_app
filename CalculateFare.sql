CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateFare`(
	distance DECIMAL(8, 2),
    duration INT,
    vehicleTypeID INT
) RETURNS decimal(8,2)
    DETERMINISTIC
BEGIN
	DECLARE baseFare DECIMAL(8, 2);
   
    -- Calculate base fare based on vehicle type
    SELECT fare INTO baseFare
    FROM VehicleTypes
    WHERE vehicle_type_id = vehicleTypeID;
   
    -- Calculate total fare based on distance, duration, and base fare
RETURN baseFare + (distance * 0.1) + (duration * 0.05);
END