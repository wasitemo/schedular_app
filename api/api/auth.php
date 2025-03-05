<?php
require_once "config.php";
require_once "vendor/autoload.php";

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

$key = "your_secret_key"; // Ubah dengan key yang lebih aman

function createToken($user_id) {
    global $key;
    $payload = [
        "user_id" => $user_id,
        "exp" => time() + (60 * 60 * 24) // Token berlaku 24 jam
    ];
    return JWT::encode($payload, $key, "HS256");
}

function verifyToken($token) {
    global $key;
    try {
        return JWT::decode($token, new Key($key, "HS256"));
    } catch (Exception $e) {
        return false;
    }
}

function requireAuth() {
    $headers = getallheaders();
    if (!isset($headers["Authorization"])) {
        http_response_code(401);
        echo json_encode(["success" => false, "message" => "Unauthorized"]);
        exit;
    }

    $token = str_replace("Bearer ", "", $headers["Authorization"]);
    $decoded = verifyToken($token);

    if (!$decoded) {
        http_response_code(401);
        echo json_encode(["success" => false, "message" => "Invalid token"]);
        exit;
    }

    return $decoded->user_id;
}
?>
