-- creation of users table
-- columns: id, email, name
CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    name TEXT,
    country ENUM('US', 'CO', 'TN') NOT NULL,
    PRIMARY KEY (id)
);

