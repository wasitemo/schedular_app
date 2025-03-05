<?php
require_once "../functions.php";
session_start();
$user_id = $_SESSION["user_id"] ?? 1; 

$user = apiRequest("user.php?user_id=$user_id");
$tasks = apiRequest("task.php?user_id=$user_id");

echo "<h2>Welcome, " . htmlspecialchars($user['name']) . "</h2>";
echo "<img src='../api/img/profilpicture-$user_id.jpg' width='100' height='100'>";
echo "<a href='edit_profile.php'>Edit Profile</a>";

echo "<h3>Tasks</h3>";
foreach ($tasks as $task) {
    echo "<p>" . htmlspecialchars($task["title"]) . " - <a href='edit_task.php?id=" . $task["id"] . "'>Edit</a></p>";
}
echo "<a href='create_task.php'>Create Task</a>";
?>
