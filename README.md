# API Documentation

## Authentication
All endpoints require a Bearer token in the Authorization header.

## Register
**Endpoint:** `/register.php`  
**Method:** `POST`  

**Request Body:**
```json
{
    "username": "your_username",
    "email": "your_email",
    "password": "your_password"
}
```

**Response:**
```json
{
    "message": "Registrasi berhasil"
}
```

## Login
**Endpoint:** `/login.php`  
**Method:** `POST`  

**Request Body:**
```json
{
    "email": "your_email",
    "password": "your_password"
}
```

**Response:**
```json
{
    "message": "Login berhasil",
    "token": "your_token",
    "user": {
        "id": "user_id",
        "username": "your_username",
        "email": "your_email"
    }
}
```

## Create Task
**Endpoint:** `/tasks.php`  
**Method:** `POST`  

**Request Body:**
```json
{
    "idtask": "task_id",
    "categoryname": "category_name",
    "membername": "member_name",
    "taskname": "task_name",
    "frequency": "everyday",
    "period": 1,
    "selectdate": "YYYY-MM-DD",
    "time": "HH:MM:SS"
}
```

**Response:**
```json
{
    "message": "Task created"
}
```

## Get All Tasks
**Endpoint:** `/tasks.php`  
**Method:** `GET`  

**Response:**
```json
[
    {
        "idtask": "task_id",
        "userid": "user_id",
        "categoryname": "category_name",
        "membername": "member_name",
        "taskname": "task_name",
        "frequency": "everyday",
        "period": 1,
        "selectdate": "YYYY-MM-DD",
        "time": "HH:MM:SS"
    },
    ...
]
```

## Update Task
**Endpoint:** `/tasks.php`  
**Method:** `PUT`  

**Request Body:**
```json
{
    "idtask": "task_id",
    "categoryname": "category_name",
    "membername": "member_name",
    "taskname": "task_name",
    "frequency": "everyday",
    "period": 1,
    "selectdate": "YYYY-MM-DD",
    "time": "HH:MM:SS"
}
```

**Response:**
```json
{
    "message": "Task updated"
}
```

## Delete Task
**Endpoint:** `/tasks.php`  
**Method:** `DELETE`  

**Query Parameter:** `idtask`  

**Response:**
```json
{
    "message": "Task deleted"
}
```

## Forgot Password
**Endpoint:** `/tasks.php?action=forgot_password`  
**Method:** `POST`  

**Request Body:**
```json
{
    "email": "your_email",
    "username": "your_username",
    "new_password": "your_new_password"
}
```

**Response:**
```json
{
    "message": "Password updated successfully"
}
```

# Database Structure

## Table: `tasks`
| Column       | Type                                       | Constraints       |
|-------------|------------------------------------------|------------------|
| idtask      | INT(11)                                   | PRIMARY KEY, AUTO_INCREMENT |
| userid      | INT(11)                                   | FOREIGN KEY(users.id) |
| categoryname| VARCHAR(50)                               | NULLABLE         |
| membername  | VARCHAR(50)                               | NULLABLE         |
| taskname    | VARCHAR(50)                               | NULLABLE         |
| frequency   | ENUM('everyday','everyweek','everymonth','everyyear') | NULLABLE |
| period      | INT(11)                                   | NULLABLE         |
| selectdate  | DATE                                      | NULLABLE         |
| time        | TIME                                      | NULLABLE         |

## Table: `users`
| Column    | Type         | Constraints      |
|-----------|------------|-----------------|
| id        | INT(11)     | PRIMARY KEY, AUTO_INCREMENT |
| username  | VARCHAR(50) | UNIQUE, NOT NULL |
| email     | VARCHAR(50) | UNIQUE, NOT NULL |
| password  | VARCHAR(255)| NOT NULL         |
| token     | VARCHAR(255)| NULLABLE         |

# Dependencies
To handle JWT authentication, install the following package:
```
composer require firebase/php-jwt
```
