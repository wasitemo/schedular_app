# API Documentation

## Authentication

### Register
- Endpoint: `POST /api/register.php`
- Request Body:
  ```json
  {
    "username": "your_username",
    "email": "your_email",
    "password": "your_password"
  }
  ```
- Response:
  ```json
  {
    "message": "User registered successfully"
  }
  ```

### Login
- Endpoint: `POST /api/login.php`
- Request Body:
  ```json
  {
    "email": "your_email",
    "password": "your_password"
  }
  ```
- Response:
  ```json
  {
    "message": "Login successful",
    "token": "your_jwt_token"
  }
  ```

## Tasks

### Create Task
- Endpoint: `POST /api/task.php`
- Headers: `Authorization: Bearer your_jwt_token`
- Request Body:
  ```json
  {
    "category_name": "Category 1",
    "member": ["username1", "username2"], // Array of usernames
    "task_name": "Task 1",
    "frequency": "Daily",
    "period_count": 1,
    "date": "2023-10-01",
    "time": "10:00:00"
  }
  ```
- Response:
  ```json
  {
    "message": "Task added successfully"
  }
  ```

### Update Task
- Endpoint: `PUT /api/task.php`
- Headers: `Authorization: Bearer your_jwt_token`
- Request Body:
  ```json
  {
    "id": 1,
    "category_name": "Updated Category",
    "member": ["username1", "username2"], // Array of usernames
    "task_name": "Updated Task",
    "frequency": "Weekly",
    "period_count": 2,
    "date": "2023-10-02",
    "time": "11:00:00"
  }
  ```
- Response:
  ```json
  {
    "message": "Task updated successfully"
  }
  ```

### Delete Task
- Endpoint: `DELETE /api/task.php`
- Headers: `Authorization: Bearer your_jwt_token`
- Request Body:
  ```json
  {
    "id": 1
  }
  ```
- Response:
  ```json
  {
    "message": "Task deleted successfully"
  }
  ```

### Get Tasks
- Endpoint: `GET /api/task.php`
- Headers: `Authorization: Bearer your_jwt_token`
- Response:
  ```json
  [
    {
      "id": 1,
      "category_name": "Category 1",
      "member": ["username1", "username2"], // Array of usernames
      "task_name": "Task 1",
      "frequency": "Daily",
      "period_count": 1,
      "date": "2023-10-01",
      "time": "10:00:00"
    },
    // ...other tasks
  ]
  ```

## Database Schema

### Users Table
- Columns:
  - `id` INT AUTO_INCREMENT PRIMARY KEY
  - `username` VARCHAR(255) NOT NULL
  - `email` VARCHAR(255) NOT NULL
  - `password` VARCHAR(255) NOT NULL

### Tasks Table
- Columns:
  - `id` INT AUTO_INCREMENT PRIMARY KEY
  - `category_name` VARCHAR(255) NOT NULL
  - `member` TEXT NOT NULL (Comma-separated usernames)
  - `task_name` VARCHAR(255) NOT NULL
  - `frequency` VARCHAR(255) NOT NULL
  - `period_count` INT NOT NULL
  - `date` DATE NOT NULL
  - `time` TIME NOT NULL
