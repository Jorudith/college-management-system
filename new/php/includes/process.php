<?php

session_start();

include "dbh.php";

if (isset($_POST["button"]) && $_POST["button"] == "signin") {
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);
    
    $sql = "SELECT * FROM `user` WHERE `username` = '$username';";
    $result = mysqli_query($conn, $sql);
    $user = mysqli_fetch_array($result);

    if ($password != $user["password"]) {
        header("Location: ../../index.php?error=".$user['password']);
        exit();
    } else {
        $_SESSION["username"] = $username;
        header("Location: ../home.php?");
        exit();
    }
}