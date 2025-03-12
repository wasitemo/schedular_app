<?php
include 'db.php';
require 'vendor/autoload.php';
use \Firebase\JWT\JWT;

$data = json_decode(file_get_contents("php://input"));

$email = $data->email;
$password = $data->password;

$sql = "SELECT * FROM users WHERE email='$email'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    if (password_verify($password, $row['password'])) {
        $key = "your_secret_key";
        $payload = [
            "iss" => "http://localhost",
            "aud" => "http://localhost",
            "iat" => time(),
            "nbf" => time(),
            "exp" => time() + (60*60), // Token expires in 1 hour
            "data" => [
                "id" => $row['id'],
                "username" => $row['username']
            ]
        ];

        $jwt = JWT::encode($payload, $key);
        echo json_encode(["message" => "Login successful", "token" => $jwt]);
    } else {
        http_response_code(401);
        echo json_encode(["message" => "Invalid password"]);
    }
} else {
    http_response_code(404);
    echo json_encode(["message" => "No user found with this email"]);
}

$conn->close();
?>
