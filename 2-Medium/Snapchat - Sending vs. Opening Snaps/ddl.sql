CREATE TABLE activities (
    activity_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_type VARCHAR(50) NOT NULL,
    time_spent DECIMAL(5, 2) NOT NULL,
    activity_date TIMESTAMP NOT NULL
);

CREATE TABLE age_breakdown (
    user_id INT PRIMARY KEY,
    age_bucket VARCHAR(10) NOT NULL
);