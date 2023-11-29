CREATE TRIGGER `mysql-testQL`.`PrefixColourTrigger`
AFTER INSERT ON `mysql-testQL`.`Life.Organism`
FOR EACH ROW
BEGIN
    SET NEW.colour = CONCAT('rgb_', NEW.colour);
END;