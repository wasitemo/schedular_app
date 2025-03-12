CREATE DATABASE coba_api;

USE coba_api;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL,
    member TEXT NOT NULL, -- Store multiple usernames as a comma-separated string
    task_name VARCHAR(255) NOT NULL,
    frequency VARCHAR(255) NOT NULL,
    period_count INT NOT NULL,
    date DATE NOT NULL,
    time TIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (username, email, password) VALUES
('admin', 'admin@example.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHeFupfK9e2G1aJ1z1u1a1u1a1u1a1u1a1');

INSERT INTO tasks (category_name, member, task_name, frequency, period_count, date, time) VALUES
('Category 1', 'admin', 'Task 1', 'Daily', 1, '2023-10-01', '10:00:00'),
('Category 2', 'admin', 'Task 2', 'Weekly', 2, '2023-10-02', '11:00:00');
