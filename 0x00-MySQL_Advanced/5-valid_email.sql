-- SQL script that ranks country origins of bands
-- ordered by the number of (non-unique) fans
CREATE TRIGGER newWidgetSale AFTER UPDATE ON users(email)
FOR EACH ROW
IF NEW.email <> OLD.email
THEN
    SET NEW.valid_email = 0;
END IF;
