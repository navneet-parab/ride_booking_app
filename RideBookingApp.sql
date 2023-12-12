CREATE
    ALGORITHM = UNDEFINED
    DEFINER = `root`@`localhost`
    SQL SECURITY DEFINER
VIEW `RideBookingApp`.`activetrips` AS
    SELECT
        `t`.`trip_id` AS `trip_id`,
        `t`.`start_time` AS `start_time`,
        `t`.`end_time` AS `end_time`,
        `t`.`fare` AS `fare`,
        `t`.`status` AS `status`,
        `r`.`username` AS `rider_username`,
        `d`.`username` AS `driver_username`
    FROM
        ((`RideBookingApp`.`trips` `t`
        JOIN `RideBookingApp`.`users` `r` ON (`t`.`rider_id` = `r`.`user_id`))
        LEFT JOIN `RideBookingApp`.`users` `d` ON (`t`.`driver_id` = `d`.`user_id`))
    WHERE
        `t`.`status` = 'In Progress'