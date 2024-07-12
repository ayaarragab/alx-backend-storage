-- creation of users table
-- columns: id, email, name
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
    IN user_id INT
)
BEGIN
    DECLARE avg_Scores FLOAT;
    SET avg_Scores = (SELECT AVGW(c.score, p.weight) FROM corrections AS c JOIN projects AS P ON c.project_id = p.id WHERE c.user_id = user_id);
    UPDATE users SET average_score = avg_Scores WHERE id = user_id;
END //

DELIMITER ;
