-- creation of users table
-- columns: id, email, name
-- simple procedure
DELIMITER //
CREATE PROCEDURE AddBonus (user_id INT, project_name VARCHAR(255), score INT)
BEGIN
    INSERT INTO corrections (`user_id`, `project_name`, `score`) VALUES (user_id, project_name, score);
END //
DELIMITER ;

CALL AddBonus();
