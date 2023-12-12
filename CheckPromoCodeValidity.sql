CREATE DEFINER=`root`@`localhost` FUNCTION `CheckPromoCodeValidity`(
	promoCode VARCHAR(20),
    tripID INT
) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	DECLARE isValid BOOLEAN;
   
    -- Check if the promo code is valid for the trip
    SELECT COUNT(*) INTO isValid
    FROM Promotions
    WHERE code = promoCode
    AND NOW() BETWEEN start_date AND end_date
    AND NOT EXISTS (
        SELECT * FROM PromoUsage
        WHERE promoCode = code AND trip_id = tripID
    );
   
RETURN isValid;
END