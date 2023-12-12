CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `driverearnings` AS
    SELECT 
        `d`.`driver_id` AS `driver_id`,
        `d`.`vehicle_plate` AS `vehicle_plate`,
        `d`.`vehicle_model` AS `vehicle_model`,
        `d`.`rating` AS `driver_rating`,
        `u`.`username` AS `driver_username`,
        SUM(`t`.`fare`) AS `total_earnings`
    FROM
        ((`drivers` `d`
        JOIN `trips` `t` ON ((`d`.`driver_id` = `t`.`driver_id`)))
        LEFT JOIN `users` `u` ON ((`d`.`user_id` = `u`.`user_id`)))
    WHERE
        (`t`.`status` = 'Completed')
    GROUP BY `d`.`driver_id`