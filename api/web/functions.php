<?php
require_once "config.php";

function apiRequest($endpoint, $method = "GET", $data = null) {
    global $api_base_url;
    session_start();

    $url = $api_base_url . $endpoint;
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

    $headers = ["Content-Type: application/json"];
    if (!empty($_SESSION["token"])) {
        $headers[] = "Authorization: Bearer " . $_SESSION["token"];
    }

    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    if ($method == "POST") {
        curl_setopt($ch, CURLOPT_POST, true);
        if ($data) {
            curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
        }
    }

    $response = curl_exec($ch);
    curl_close($ch);

    return json_decode($response, true);
}
?>
