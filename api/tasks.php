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

$method = $_SERVER['REQUEST_METHOD'];
$user_id = authenticate($conn);

// CREATE TASK
if($method == 'POST'){
    $data = json_decode(file_get_contents("php://input"));
    
    $stmt = $conn->prepare("INSERT INTO tasks 
        (idtask, userid, categoryname, membername, taskname, radio, period, selectdate, time)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    
    $success = $stmt->execute([
        $data->idtask,
        $user_id,
        $data->categoryname,
        $data->membername,
        $data->taskname,
        $data->radio,
        $data->period,
        $data->selectdate,
        $data->time
    ]);
    
    if($success){
        http_response_code(201);
        echo json_encode(["message" => "Task created"]);
    }
}

// GET ALL TASKS
if($method == 'GET'){
    $stmt = $conn->prepare("SELECT * FROM tasks WHERE userid = ?");
    $stmt->execute([$user_id]);
    $tasks = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    echo json_encode($tasks);
}

// UPDATE TASK
if($method == 'PUT'){
    $data = json_decode(file_get_contents("php://input"));
    
    $stmt = $conn->prepare("UPDATE tasks SET 
        categoryname = ?,
        membername = ?,
        taskname = ?,
        radio = ?,
        period = ?,
        selectdate = ?,
        time = ?
        WHERE idtask = ? AND userid = ?");
    
    $success = $stmt->execute([
        $data->categoryname,
        $data->membername,
        $data->taskname,
        $data->radio,
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

// DELETE TASK
if($method == 'DELETE'){
    $idtask = $_GET['idtask'];
    
    $stmt = $conn->prepare("DELETE FROM tasks WHERE idtask = ? AND userid = ?");
    $success = $stmt->execute([$idtask, $user_id]);
    
    if($success){
        echo json_encode(["message" => "Task deleted"]);
    }
}
?>