<?php

session_start();

include "dbh.php";
include "../funcs/sql_funcs.php";

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
} else if (isset($_POST["course"])) {
    $code = $_POST["code"];
    $name = $_POST["name"];

    if ($_POST["course"] == "add") {
        $sql = "INSERT INTO `course` (`code`, `name`) VALUES ('$code', '$name');";
        mysqli_query($conn, $sql);
        header("Location: ../home.php?");
        exit();
    } else if ($_POST["course"] == "edit") {
        $id = $_POST["id"];
        if ($id == "") {
            header("Location: ../home.php?edit_error=id_required");
            exit();
        } else {
            $sql = "UPDATE `course` SET `code` = '$code', `name` = '$name' WHERE `id` = $id;";
            mysqli_query($conn, $sql);
            header("Location: ../home.php?");
            exit();
        }
    } else if ($_POST["course"] == "cancel") {
        header("Location: ../home.php");
        exit();
    }
} else if (isset($_POST["student"])) {
    $program = $_POST["program"];
    $class = $_POST["class"];
    $firstname = $_POST["firstname"];
    $lastname = $_POST["lastname"];
    $sex = $_POST["sex"];
    $dob = $_POST["dob"];
    $register = $_POST["register_date"];
    $contactnumber = $_POST["contactnumber"];
    $emailaddress = $_POST["emailaddress"];

    if ($_POST["student"] == "add") {
        $student_sql = "INSERT INTO `student` (`f_name`, `l_name`, `phone_no`, `email`, `dob`, `register_date`, `sex`) VALUES ('$firstname', '$lastname', '$contactnumber', '$emailaddress', '$dob', '$register', '$sex');";
        mysqli_query($conn, $student_sql);
        $enroll_sql = "SELECT `id` `enroll_id` FROM `enroll` WHERE `program_id` = $program AND `class_id` = $class;";
        $enroll_results = mysqli_query($conn, $enroll_sql);
        
        $students = getTable($conn, "student", false, true);
        $counter = 1;

        while ($counter <= mysqli_num_rows($students)) {
            $student_id = $students->fetch_assoc()["id"];
            if ($counter == mysqli_num_rows($students)) {
                echo $student_id;
            }
            $counter += 1;
        }

        foreach($enroll_results as $enroll_result) {
            $student_enroll_sql = "INSERT INTO `student_enroll` (`student_id`, `enroll_id`) VALUES ('$student_id', ".$enroll_result["enroll_id"].");";
            mysqli_query($conn, $student_enroll_sql);
        }
        header("Location: ../home.php?");
        exit();
    } else if ($_POST["student"] == "edit") {
        $id = $_POST["id"];
        if ($id == "") {
            header("Location: ../home.php?edit_error=id_required");
            exit();
        } else {
            $student_sql = "UPDATE `student` SET `f_name` = '$firstname', `l_name` = '$lastname', `phone_no` = '$contactnumber', `email` = '$emailaddress', `dob` = '$dob', `register_date` = '$register', `sex` = '$sex' WHERE `id` = '$id';";
            mysqli_query($conn, $student_sql);

            $enroll_sql = "SELECT `id` `enroll_id` FROM `enroll` WHERE `program_id` = $program AND `class_id` = $class;";
            $enroll_results = mysqli_query($conn, $enroll_sql);
            $student_enroll_sql = "SELECT `enroll_id` FROM `student_enroll` WHERE `student_id` = '$id';";
            $student_enroll_results = mysqli_query($conn, $student_enroll_sql);

            $enroll_number = mysqli_num_rows($enroll_results);
            $student_enroll_number = mysqli_num_rows($student_enroll_results);

            if ($enroll_number == $student_enroll_number) {
                foreach($student_enroll_results as $student_enroll_result) {
                    $current_id = $enroll_results->fetch_assoc()["enroll_id"];
                    $sql = "UPDATE `student_enroll` SET `enroll_id` = ".$current_id." WHERE `student_id` = '$id' AND `enroll_id` = ".$student_enroll_result["enroll_id"].";";
                    mysqli_query($conn, $sql);
                }
            } else if ($enroll_number > $student_enroll_number) {
                $student_enroll_counter = $student_enroll_number;
                $enroll_counter = $enroll_number;
                while ($student_enroll_counter != 0) {
                    $current_student_enroll_id = $student_enroll_results->fetch_assoc()["enroll_id"];
                    $current_enroll_id = $enroll_results->fetch_assoc()["enroll_id"];
                    $sql = "UPDATE `student_enroll` SET `enroll_id` = ".$current_enroll_id." WHERE `student_id` = '$id' AND `enroll_id` = ".$current_student_enroll_id.";";
                    mysqli_query($conn, $sql);
                    $student_enroll_counter -= 1;
                    $enroll_counter -= 1;
                }
                while ($enroll_counter != 0) {
                    $sql = "INSERT INTO `student_enroll` (`student_id`, `enroll_id`) VALUES ('$id', ".$enroll_results->fetch_assoc()["enroll_id"].");";
                    mysqli_query($conn, $sql);
                    $enroll_counter -= 1;
                }
            } else if ($enroll_number < $student_enroll_number) {
                $student_enroll_counter = $student_enroll_number;
                $enroll_counter = $enroll_number;
                while ($enroll_counter != 0) {
                    $current_student_enroll_id = $student_enroll_results->fetch_assoc()["enroll_id"];
                    $current_enroll_id = $enroll_results->fetch_assoc()["enroll_id"];
                    $sql = "UPDATE `student_enroll` SET `enroll_id` = ".$current_enroll_id." WHERE `student_id` = '$id' AND `enroll_id` = ".$current_student_enroll_id.";";
                    mysqli_query($conn, $sql);
                    $enroll_counter -= 1;
                    $student_enroll_counter -= 1;
                }
                while ($student_enroll_counter != 0) {
                    $sql = "DELETE FROM `student_enroll` WHERE `student_id` = '$id' AND `enroll_id` = ".$student_enroll_results->fetch_assoc()["enroll_id"].";";
                    mysqli_query($conn, $sql);
                    $student_enroll_counter -= 1;
                }
            }
            header("Location: ../home.php");
            exit();
        }
    } else if ($_POST["student"] == "cancel") {
        header("Location: ../home.php");
        exit();
    } 
}