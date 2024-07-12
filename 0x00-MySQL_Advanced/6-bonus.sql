-- creation of users table
-- columns: id, email, name
DELIMITER //
CREATE PROCEDURE AddBonus (user_id INT, project_name VARCHAR(255), score INT)
BEGIN
    DECLARE project_id INT;
    IF(SELECT COUNT(*) FROM projects WHERE name = project_name) = 0
    THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF; 
    SET project_id = (SELECT id FROM projects WHERE name = project_name LIMIT 1);
    INSERT INTO corrections (`user_id`, `project_name`, `score`) VALUES (user_id, project_name, score);
END //
DELIMITER ;
