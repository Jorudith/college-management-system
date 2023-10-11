<?php
    include "includes/dbh.php";
    include "funcs/interpreters.php";
    session_start();
    $_SESSION["option"] = $_POST["option"] ?? $_SESSION["option"] ?? "";
    // unsets selection when moving to different 
    if ($_SESSION["option"] != "attendance") {
        unset($_SESSION["year"]);
        unset($_SESSION["month"]);
        unset($_SESSION["day"]);
        unset($_SESSION["status"]);
        unset($_SESSION["role"]);
    }

    $_SESSION["year"] =  $_POST["year"] ?? $_SESSION["year"] ?? "";
    $_SESSION["month"] = $_POST["month"] ?? $_SESSION["month"] ?? "";
    $_SESSION["day"] = $_POST["day"] ?? $_SESSION["day"] ?? "";
    $_SESSION["status"] = $_POST["status"] ?? $_SESSION["status"] ?? "";
    $_SESSION["role"] = $_POST["role"] ?? $_SESSION["role"] ?? "";

    $year_sql = "SELECT DISTINCT YEAR(`date`) `year` FROM `attendance`;";
    $year_results = mysqli_query($conn, $year_sql);
    $day_sql = "SELECT DISTINCT day(`date`) `day` FROM `attendance` ORDER BY DAY(`date`);";
    $day_results = mysqli_query($conn, $day_sql);
    
    // Patching up previous attendances of people (admin, teacher, student)
    $adminSql = "SELECT * FROM `admin`;";
    $teacherSql = "SELECT * FROM `teacher`;";
    $studentSql = "SELECT * FROM `student`;";

    $adminResults = mysqli_query($conn, $adminSql);
    $teacherResults = mysqli_query($conn, $teacherSql);
    $studentResults = mysqli_query($conn, $studentSql);
    
    // Attendance check for admins
    foreach($adminResults as $adminResult) {
        $checkAttendanceSql = "SELECT `attendance`.`date` `date` FROM `attendance` INNER JOIN `admin` ON `attendance`.`attendee_id` = `admin`.`id` WHERE `attendance`.`attendee_id` = '".$adminResult["id"]."' ORDER BY `attendance`.`date` DESC;";
        $checkAttendanceResults = mysqli_query($conn, $checkAttendanceSql);
        $currAttendanceDate = $checkAttendanceResults->fetch_assoc();
        if ($currAttendanceDate == date("Y-m-d")) {
            
        } else {
            if (mysqli_num_rows($checkAttendanceResults) == 0) {
                $currDate = new DateTime($adminResult["hire_date"]);
                while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                    $currDate->modify("+1 day");
                    $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$adminResult["id"]."', 'admin', null);";
                    $attendanceInsertSql."<br>";
                    mysqli_query($conn, $attendanceInsertSql);
                }
            } else if (isset($currAttendanceDate["date"])) {
                $currDate = new DateTime($currAttendanceDate["date"]);
                while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                    $currDate->modify("+1 day");
                    $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$adminResult["id"]."', 'admin', null);";
                    mysqli_query($conn, $attendanceInsertSql);
                }
                
            }
        }
    }
    // Attendance check for teachers
    foreach($teacherResults as $teacherResult) {
        $checkAttendanceSql = "SELECT * FROM `attendance` INNER JOIN `teacher` ON `attendance`.`attendee_id` = `teacher`.`id` WHERE `attendance`.`attendee_id` = '".$teacherResult["id"]."' ORDER BY `attendance`.`date` DESC;";
        $checkAttendanceResults = mysqli_query($conn, $checkAttendanceSql);
        $currAttendanceDate = $checkAttendanceResults->fetch_assoc();

        if ($currAttendanceDate == date("Y-m-d")) {
            
        } else {
            if (mysqli_num_rows($checkAttendanceResults) == 0) {
                $currDate = new DateTime($teacherResult["hire_date"]);
                while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                    $currDate->modify("+1 day");
                    $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$teacherResult["id"]."', 'teacher', null);";
                    mysqli_query($conn, $attendanceInsertSql);
                }
            } else if (isset($currAttendanceDate["date"])) {
                $currDate = new DateTime($currAttendanceDate["date"]);
                while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                    $currDate->modify("+1 day");
                    $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$teacherResult["id"]."', 'teacher', null);";
                    mysqli_query($conn, $attendanceInsertSql);
                }
            }
        }
    }
    // Attendance check for students
    foreach($studentResults as $studentResult) {
        $checkAttendanceSql = "SELECT * FROM `attendance` INNER JOIN `student` ON `attendance`.`attendee_id` = `student`.`id` WHERE `attendance`.`attendee_id` = '".$studentResult["id"]."' ORDER BY `attendance`.`date` DESC;";
        $checkAttendanceResults = mysqli_query($conn, $checkAttendanceSql);
        $currAttendanceDate = $checkAttendanceResults->fetch_assoc();

        if ($currAttendanceDate == date("Y-m-d")) {
            
        } else {
            if (mysqli_num_rows($checkAttendanceResults) == 0) {
                $currDate = new DateTime($studentResult["admission_date"]);
                while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                    $currDate->modify("+1 day");
                    $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$studentResult["id"]."', 'student', null);";
                    mysqli_query($conn, $attendanceInsertSql);
                }
            } else if (isset($currAttendanceDate["date"])) {
                $currDate = new DateTime($currAttendanceDate["date"]);
                while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                    $currDate->modify("+1 day");
                    $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$studentResult["id"]."', 'student', null);";
                    mysqli_query($conn, $attendanceInsertSql);
                }
            }
        }
    }

    // Display of attendances

?>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" charset="UTF-8" type="text/css" href="../css/style.css">

    <link rel="icon" href="">
    <title>College Management System</title>
</head>
<body>
    <header>
        <div class="header-logo">
            <img src="../img/URS-Logo.jpg" alt="University of Rizal System Logo">
        </div>
        <div style="display: flex; flex-flow: column nowrap; gap: 1rem;">
            <h1 style="font-size: 2rem; font-weight: 800;">Welcome, 
                <?php
                    echo ucwords($_SESSION["type"]). "!";
                ?>
            </h1>
            <div style="display: flex; gap: 0 1em; align-items: center;">
                <form class="navigation-ul" method="post" action="home.php">
                    <button type="submit" name="option" value="home">Home</button>
                    <button type="submit" name="option" value="attendance">Attendance</button>
                    <button type="submit" name="option" value="capstone">Capstone Schedules</button>
                    <button type="submit" name="option" value="course">Courses</button>
                    <button type="submit" name="option" value="student">Students</button>
                    <button type="submit" name="option" value="teacher">Teachers</button>
                    <button type="submit" name="option" value="report">Reports</button>
                </form>
                <h3 style="font-size: 1.4rem; font-weight: 650;"><a href="../index.php">LOGOUT</a></h3>
            </div>
        </div>
    </header>
    <main>
        <section>
            <?php
                if (isset($_SESSION["option"]) && $_SESSION["option"] == "home") {
                    echo '
                    <div class="ms home">
                        <div class="profile-picture" style="width: 13rem;">
                            <img src="../img/profile-default.png" style="border-radius: 50%;">
                        </div>
                        <div class="profile-information" style="display: flex; flex-flow: column nowrap; justify-content: center;">
                            <h1 style="font-size: 3.2rem; font-weight: 750;">Jane Jean D. Doe</h1>
                            <p style="font-size: 2.2rem;">Student Number: 121201211</p>
                            <p style="font-size: 2.2rem;">BSCS Year 3 Section 1</p>
                        </div>
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "attendance") {
                    echo '
                    <div class="ms attendance">
                        <div style="display: flex; flex-flow: row nowrap; gap: 2rem; align-items: center;">
                            <form class="attendance-ul" action="home.php" method="post">
                                <select name="year" required>
                                    <option disabled selected hidden value="">Year</option>
                                    ';
                                        foreach($year_results as $year_result) {
                                            $curr_year = $year_result["year"];
                                            echo "<option ".($_SESSION["year"] == $curr_year ? "selected" : "").">$curr_year</option>";
                                        }
                            echo '
                                </select>
                                <select name="month" required>
                                    <option disabled selected hidden value="">Month</option>
                                    <option '.($_SESSION["month"] == "this" ? "selected" : "").' value="'.date("m").'">This Month</option>
                                    <option '.($_SESSION["month"] == "01" ? "selected" : "").' value="01">January</option>
                                    <option '.($_SESSION["month"] == "02" ? "selected" : "").' value="02">February</option>
                                    <option '.($_SESSION["month"] == "03" ? "selected" : "").' value="03">March</option>
                                    <option '.($_SESSION["month"] == "04" ? "selected" : "").' value="04">April</option>
                                    <option '.($_SESSION["month"] == "05" ? "selected" : "").' value="05">May</option>
                                    <option '.($_SESSION["month"] == "06" ? "selected" : "").' value="06">June</option>
                                    <option '.($_SESSION["month"] == "07" ? "selected" : "").' value="07">July</option>
                                    <option '.($_SESSION["month"] == "08" ? "selected" : "").' value="08">August</option>
                                    <option '.($_SESSION["month"] == "09" ? "selected" : "").' value="09">September</option>
                                    <option '.($_SESSION["month"] == "10" ? "selected" : "").' value="10">October</option>
                                    <option '.($_SESSION["month"] == "11" ? "selected" : "").' value="11">November</option>
                                    <option '.($_SESSION["month"] == "12" ? "selected" : "").' value="12">December</option>
                                </select>
                                <select name="day" required>
                                    <option disabled selected hidden value="">Day</option>
                                    <option '.($_SESSION["day"] == "today" ? "selected" : "").' value="'.date("d").'">This day</option>
                                    ';
                                    foreach($day_results as $day_result) {
                                        $curr_day = $day_result["day"];
                                        echo "<option ".($_SESSION["day"] == $curr_day ? "selected" : "").">$curr_day</option>";
                                    }
                                    echo '
                                </select>
                                <select name="status" required>
                                    <option disabled selected hidden value="">Status</option>
                                    <option '.($_SESSION["status"] == "present" ? "selected" : "").' value="present">Present</option>
                                    <option '.($_SESSION["status"] == "absent" ? "selected" : "").' value="absent">Absent</option>
                                    <option '.($_SESSION["status"] == "NULL" ? "selected" : "").' value="NULL">No Class</option>
                                </select>
                                <select name="role" required>
                                    <option disabled selected hidden value="">Role</option>
                                    '; 
                                    if ($_SESSION["type"] == "admin") {
                                        echo '
                                            <option '.($_SESSION["role"] == "admin" ? "selected" : "").' value="admin">Admin</option>
                                            <option '.($_SESSION["role"] == "teacher" ? "selected" : "").' value="teacher">Teacher</option>
                                            <option '.($_SESSION["role"] == "student" ? "selected" : "").' value="student">Student</option>
                                        ';
                                    } else if ($_SESSION["type"] == "teacher") {
                                        echo '
                                            <option '.($_SESSION["role"] == "teacher" ? "selected" : "").' value="teacher">Teacher</option>
                                            <option '.($_SESSION["role"] == "student" ? "selected" : "").' value="student">Student</option>
                                        ';
                                    } else if ($_SESSION["type"] == "student") {
                                        echo '
                                            <option '.($_SESSION["role"] == "student" ? "selected" : "").' value="student">Student</option>
                                        ';
                                    }
                                    
                                echo '
                                </select>
                                <button type="submit" name="submit" value="submit">SEE ATTENDANCE</button>
                                ';
                                if ((isset($_POST["submit"]) || isset($_POST["new_val"])) && $_SESSION["type"] != "student" && !(($_SESSION["type"] == "teacher") && ($_SESSION["role"] == "teacher"))) {
                                    echo '
                                    <button type="submit" name="submit" value="absentAll">Absent All</button>
                                    <button type="submit" name="submit" value="presentAll">Present All</button>
                                    <button type="submit" name="submit" value="nullAll">No Classes</button>
                                    ';
                                    if (isset($_POST["submit"]) && $_POST["submit"] == "absentAll") {
                                        $absentSql = "UPDATE `attendance` SET `status` = 'absent' WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`role` = '".$_SESSION["role"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                        mysqli_query($conn, $absentSql);
                                    } else if (isset($_POST["submit"]) && $_POST["submit"] == "presentAll") {
                                        $presentSql = "UPDATE `attendance` SET `status` = 'present' WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`role` = '".$_SESSION["role"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                        mysqli_query($conn, $presentSql);
                                    } else if (isset($_POST["submit"]) && $_POST["submit"] == "nullAll") {
                                        $nullSql = "UPDATE `attendance` SET `status` = NULL WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`role` = '".$_SESSION["role"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                        mysqli_query($conn, $nullSql);
                                    }
                                }  
                                echo '
                            </form>
                        </div>
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>DATE</th>
                                        <th>STATUS</th>
                                        <th>NAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    ';
                                    if (isset($_POST["submit"]) || isset($_POST["new_val"])) {
                                        if (isset($_POST["new_val"]) && $_POST["new_val"] == "NULL") {
                                            $updateSql = "UPDATE `attendance` SET `status` = NULL WHERE `id` = ".$_POST["id"]."";
                                            mysqli_query($conn, $updateSql);
                                        } else if (isset($_POST["new_val"]) && $_POST["new_val"] == "absent") {
                                            $updateSql = "UPDATE `attendance` SET `status` = 'absent' WHERE `id` = ".$_POST["id"]."";
                                            mysqli_query($conn, $updateSql);
                                        } else if (isset($_POST["new_val"]) && $_POST["new_val"] == "present") {
                                            $updateSql = "UPDATE `attendance` SET `status` = 'present' WHERE `id` = ".$_POST["id"]."";
                                            mysqli_query($conn, $updateSql);
                                        }

                                        if ($_SESSION["type"] == "admin") {
                                            $displayAttendanceSql = "SELECT `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                            $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                        } else if ($_SESSION["type"] == "teacher") {
                                            if ($_SESSION["role"] == "student") {
                                                $displayAttendanceSql = "SELECT `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                                $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                            } else if ($_SESSION["role"] == "teacher") {
                                                $displayAttendanceSql = "SELECT `attendance`.`attendee_id` `attendee_id`, `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendee_id` = '".$_SESSION["username"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                                $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                            }
                                            
                                        } else if ($_SESSION["type"] == "student") {
                                            $displayAttendanceSql = "SELECT `attendance`.`attendee_id` `attendee_id`, `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendee_id` = '".$_SESSION["username"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                                $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                        }

                                        

                                        if (mysqli_num_rows($displayAttendanceResults) != 0) {
                                            foreach($displayAttendanceResults as $displayAttendanceResult) {
                                                $displayMonth = month_interpreter($displayAttendanceResult["date"], 5, 2);
                                                echo '
                                                <tr>
                                                    <td>'.substr($displayAttendanceResult["date"], 0, 4).' '.$displayMonth.' '.substr($displayAttendanceResult["date"], 8, 2).'</td>
                                                    <td>';

                                                    if ($_SESSION["type"] == "admin") {
                                                        echo'
                                                        <form action="home.php" method="post">
                                                            <input hidden name="id" value="'.$displayAttendanceResult["attendance_id"].'">
                                                            <select name="new_val" onchange="submit()">
                                                                <option selected value="'.$displayAttendanceResult["status"].'">'.(($_SESSION["status"] == "NULL") ? "No Class" : ucwords($displayAttendanceResult["status"])).'</option>
                                                                '; 
                                                                $statuses = array("NULL", "present", "absent");
                                                                unset($statuses[array_search($displayAttendanceResult["status"], $statuses)]);
                                                                foreach($statuses as $option) {
                                                                    echo '
                                                                    <option value="'.$option.'">'.(($option == "NULL") ? "No Class" : ucwords($option)).'</option>
                                                                    ';
                                                                }                                                       
                                                                echo '
                                                            </select>
                                                        </form>
                                                        ';
                                                    } else if ($_SESSION["type"] == "teacher") {
                                                        if ($_SESSION["role"] == "teacher") {
                                                            echo (($_SESSION["status"] == "NULL") ? "No Class" : ucwords($displayAttendanceResult["status"]));
                                                        } else if ($_SESSION["role"] == "student") {
                                                            echo'
                                                            <form action="home.php" method="post">
                                                                <input hidden name="id" value="'.$displayAttendanceResult["attendance_id"].'">
                                                                <select name="new_val" onchange="submit()">
                                                                    <option selected value="'.$displayAttendanceResult["status"].'">'.(($_SESSION["status"] == "NULL") ? "No Class" : ucwords($displayAttendanceResult["status"])).'</option>
                                                                    '; 
                                                                    $statuses = array("NULL", "present", "absent");
                                                                    unset($statuses[array_search($displayAttendanceResult["status"], $statuses)]);
                                                                    foreach($statuses as $option) {
                                                                        echo '
                                                                        <option value="'.$option.'">'.(($option == "NULL") ? "No Class" : ucwords($option)).'</option>
                                                                        ';
                                                                    }                                                       
                                                                    echo '
                                                                </select>
                                                            </form>
                                                            ';
                                                        } 
                                                    } else if ($_SESSION["type"] == "student") {
                                                        echo (($_SESSION["status"] == "NULL") ? "No Class" : ucwords($displayAttendanceResult["status"]));
                                                    }
                                                    
                                                        echo'
                                                    </td>
                                                    <td>'.$displayAttendanceResult["f_name"] . ' ' . $displayAttendanceResult["l_name"].'</td>
                                                </tr>
                                                ';
                                            }
                                        
                                        } else {
                                            echo '
                                            <tr>
                                                <td colspan="3">No Records!</td>
                                            </tr>
                                            ';
                                        }
                                    }
                                    echo '
                                </tbody>
                            </table>
                        </div>
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "capstone") {
                    $capstoneSchedSql = "SELECT `capstone_sched`.`id` `id`, YEAR(`capstone_sched`.`date`) `year`, MONTH(`capstone_sched`.`date`) `month`, DAY(`capstone_sched`.`date`) `day`, `capstone_sched`.`time` `time`, CONCAT(`class`.`program`, ' ', `class`.`year`, '-', `class`.`section`) `class_class`, `course`.`code` `course_code` FROM `capstone_sched` INNER JOIN `course` ON `capstone_sched`.`course_id` = `course`.`id` INNER JOIN `class` ON `capstone_sched`.`class_id` = `class`.`id`;";
                    $capstoneSchedResults = mysqli_query($conn, $capstoneSchedSql);
                    echo '
                    <div class="ms capstoneschedule">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>DATE & TIME</th>
                                        <th>CLASS</th>
                                        <th>COURSE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                    ';

                                    foreach($capstoneSchedResults as $CSR) {
                                        echo '
                                        <td>'.$CSR["id"].'</td>
                                        <td>'.$CSR["year"]." ".month_interpreter($CSR["month"], 0, 2)." ".$CSR["day"]." | ".to_standard_time($CSR["time"]).'</td>
                                        <td>'.$CSR["class_class"].'</td>
                                        <td>'.$CSR["course_code"].'</td>
                                        ';
                                    }

                                    echo'
                                    <tr>
                                        <td>00001</td>
                                        <td>2080 September 30 20:20AM</td>
                                        <td>BSCS 3-3</td>
                                        <td>COSC 880</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form class="capstoneschedule-form">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="capstoneschedule-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select>
                                        <option value="0">Choose ID:</option>
                                        <option value="1">00001</option>
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="date">DATE</label>
                                    <input type="date">
                                </div>

                                <div class="il">
                                    <label for="class">CLASS</label>
                                    <input id="class" type="text" name="class" placeholder="Enter class..." required>
                                </div>

                                <div class="il">
                                    <label for="course">COURSE</label>
                                    <input id="course" type="text" name="course" placeholder="Enter course..." required>
                                </div>

                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button>ADD</button>
                                    <button>EDIT</button>
                                    <button>CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "course") {
                    echo '
                    <div class="ms course">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>COURSE CODE</th>
                                        <th>COURSE NAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>00001</td>
                                        <td>GNED 01</td>
                                        <td>Art Appreciation</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form class="course-form">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="course-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select>
                                        <option value="0">Choose ID:</option>
                                        <option value="1">00001</option>
                                    </select>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%"  for="date">COURSE CODE</label>
                                    <input id="class" type="text" name="class" placeholder="Enter course code..." required>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%" for="class">COURSE NAME</label>
                                    <input id="class" type="text" name="class" placeholder="Enter course name..." required>
                                </div>
        
                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button>ADD</button>
                                    <button>EDIT</button>
                                    <button>CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "student") {
                    echo '
                    <div class="ms student">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>PROGRAM</th>
                                        <th>CLASS</th>
                                        <th>FULL NAME</th>
                                        <th>AGE</th>
                                        <th>SEX</th>
                                        <th>BIRTH DATE</th>
                                        <th>CONTACT NUMBER</th>
                                        <td>EMAIL ADDRESS</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>00001</td>
                                        <td>BSCS</td>
                                        <td>YEAR 2 - CLASS 1</td>
                                        <td>Jane Doe</td>
                                        <td>21</td>
                                        <td>FEMALE</td>
                                        <td>2002-09-29</td>
                                        <td>09091231234</td>
                                        <td>jane.doe@urs.edu.ph</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <form class="student-form">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="student-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select>
                                        <option value="0">Choose ID:</option>
                                        <option value="1">00001</option>
                                    </select>
                                </div>
        
                                <div class="il">
                                    <label for="program">PROGRAM</label>
                                    <select>
                                        <option value="0">Choose program:</option>
                                        <option value="BSCS">Bachelor of Science in Computer Science (BSCS)</option>
                                    </select>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%" for="fullname">FULL NAME</label>
                                    <input id="fullname" type="text" name="fullname" placeholder="Enter full name..." required>
                                </div>
                                
                                <div class="il">
                                    <label for="age">AGE</label>
                                    <select>
                                        <option value="0">Select age:</option>
                                        <option value="16">16</option>
                                        <option value="17">17</option>
                                        <option value="18">18</option>
                                        <option value="19">19</option>
                                        <option value="20">20</option>
                                        <option value="21">21</option>
                                        <option value="22">22</option>
                                        <option value="23">23</option>
                                        <option value="24">24</option>

                                    </select>
                                </div>

                                <div class="il">
                                    <label for="sex">SEX</label>
                                    <select>
                                        <option value="0">Select sex:</option>
                                        <option value="MALE">MALE</option>
                                        <option value="FEMALE">FEMALE</option>
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="birthdate">BIRTH DATE</label>
                                    <input type="date">
                                </div>

                                <div class="il">
                                    <label style="width: 10%" for="contactnumber">CONTACT NUMBER</label>
                                    <input id="contactnumber" type="text" name="contactnumber" placeholder="+639" required>
                                </div>

                                <div class="il">
                                    <label style="width: 10%" for="emailaddress">EMAIL ADDRESS</label>
                                    <input id="emailaddress" type="text" name="emailaddress" placeholder="@urs.edu.ph" required>
                                </div>
        
                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button>ADD</button>
                                    <button>EDIT</button>
                                    <button>CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "report") {
                    
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "attendance") {
                    
                }
            
// Nasa taas mga commits ko BORDER +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
            ?>
        </section>
    </main>
</body>
</html>
