-- creation of users table
-- columns: id, email, name
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers ()
BEGIN
    DECLARE LEN_STUDENTS INT;
    SET LEN_STUDENTS = (SELECT COUNT(*) FROM users);
    DECLARE counter INT DEFAULT 0;
    REPEAT
        DECLARE avg_scores FLOAT;
        SET avg_scores = (
            SELECT SUM(c.score * p.weight) / SUM(p.weight)
            FROM corrections AS c
            JOIN projects AS p ON c.project_id = p.id
            WHERE c.user_id = counter
        );
        UPDATE users SET average_score = avg_scores WHERE id = counter;
        SET counter = counter + 1;
    UNTIL counter >= LEN_STUDENTS;
    END REPEAT;
END //

DELIMITER ;
