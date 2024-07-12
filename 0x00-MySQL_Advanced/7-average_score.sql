-- creation of users table
-- columns: id, email, name
DELIMITER //

CREATE PROCEDURE ComputeAverageScoreForUser (
    IN user_id INT
)
BEGIN
    DECLARE avg_Scores FLOAT;
    SET avg_Scores = (SELECT AVG(score) FROM corrections AS c WHERE c.user_id = user_id);
    UPDATE users SET average_score = avg_Scores WHERE id = user_id;
END //

DELIMITER ;
