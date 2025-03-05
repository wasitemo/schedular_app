<?php
require_once "../config.php";
require_once "../auth.php";
error_reporting(E_ALL);
ini_set('display_errors', 1);

header("Content-Type: application/json");
$method = $_SERVER["REQUEST_METHOD"];

if ($method == "POST" && isset($_GET["action"]) && $_GET["action"] == "register") {
    $data = json_decode(file_get_contents("php://input"), true);
    $name = trim($data["name"] ?? "");
    $email = trim($data["email"] ?? "");
    $password = trim($data["password"] ?? "");

    // Validasi input
    if (empty($name) || empty($email) || empty($password)) {
        echo json_encode(["success" => false, "message" => "Semua kolom harus diisi"]);
        exit;
    }

    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo json_encode(["success" => false, "message" => "Format email tidak valid"]);
        exit;
    }

    try {
        // Cek apakah email sudah digunakan
        $checkStmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
        $checkStmt->execute([$email]);

        if ($checkStmt->fetch()) {
            echo json_encode(["success" => false, "message" => "Email sudah terdaftar"]);
            exit;
        }

        // Hash password sebelum disimpan
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        // Simpan user baru ke database
        $stmt = $conn->prepare("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
        if ($stmt->execute([$name, $email, $hashedPassword])) {
            $user_id = $conn->lastInsertId();
            $token = createToken($user_id); // Buat token untuk user baru
            echo json_encode(["success" => true, "token" => $token]);
        } else {
            echo json_encode(["success" => false, "message" => "Gagal mendaftar"]);
        }
    } catch (Exception $e) {
        echo json_encode(["success" => false, "message" => "Terjadi kesalahan: " . $e->getMessage()]);
    }
}

if ($method == "POST" && isset($_GET["action"]) && $_GET["action"] == "login") {
    $data = json_decode(file_get_contents("php://input"), true);
    $email = trim($data["email"]);
    $password = trim($data["password"]);

    $query = "SELECT id, password FROM users WHERE email = ?";
    $stmt = $conn->prepare($query);
    $stmt->execute([$email]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user["password"])) {
        $token = createToken($user["id"]);
        echo json_encode(["success" => true, "token" => $token]);
    } else {
        echo json_encode(["success" => false, "message" => "Email atau password salah"]);
    }
}

// Mendapatkan data user berdasarkan token
if ($method == "GET" && isset($_GET["action"]) && $_GET["action"] == "profile") {
    $user_id = requireAuth(); // Pastikan user sudah login
    $stmt = $conn->prepare("SELECT id, name, email FROM users WHERE id = ?");
    $stmt->execute([$user_id]);
    echo json_encode($stmt->fetch(PDO::FETCH_ASSOC));
}
?>
