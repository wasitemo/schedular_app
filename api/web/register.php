<?php
require_once "functions.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $password = $_POST["password"];

    $response = apiRequest("user.php?action=register", "POST", [
        "name" => $name,
        "email" => $email,
        "password" => $password
    ]);

    if ($response["success"]) {
        $_SESSION["token"] = $response["token"];
        header("Location: pages/home.php");
        exit;
    } else {
        echo "<p style='color:red;'>Gagal daftar: " . $response["message"] . "</p>";
    }
}
?>

<form method="POST">
    <input type="text" name="name" placeholder="Nama Lengkap" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Register</button>
</form>
<p>Sudah punya akun? <a href="index.php">Login di sini</a></p>
