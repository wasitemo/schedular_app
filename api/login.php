<?php
include 'config.php';

try {
    $data = json_decode(file_get_contents("php://input"));
    
    if(!$data || !isset($data->email) || !isset($data->password)) {
        http_response_code(400);
        echo json_encode(["message" => "Invalid request data"]);
        exit;
    }

    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ? OR username = ?");
    $stmt->execute([$data->email, $data->email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if($user && password_verify($data->password, $user['password'])){
        $token = bin2hex(random_bytes(16));
        
        $update = $conn->prepare("UPDATE users SET token = ? WHERE id = ?");
        $update->execute([$token, $user['id']]);
        
        echo json_encode([
            "message" => "Login berhasil",
            "token" => $token,
            "user" => [
                "id" => $user['id'],
                "username" => $user['username'],
                "email" => $user['email']
            ]
        ]);
    } else {
        http_response_code(401);
        echo json_encode(["message" => "Email atau password salah"]);
    }
} catch(PDOException $e) {
    http_response_code(500);
    echo json_encode([
        "message" => "Database error: " . $e->getMessage(),
        "error_code" => $e->getCode()
    ]);
} catch(Exception $e) {
    http_response_code(500);
    echo json_encode(["message" => "General error: " . $e->getMessage()]);
}
?>