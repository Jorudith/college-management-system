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
} else if (isset($_POST["capstone"])) {
    $date = $_POST["date"];
    $time = $_POST["time"];
    $program_id = $_POST["program"];
    $class_id = $_POST["class"];
    $course_id = $_POST["course"];
    
    if ($_POST["capstone"] == "add") {
        $sql = "INSERT INTO `capstone_sched` (`date`, `time`, `program_id`, `class_id`, `course_id`) VALUES ('$date', '$time:00:00', $program_id, $class_id, $course_id);";
        mysqli_query($conn, $sql);
        header("Location: ../home.php?");
        exit();
    } else if ($_POST["capstone"] == "edit") {
        $id = $_POST["id"];
        if ($id == "") {
            header("Location: ../home.php?edit_error=id_required");
            exit();
        } else {
            $sql = "UPDATE `capstone_sched` SET `date` = '$date', `time` = '$time:00:00', `program_id` = $program_id, `class_id` = $class_id, `course_id` = $course_id WHERE `id` = $id;";
            mysqli_query($conn, $sql);
            header("Location: ../home.php?");
            exit();
        }
    } else if ($_POST["capstone"] == "cancel") {
        header("Location: ../home.php");
        exit();
    }
}