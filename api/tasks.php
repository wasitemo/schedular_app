<?php
include 'config.php';

function authenticate($conn) {
    $headers = apache_request_headers();
    if(!isset($headers['Authorization'])){
        http_response_code(401);
        echo json_encode(["message" => "Unauthorized"]);
        exit;
    }
    
    $token = str_replace('Bearer ', '', $headers['Authorization']);
    $stmt = $conn->prepare("SELECT id FROM users WHERE token = ?");
    $stmt->execute([$token]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if(!$user){
        http_response_code(401);
        echo json_encode(["message" => "Invalid token"]);
        exit;
    }
    
    return $user['id'];
}

// Serverless function: Create Task
function createTask($conn, $data, $user_id) {
    $stmt = $conn->prepare("INSERT INTO tasks 
        (idtask, userid, categoryname, membername, taskname, frequency, period, selectdate, time)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    $success = $stmt->execute([
        $data->idtask,
        $user_id,
        $data->categoryname,
        $data->membername,
        $data->taskname,
        $data->frequency,
        $data->period,
        $data->selectdate,
        $data->time
    ]);
    
    if($success){
        http_response_code(201);
        echo json_encode(["message" => "Task created"]);
    }
}

// Serverless function: Get All Tasks
function getAllTasks($conn, $user_id) {
    $stmt = $conn->prepare("SELECT * FROM tasks WHERE userid = ?");
    $stmt->execute([$user_id]);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Serverless function: Update Task
function updateTask($conn, $data, $user_id) {
    $stmt = $conn->prepare("UPDATE tasks SET 
        categoryname = ?,
        membername = ?,
        taskname = ?,
        frequency = ?,
        period = ?,
        selectdate = ?,
        time = ?
        WHERE idtask = ? AND userid = ?");
    $success = $stmt->execute([
        $data->categoryname,
        $data->membername,
        $data->taskname,
        $data->frequency,
        $data->period,
        $data->selectdate,
        $data->time,
        $data->idtask,
        $user_id
    ]);
    
    if($success){
        echo json_encode(["message" => "Task updated"]);
    }
}

// Serverless function: Delete Task
function deleteTask($conn, $idtask, $user_id) {
    $stmt = $conn->prepare("DELETE FROM tasks WHERE idtask = ? AND userid = ?");
    $success = $stmt->execute([$idtask, $user_id]);
    
    if($success){
        echo json_encode(["message" => "Task deleted"]);
    }
}

$method = $_SERVER['REQUEST_METHOD'];
$user_id = authenticate($conn);

// CREATE TASK
if($method == 'POST' && !isset($_GET['action'])){
    $data = json_decode(file_get_contents("php://input"));
    createTask($conn, $data, $user_id);
}

// GET ALL TASKS
if($method == 'GET'){
    $tasks = getAllTasks($conn, $user_id);
    echo json_encode($tasks);
}

// UPDATE TASK
if($method == 'PUT'){
    $data = json_decode(file_get_contents("php://input"));
    updateTask($conn, $data, $user_id);
}

// DELETE TASK
if($method == 'DELETE'){
    $idtask = $_GET['idtask'];
    deleteTask($conn, $idtask, $user_id);
}

// FORGOT PASSWORD
if($method == 'POST' && isset($_GET['action']) && $_GET['action'] == 'forgot_password'){
    $data = json_decode(file_get_contents("php://input"));
    
    if(isset($data->email) && isset($data->username) && isset($data->new_password)){
        $stmt = $conn->prepare("SELECT * FROM users WHERE email = ? AND username = ?");
        $stmt->execute([$data->email, $data->username]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);
        
        if($user){
            $hashed_password = password_hash($data->new_password, PASSWORD_DEFAULT);
            $update = $conn->prepare("UPDATE users SET password = ? WHERE id = ?");
            $update->execute([$hashed_password, $user['id']]);
            
            echo json_encode(["message" => "Password updated successfully"]);
        } else {
            http_response_code(404);
            echo json_encode(["message" => "User not found"]);
        }
    } else {
        http_response_code(400);
        echo json_encode(["message" => "Invalid request data"]);
    }
}
?>