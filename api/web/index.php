<?php
require_once "functions.php";
session_start();

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = $_POST["email"];
    $password = $_POST["password"];

    $response = apiRequest("user.php?action=login", "POST", [
        "email" => $email,
        "password" => $password
    ]);

    if ($response["success"]) {
        $_SESSION["token"] = $response["token"];
        header("Location: pages/home.php");
        exit;
    } else {
        echo "<p style='color:red;'>Login gagal: " . $response["message"] . "</p>";
    }
}
?>
<form method="POST">
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <button type="submit">Login</button>
</form>
