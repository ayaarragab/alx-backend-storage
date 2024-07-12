-- SQL script that ranks country origins of bands
-- ordered by the number of (non-unique) fans
CREATE TRIGGER newWidgetSale AFTER INSERT ON orders 
FOR EACH ROW
UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name;
