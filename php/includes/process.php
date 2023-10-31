<?php

session_start();

include "dbh.php";
include "../funcs/sql_funcs.php";
include "../funcs/password_generator.php";

if (isset($_POST["button"]) && $_POST["button"] == "signin") {
    $username = trim($_POST["username"]);
    $password = trim($_POST["password"]);
    
    $sql = "SELECT * FROM `user` WHERE `username` = '$username';";
    $result = mysqli_query($conn, $sql);
    $user = mysqli_fetch_array($result);

    if ($password != $user["password"]) {
        header("Location: ../../index.php?error=incorrectcredentials");
        exit();
    } else {
        $_SESSION["username"] = $username;
        $_SESSION["picture_name"] = $user["picture_name"];
        $_SESSION["picture_status"] = $user["picture_status"];
        $_SESSION["user_class"] = $user["class_id"];
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
    $code = trim($_POST["code"]);
    $name = trim($_POST["name"]);
    $class = trim($_POST["class"]);
    $program = trim($_POST["program"]);

    if ($_POST["course"] == "add") {
        $sql = "INSERT INTO `course` (`code`, `name`) VALUES ('$code', '$name');";
        mysqli_query($conn, $sql);

        $courses = getTable($conn, "course");
        $counter = 1;

        while ($counter <= mysqli_num_rows($courses)) {
            $current_course_id = $courses->fetch_assoc()["id"];
            $counter += 1;
        }

        $enroll_sql = "INSERT INTO `enroll` (`course_id`, `class_id`, `program_id`) VALUES (".$current_course_id.", ".$class.", ".$program.");";
        mysqli_query($conn, $enroll_sql);

        header("Location: ../home.php?");
        exit();
    } else if ($_POST["course"] == "edit") {
        $enroll_id = $_POST["enroll_id"];
        $course_id = $_POST["course_id"];
        if ($enroll_id == "") {
            header("Location: ../home.php?edit_error=id_required");
            exit();
        } else {
            $sql = "UPDATE `course` SET `code` = '$code', `name` = '$name' WHERE `id` = $course_id;";
            mysqli_query($conn, $sql);

            $enroll_sql = "UPDATE `enroll` SET `class_id` = ".$class.", `program_id` = ".$program." WHERE `id` = ".$enroll_id.";";
            mysqli_query($conn, $enroll_sql);

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
    $firstname = trim($_POST["firstname"]);
    $lastname = trim($_POST["lastname"]);
    $sex = $_POST["sex"];
    $dob = $_POST["dob"];
    $register = $_POST["register_date"];
    $contactnumber = $_POST["contactnumber"];
    $emailaddress = trim($_POST["emailaddress"]);

    if ($_POST["student"] == "add") {
        $student_sql = "INSERT INTO `student` (`f_name`, `l_name`, `phone_no`, `email`, `dob`, `register_date`, `sex`, `program_id`, `class_id`) VALUES ('$firstname', '$lastname', '$contactnumber', '$emailaddress', '$dob', '$register', '$sex', $program, $class);";
        mysqli_query($conn, $student_sql);
        $enroll_sql = "SELECT `id` `enroll_id` FROM `enroll` WHERE `program_id` = $program AND `class_id` = $class;";
        $enroll_results = mysqli_query($conn, $enroll_sql);
        
        $students = getTable($conn, "student", false, true);
        $counter = 1;

        while ($counter <= mysqli_num_rows($students)) {
            $student_id = $students->fetch_assoc()["id"];
            $counter += 1;
        }

        $passwordGenerator = new passwordGenerator(6, 10, ['old_password', 'myUsername']);
        $password = $passwordGenerator->generate();
        
        $user_sql = "INSERT INTO `user` (`username`, `password`) VALUES ('".$student_id."', '$password');";
        mysqli_query($conn, $user_sql);

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
            $student_sql = "UPDATE `student` SET `f_name` = '$firstname', `l_name` = '$lastname', `phone_no` = '$contactnumber', `email` = '$emailaddress', `dob` = '$dob', `register_date` = '$register', `sex` = '$sex', `program_id` = $program, `class_id` = $class WHERE `id` = '$id';";
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
} else if (isset($_POST["teacher"])) {
    $program = $_POST["program"];
    $class = $_POST["class"];
    $firstname = trim($_POST["firstname"]);
    $lastname = trim($_POST["lastname"]);
    $sex = $_POST["sex"];
    $dob = $_POST["dob"];
    $hire = $_POST["hire_date"];
    $contactnumber = $_POST["contactnumber"];
    $emailaddress = trim($_POST["emailaddress"]);

    if ($_POST["teacher"] == "add") {
        $teacher_sql = "INSERT INTO `teacher` (`f_name`, `l_name`, `phone_no`, `email`, `dob`, `hire_date`, `sex`, `program_id`, `class_id`) VALUES ('$firstname', '$lastname', '$contactnumber', '$emailaddress', '$dob', '$hire', '$sex', $program, $class);";
        mysqli_query($conn, $teacher_sql);
        $enroll_sql = "SELECT `id` `enroll_id` FROM `enroll` WHERE `program_id` = $program AND `class_id` = $class;";
        $enroll_results = mysqli_query($conn, $enroll_sql);
        
        $teachers = getTable($conn, "teacher", false, true);
        $counter = 1;

        while ($counter <= mysqli_num_rows($teachers)) {
            $teacher_id = $teachers->fetch_assoc()["id"];
            $counter += 1;
        }

        $passwordGenerator = new passwordGenerator(6, 10, ['old_password', 'myUsername']);
        $password = $passwordGenerator->generate();
        
        $user_sql = "INSERT INTO `user` (`username`, `password`) VALUES ('".$teacher_id."', '$password');";
        mysqli_query($conn, $user_sql);

        foreach($enroll_results as $enroll_result) {
            $teacher_enroll_sql = "INSERT INTO `teacher_teaches` (`teacher_id`, `enroll_id`) VALUES ('$teacher_id', ".$enroll_result["enroll_id"].");";
            mysqli_query($conn, $teacher_enroll_sql);
        }
        header("Location: ../home.php");
        exit();
        
    } else if ($_POST["teacher"] == "edit") {
        $id = $_POST["id"];
        if ($id == "") {
            header("Location: ../home.php?edit_error=id_required");
            exit();
        } else {
            $teacher_sql = "UPDATE `teacher` SET `f_name` = '$firstname', `l_name` = '$lastname', `phone_no` = '$contactnumber', `email` = '$emailaddress', `dob` = '$dob', `hire_date` = '$hire', `sex` = '$sex', `program_id` = $program, `class_id` = $class WHERE `id` = '$id';";
            mysqli_query($conn, $teacher_sql);

            $enroll_sql = "SELECT `id` `enroll_id` FROM `enroll` WHERE `program_id` = $program AND `class_id` = $class;";
            $enroll_results = mysqli_query($conn, $enroll_sql);
            $teacher_teaches_sql = "SELECT `enroll_id` FROM `teacher_teaches` WHERE `teacher_id` = '$id';";
            $teacher_teaches_results = mysqli_query($conn, $teacher_teaches_sql);

            $enroll_number = mysqli_num_rows($enroll_results);
            $teacher_teaches_number = mysqli_num_rows($teacher_teaches_results);

            if ($enroll_number == $teacher_teaches_number) {
                foreach($teacher_teaches_results as $teacher_teaches_result) {
                    $current_id = $enroll_results->fetch_assoc()["enroll_id"];
                    $sql = "UPDATE `teacher_teaches` SET `enroll_id` = ".$current_id." WHERE `teacher_id` = '$id' AND `enroll_id` = ".$teacher_teaches_result["enroll_id"].";";
                    mysqli_query($conn, $sql);
                }
            } else if ($enroll_number > $teacher_teaches_number) {
                $teacher_teaches_counter = $teacher_teaches_number;
                $enroll_counter = $enroll_number;
                while ($teacher_teaches_counter != 0) {
                    $current_teacher_teaches_id = $teacher_teaches_results->fetch_assoc()["enroll_id"];
                    $current_enroll_id = $enroll_results->fetch_assoc()["enroll_id"];
                    $sql = "UPDATE `teacher_teaches` SET `enroll_id` = ".$current_enroll_id." WHERE `teacher_id` = '$id' AND `enroll_id` = ".$current_teacher_teaches_id.";";
                    mysqli_query($conn, $sql);
                    $teacher_teaches_counter -= 1;
                    $enroll_counter -= 1;
                }
                while ($enroll_counter != 0) {
                    $sql = "INSERT INTO `teacher_teaches` (`teacher_id`, `enroll_id`) VALUES ('$id', ".$enroll_results->fetch_assoc()["enroll_id"].");";
                    mysqli_query($conn, $sql);
                    $enroll_counter -= 1;
                }
            } else if ($enroll_number < $teacher_teaches_number) {
                $teacher_teaches_counter = $teacher_teaches_number;
                $enroll_counter = $enroll_number;
                while ($enroll_counter != 0) {
                    $current_teacher_teaches_id = $teacher_teaches_results->fetch_assoc()["enroll_id"];
                    $current_enroll_id = $enroll_results->fetch_assoc()["enroll_id"];
                    $sql = "UPDATE `teacher_teaches` SET `enroll_id` = ".$current_enroll_id." WHERE `teacher_id` = '$id' AND `enroll_id` = ".$current_teacher_teaches_id.";";
                    mysqli_query($conn, $sql);
                    $enroll_counter -= 1;
                    $teacher_teaches_counter -= 1;
                }
                while ($teacher_teaches_counter != 0) {
                    $sql = "DELETE FROM `teacher_teaches` WHERE `teacher_id` = '$id' AND `enroll_id` = ".$teacher_teaches_results->fetch_assoc()["enroll_id"].";";
                    mysqli_query($conn, $sql);
                    $teacher_teaches_counter -= 1;
                }
            }
            header("Location: ../home.php");
            exit();
        }
    } else if ($_POST["teacher"] == "cancel") {
        header("Location: ../home.php");
        exit();
    } 
} else if (isset($_FILES["file"])) {
    date_default_timezone_set("Asia/Manila");

    $id = $_POST["id"];
    $distinction = $_POST["distinction"];

    $file = $_FILES["file"];
    $file_name = $_FILES["file"]["name"];
    $file_tmp_name = $_FILES["file"]["tmp_name"];
    $file_size = $_FILES["file"]["size"];
    $file_error = $_FILES["file"]["error"];
    $file_type = $_FILES["file"]["type"];

    $file_ext = explode(".", $file_name);
    $file_actual_ext = strtolower(end($file_ext));
    $file_actual_name = $file_ext[0];

    $allowed = array("pdf");

    if (in_array($file_actual_ext, $allowed)) {
        if ($file_error === 0) {
            if ($file_size < 900000000) {
                $file_name_new = date("Y_m_d-H_i_s")." ".$distinction.".".$file_actual_ext;
                $file_destination = "../../capstone_uploads/".$file_name_new;
                move_uploaded_file($file_tmp_name, $file_destination);

                $sql = "UPDATE `capstone_sched` SET `file_name` = '$file_name_new', `file_status` = 1 WHERE `id` = $id;";
                mysqli_query($conn, $sql);
                
                if (isset($_POST["to_be_deleted"])) {
                    unlink($_POST["to_be_deleted"]);
                }
                
                header("Location: ../home.php?");
                exit();
            } else {
                header("Location: ../home.php?file_error=big");
                exit();
            }
        } else {
            header("Location: ../home.php?file_error=error");
            exit();
        }
    } else {
        header("Location: ../home.php?file_error=pdf");
        exit();
    }
} else if (isset($_FILES["image"])) {
    date_default_timezone_set("Asia/Manila");

    $id = $_POST["id"];

    $file = $_FILES["image"];
    $file_name = $_FILES["image"]["name"];
    $file_tmp_name = $_FILES["image"]["tmp_name"];
    $file_size = $_FILES["image"]["size"];
    $file_error = $_FILES["image"]["error"];
    $file_type = $_FILES["image"]["type"];

    $file_ext = explode(".", $file_name);
    $file_actual_ext = strtolower(end($file_ext));
    $file_actual_name = $file_ext[0];

    $allowed = array("png", "jpg", "jpeg");

    if (in_array($file_actual_ext, $allowed)) {
        if ($file_error === 0) {
            if ($file_size < 900000000) {
                $file_name_new = date("Y_m_d-H_i_s")." ".$id.".".$file_actual_ext;
                $file_destination = "../../profile_picture_uploads/".$file_name_new;
                move_uploaded_file($file_tmp_name, $file_destination);

                $sql = "UPDATE `user` SET `picture_name` = '$file_name_new', `picture_status` = 1 WHERE `username` = '$id';";
                mysqli_query($conn, $sql);
                
                if (isset($_POST["to_be_deleted"])) {
                    unlink($_POST["to_be_deleted"]);
                }

                $_SESSION["picture_status"] = 1;
                $_SESSION["picture_name"] = $file_name_new;
                
                header("Location: ../home.php?");
                exit();
            } else {
                header("Location: ../home.php?file_error=big");
                exit();
            }
        } else {
            header("Location: ../home.php?file_error=error");
            exit();
        }
    } else {
        header("Location: ../home.php?file_error=file");
        exit();
    }
}