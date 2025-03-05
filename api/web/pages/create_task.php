<?php
require_once "../functions.php";
session_start();
$user_id = $_SESSION["user_id"] ?? 1;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST["title"];
    $description = $_POST["description"];
    
    apiRequest("task.php?action=create", "POST", [
        "user_id" => $user_id,
        "title" => $title,
        "description" => $description
    ]);

    header("Location: home.php");
}

echo "<form method='POST'>
        <input type='text' name='title' placeholder='Task Title' required>
        <textarea name='description' placeholder='Description'></textarea>
        <button type='submit'>Create Task</button>
      </form>";
?>
