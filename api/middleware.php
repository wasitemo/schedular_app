<?php
require 'vendor/autoload.php';
use \Firebase\JWT\JWT;

function verifyToken() {
    $headers = apache_request_headers();
    if (isset($headers['Authorization'])) {
        $token = str_replace('Bearer ', '', $headers['Authorization']);
        try {
            $decoded = JWT::decode($token, "your_secret_key", array('HS256'));
            return (array) $decoded->data;
        } catch (Exception $e) {
            http_response_code(401);
            echo json_encode(["message" => "Access denied", "error" => $e->getMessage()]);
            exit();
        }
    } else {
        http_response_code(401);
        echo json_encode(["message" => "Access denied"]);
        exit();
    }
}
?>
