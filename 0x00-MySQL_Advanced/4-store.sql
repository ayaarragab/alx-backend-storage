-- SQL script that ranks country origins of bands
-- ordered by the number of (non-unique) fans
DELIMITER //
CREATE TRIGGER newWidgetSale AFTER INSERT ON orders 
    FOR EACH ROW
    BEGIN
         UPDATE items SET quantity = quantity - 1 WHERE orders.item_name = NEW.name;
    END //
DELIMITER ;
