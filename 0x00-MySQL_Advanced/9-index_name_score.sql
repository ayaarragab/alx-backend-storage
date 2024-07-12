-- creation of users table
-- columns: id, email, name
CREATE INDEX idx_name_first_score ON names(name(1), score)
