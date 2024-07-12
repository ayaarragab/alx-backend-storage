-- creation of users table
-- columns: id, email, name
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE len_students INT;
    DECLARE counter INT DEFAULT 1;
    DECLARE avg_scores FLOAT;

    -- Get the total number of users
    SET len_students = (SELECT COUNT(*) FROM users);

    REPEAT
        -- Calculate the weighted average score for the current user
        SET avg_scores = (
            SELECT SUM(c.score * p.weight) / SUM(p.weight)
            FROM corrections AS c
            JOIN projects AS p ON c.project_id = p.id
            WHERE c.user_id = counter
        );

        -- Handle cases where no scores are present
        IF avg_scores IS NULL THEN
            SET avg_scores = 0;
        END IF;

        -- Update the user's average_score
        UPDATE users SET average_score = avg_scores WHERE id = counter;

        -- Increment the counter
        SET counter = counter + 1;
    UNTIL counter > len_students
    END REPEAT;
END //

DELIMITER ;
