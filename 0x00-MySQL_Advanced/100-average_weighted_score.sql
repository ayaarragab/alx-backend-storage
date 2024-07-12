-- creation of users table
-- columns: id, email, name
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
    IN user_id INT
)
BEGIN
    DECLARE avg_scores FLOAT;
    SET avg_scores = (
        SELECT SUM(c.score * p.weight) / SUM(p.weight)
        FROM corrections AS c
        JOIN projects AS p ON c.project_id = p.id
        WHERE c.user_id = user_id
    );
    UPDATE users SET average_score = avg_scores WHERE id = user_id;
END //

DELIMITER ;
