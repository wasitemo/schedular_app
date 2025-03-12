<?php
include 'db.php';
include 'middleware.php';

$method = $_SERVER['REQUEST_METHOD'];
$data = json_decode(file_get_contents("php://input"));

$user = verifyToken();

switch ($method) {
    case 'POST':
        $category_name = $data->category_name;
        $member = implode(',', $data->member); // Convert array of usernames to comma-separated string
        $task_name = $data->task_name;
        $frequency = $data->frequency;
        $period_count = $data->period_count;
        $date = $data->date;
        $time = $data->time;

        $sql = "INSERT INTO tasks (category_name, member, task_name, frequency, period_count, date, time) VALUES ('$category_name', '$member', '$task_name', '$frequency', '$period_count', '$date', '$time')";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Task added successfully"]);
        } else {
            http_response_code(500);
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
        break;

    case 'PUT':
        $id = $data->id;
        $category_name = $data->category_name;
        $member = implode(',', $data->member); // Convert array of usernames to comma-separated string
        $task_name = $data->task_name;
        $frequency = $data->frequency;
        $period_count = $data->period_count;
        $date = $data->date;
        $time = $data->time;

        $sql = "UPDATE tasks SET category_name='$category_name', member='$member', task_name='$task_name', frequency='$frequency', period_count='$period_count', date='$date', time='$time' WHERE id='$id'";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Task updated successfully"]);
        } else {
            http_response_code(500);
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
        break;

    case 'DELETE':
        $id = $data->id;

        $sql = "DELETE FROM tasks WHERE id='$id'";

        if ($conn->query($sql) === TRUE) {
            echo json_encode(["message" => "Task deleted successfully"]);
        } else {
            http_response_code(500);
            echo json_encode(["message" => "Error: " . $sql . "<br>" . $conn->error]);
        }
        break;

    case 'GET':
        $sql = "SELECT * FROM tasks";
        $result = $conn->query($sql);

        $tasks = [];
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $row['member'] = explode(',', $row['member']); // Convert comma-separated string to array
                $tasks[] = $row;
            }
        }
        echo json_encode($tasks);
        break;
}

$conn->close();
?>
