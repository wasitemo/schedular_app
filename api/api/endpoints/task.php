<?php
require_once "../config.php";
require_once "../auth.php";

header("Content-Type: application/json");
$method = $_SERVER["REQUEST_METHOD"];
$user_id = requireAuth(); // Pastikan user sudah login

if ($method == "GET") {
    $stmt = $conn->prepare("SELECT id, title, description FROM tasks WHERE user_id = ?");
    $stmt->execute([$user_id]);
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

if ($method == "POST" && isset($_GET["action"]) && $_GET["action"] == "create") {
    $data = json_decode(file_get_contents("php://input"), true);
    $stmt = $conn->prepare("INSERT INTO tasks (user_id, title, description) VALUES (?, ?, ?)");
    $stmt->execute([$user_id, $data["title"], $data["description"]]);
    echo json_encode(["success" => true]);
}
?>
