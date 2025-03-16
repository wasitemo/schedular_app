<?php
include 'config.php';

$data = json_decode(file_get_contents("php://input"));

if(isset($data->username) && isset($data->email) && isset($data->password)){
    $check = $conn->prepare("SELECT * FROM users WHERE username = ? OR email = ?");
    $check->execute([$data->username, $data->email]);
    
    if($check->rowCount() > 0){
        http_response_code(400);
        echo json_encode(["message" => "Username atau email sudah terdaftar"]);
    } else {
        $hashed_password = password_hash($data->password, PASSWORD_DEFAULT);
        $stmt = $conn->prepare("INSERT INTO users (username, email, password) VALUES (?, ?, ?)");
        
        if($stmt->execute([$data->username, $data->email, $hashed_password])){
            http_response_code(201);
            echo json_encode(["message" => "Registrasi berhasil"]);
        } else {
            http_response_code(500);
            echo json_encode(["message" => "Registrasi gagal"]);
        }
    }
}
?>