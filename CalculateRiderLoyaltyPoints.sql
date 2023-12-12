CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateRiderLoyaltyPoints`(
	riderID INT,
    tripID INT
) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE loyaltyPoints INT;
   
    -- Calculate loyalty points (example: 10 points for every completed trip)
    SELECT COUNT(*) * 10 INTO loyaltyPoints
    FROM RideHistory
    WHERE rider_id = loyaltyPoints;
RETURN 1;
END