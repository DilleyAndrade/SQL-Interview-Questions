CREATE TABLE user_actions (
    user_id INT NOT NULL,
    event_id INT NOT NULL PRIMARY KEY,
    event_type VARCHAR(50) NOT NULL,
    event_date DATETIME NOT NULL
);