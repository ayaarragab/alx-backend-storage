-- SQL script that ranks country origins of bands
-- ordered by the number of (non-unique) fans
CREATE TRIGGER newWidgetSale AFTER UPDATE ON users(email)
FOR EACH ROW
UPDATE users SET valid_email = 0 WHERE id = NEW.id;
