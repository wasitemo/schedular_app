<?php
require_once "../functions.php";
session_start();
$user_id = $_SESSION["user_id"] ?? 1;
$task_id = $_GET["id"] ?? null;

$task = apiRequest("task.php?task_id=$task_id");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $title = $_POST["title"];
    $description = $_POST["description"];
    
    apiRequest("task.php?action=update", "PUT", [
        "id" => $task_id,
        "title" => $title,
        "description" => $description
    ]);

    header("Location: home.php");
}

echo "<form method='POST'>
        <input type='text' name='title' value='" . htmlspecialchars($task["title"]) . "' required>
        <textarea name='description'>" . htmlspecialchars($task["description"]) . "</textarea>
        <button type='submit'>Update Task</button>
      </form>";
?>
