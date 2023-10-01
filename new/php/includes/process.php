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
        $substr = substr($_SESSION["username"], 0, 2);
        if ($substr === "ad") {
            $_SESSION["type"] = "admin";
        } else if ($substr === "te") {
            $_SESSION["type"] = "teacher";
        } else if ($substr === "st") {
            $_SESSION["type"] = "student";
        }
        header("Location: ../home.php?");
        exit();
    }
}