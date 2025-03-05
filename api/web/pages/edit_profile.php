<?php
require_once "../functions.php";
session_start();
$user_id = $_SESSION["user_id"] ?? 1;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!empty($_FILES["profile_picture"]["name"])) {
        $target_file = $_FILES["profile_picture"]["tmp_name"];
        move_uploaded_file($target_file, "../api/img/profilpicture-$user_id.jpg");
    }
    header("Location: home.php");
}

echo "<form method='POST' enctype='multipart/form-data'>
        <input type='file' name='profile_picture'>
        <button type='submit'>Upload</button>
      </form>";
?>
