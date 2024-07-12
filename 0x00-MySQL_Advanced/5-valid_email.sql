-- SQL script that ranks country origins of bands
-- ordered by the number of (non-unique) fans
DELIMITER //
CREATE TRIGGER newWidgetSale BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
IF NEW.email <> OLD.email
THEN
    SET NEW.valid_email = 0;
END IF;
END
//
DELIMITER;
