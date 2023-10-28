<?php
    include "includes/dbh.php";
    include "funcs/interpreters.php";
    include "funcs/sql_funcs.php";  
    include "funcs/to_gwa.php";
    

    session_start();
    $_SESSION["option"] = $_POST["option"] ?? $_SESSION["option"] ?? "home";
    // FOR attendance page:
        // unsets selection when moving to different 
        if ($_SESSION["option"] != "attendance") {
            unset($_SESSION["year"]);
            unset($_SESSION["month"]);
            unset($_SESSION["day"]);
            unset($_SESSION["status"]);
            unset($_SESSION["role"]);
        } else if ($_SESSION["option"] != "report") {
            unset($_SESSION["reports"]);
        }
            $_SESSION["year"] =  $_POST["year"] ?? $_SESSION["year"] ?? "";
            $_SESSION["month"] = $_POST["month"] ?? $_SESSION["month"] ?? "";
            $_SESSION["day"] = $_POST["day"] ?? $_SESSION["day"] ?? "";
            $_SESSION["status"] = $_POST["status"] ?? $_SESSION["status"] ?? "";
            $_SESSION["role"] = $_POST["role"] ?? $_SESSION["role"] ?? "";
            $_SESSION["reports"] = $_POST["reports"] ?? $_SESSION["reports"] ?? "";

        $year_sql = "SELECT DISTINCT YEAR(`date`) `year` FROM `attendance`;";
        $year_results = mysqli_query($conn, $year_sql);
        $day_sql = "SELECT DISTINCT day(`date`) `day` FROM `attendance` ORDER BY DAY(`date`);";
        $day_results = mysqli_query($conn, $day_sql);
        
        // Patching up previous attendances of people (admin, teacher, student)
        $admins = getTable($conn, "admin");
        $teachers = getTable($conn, "teacher");
        $students = getTable($conn, "student", false, true);
        
        // Attendance check for admins
        date_default_timezone_set("Asia/Manila");
        $date = "".date("Y")."-08-7";
        $date = date("Y-m-d", strtotime($date));
        foreach($admins as $admin) {
            
            $checkAttendanceSql = "SELECT `attendance`.`date` `date` FROM `attendance` INNER JOIN `admin` ON `attendance`.`attendee_id` = `admin`.`id` WHERE `attendance`.`attendee_id` = '".$admin["id"]."' ORDER BY `attendance`.`date` DESC;";
            $checkAttendanceResults = mysqli_query($conn, $checkAttendanceSql);
            $currAttendanceDate = $checkAttendanceResults->fetch_assoc();
            if ($currAttendanceDate == date("Y-m-d")) {
                
            } else {
                if (mysqli_num_rows($checkAttendanceResults) == 0) {
                    $currDate = new DateTime($date);
                    while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                        $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$admin["id"]."', 'admin', null);";
                        $attendanceInsertSql."<br>";
                        mysqli_query($conn, $attendanceInsertSql);
                        $currDate->modify("+1 day");
                    }
                    
                } else if (isset($currAttendanceDate["date"])) {
                    $currDate = new DateTime($currAttendanceDate["date"]);
                    while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                        $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$admin["id"]."', 'admin', null);";
                        mysqli_query($conn, $attendanceInsertSql);
                        $currDate->modify("+1 day");
                    }
                }
            }
        }
        // Attendance check for teachers
        foreach($teachers as $teacher) {
            $checkAttendanceSql = "SELECT * FROM `attendance` INNER JOIN `teacher` ON `attendance`.`attendee_id` = `teacher`.`id` WHERE `attendance`.`attendee_id` = '".$teacher["id"]."' ORDER BY `attendance`.`date` DESC;";
            $checkAttendanceResults = mysqli_query($conn, $checkAttendanceSql);
            $currAttendanceDate = $checkAttendanceResults->fetch_assoc();

            if ($currAttendanceDate == date("Y-m-d")) {
                
            } else {
                if (mysqli_num_rows($checkAttendanceResults) == 0) {
                    $currDate = new DateTime($date);
                    while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                        $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$teacher["id"]."', 'teacher', null);";
                        mysqli_query($conn, $attendanceInsertSql);
                        $currDate->modify("+1 day");
                    }
                } else if (isset($currAttendanceDate["date"])) {
                    $currDate = new DateTime($currAttendanceDate["date"]);
                    while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                        $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$teacher["id"]."', 'teacher', null);";
                        mysqli_query($conn, $attendanceInsertSql);
                        $currDate->modify("+1 day");
                    }
                }
            }
        }
        // Attendance check for students
        foreach($students as $student) {
            $checkAttendanceSql = "SELECT * FROM `attendance` INNER JOIN `student` ON `attendance`.`attendee_id` = `student`.`id` WHERE `attendance`.`attendee_id` = '".$student["id"]."' ORDER BY `attendance`.`date` DESC;";
            $checkAttendanceResults = mysqli_query($conn, $checkAttendanceSql);
            $currAttendanceDate = $checkAttendanceResults->fetch_assoc();

            if ($currAttendanceDate == date("Y-m-d")) {
                
            } else {
                if (mysqli_num_rows($checkAttendanceResults) == 0) {
                    $currDate = new DateTime($date);
                    while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                        $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$student["id"]."', 'student', null);";
                        mysqli_query($conn, $attendanceInsertSql);
                        $currDate->modify("+1 day");
                    }
                } else if (isset($currAttendanceDate["date"])) {
                    $currDate = new DateTime($currAttendanceDate["date"]);
                    while ($currDate->format("Y-m-d-D") != date("Y-m-d-D")) {
                        $attendanceInsertSql = "INSERT INTO `attendance` (`date`, `attendee_id`, `role`, `status`) VALUES ('".$currDate->format("Y-m-d")."', '".$student["id"]."', 'student', null);";
                        mysqli_query($conn, $attendanceInsertSql);
                        $currDate->modify("+1 day");
                    }
                }
            }
        }
    // FOR home page:
        $student_home_report_sql = "SELECT `student_enroll`.`grade` `grade`, `course`.`code` `course_code`, `course`.`name` `course_name` FROM `student_enroll` INNER JOIN `enroll` ON `enroll`.`id` = `student_enroll`.`enroll_id` INNER JOIN `course` ON `course`.`id` = `enroll`.`course_id` WHERE `student_id` = '".$_SESSION["username"]."';";
        $student_home_report = mysqli_query($conn, $student_home_report_sql);
    // FOR capstonesched page:
        date_default_timezone_set("Asia/Manila");
        $date_plus_one = new DateTime(date("Y-m-d"));
        $date_plus_one->modify("+1 day");

        $capstones = getTable($conn, "capstone_sched");
        $programs = getTable($conn, "program");
        $classes = getTable($conn, "class");
        $capstone_courses = getTable($conn, "course");
    // FOR course page:
        $courses = getTable($conn, "course", true);
    // FOR student page:
        $student_enrolls = getTable($conn, "student");
    // FOR reports page:
        // For Course Reports
        $course_report_sql = "SELECT `course`.`code` `course_code`, `course`.`name` `course_name`, `teacher`.`f_name` `teacher_fname`, `teacher`.`l_name` `teacher_lname`, `class`.`year` `class_year`, `class`.`section` `class_section`, `program`.`abbr` `program_abbr` FROM `teacher` INNER JOIN `teacher_teaches` ON `teacher`.`id` = `teacher_teaches`.`teacher_id` INNER JOIN `enroll` ON `enroll`.`id` = `teacher_teaches`.`enroll_id` INNER JOIN `course` ON `course`.`id` = `enroll`.`course_id` INNER JOIN `class` ON `class`.`id` = `enroll`.`class_id` INNER JOIN `program` ON `program`.`id` = `enroll`.`program_id` ORDER BY `course_code`;";
        $course_report_results = mysqli_query($conn, $course_report_sql);
        $course_report_grouped_sql = "SELECT `course`.`code` `course_code`, `course`.`name` `course_name`, `teacher`.`f_name` `teacher_fname`, `teacher`.`l_name` `teacher_lname`, `class`.`year` `class_year`, `class`.`section` `class_section`, `program`.`abbr` `program_abbr` FROM `teacher` INNER JOIN `teacher_teaches` ON `teacher`.`id` = `teacher_teaches`.`teacher_id` INNER JOIN `enroll` ON `enroll`.`id` = `teacher_teaches`.`enroll_id` INNER JOIN `course` ON `course`.`id` = `enroll`.`course_id` INNER JOIN `class` ON `class`.`id` = `enroll`.`class_id` INNER JOIN `program` ON `program`.`id` = `enroll`.`program_id` GROUP BY `course_code` ORDER BY `course_code`;";
        $course_report_grouped_results = mysqli_query($conn, $course_report_grouped_sql);

        // For Student Reports
        $student_report_sql = "SELECT DISTINCT `student`.`f_name` `student_fname`, `student`.`l_name` `student_lname`, `program`.`abbr` `program_abbr`, `class`.`year` `class_year`, `class`.`section` `class_section`, `student`.`class_id` `student_class` FROM `student` INNER JOIN `student_enroll` ON `student_enroll`.`student_id` = `student`.`id` INNER JOIN `enroll` ON `enroll`.`id` = `student_enroll`.`enroll_id` INNER JOIN `program` ON `program`.`id` = `enroll`.`program_id` INNER JOIN `class` ON `class`.`id` = `enroll`.`class_id` ORDER BY `student_class`;";
        $student_report_results = mysqli_query($conn, $student_report_sql);

        $student_total_report_sql = "SELECT COUNT(`class_id`) `count` FROM `student` GROUP BY `class_id` ORDER BY `class_id`;";
        $student_total_report_results = mysqli_query($conn, $student_total_report_sql);
        
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
                    <?php
                    if ($_SESSION["type"] != "student") {
                        echo '
                        <button type="submit" name="option" value="student">Students</button>
                        ';
                        if ($_SESSION["type"] != "teacher") {
                            echo'
                            <button type="submit" name="option" value="teacher">Teachers</button>
                            ';
                        }
                        echo '<button type="submit" name="option" value="report">Reports</button>
                        ';
                        
                    }
                    ?>
                </form>
                <h3 style="font-size: 1.4rem; font-weight: 650;"><a href="../index.php">LOGOUT</a></h3>
            </div>
        </div>
    </header>
    <main>
        <section>
            <?php
                if (isset($_SESSION["option"]) && $_SESSION["option"] == "home") {
                    $record = getRecord($conn, $_SESSION["type"], $_SESSION["username"]);
                    if ($_SESSION["type"] != "student") {
                        
                        echo '
                        <div class="ms home">
                            <div class="profile-picture">
                                <img src="../profile_picture_uploads/'.(($_SESSION["picture_status"] == 0) ? 'profile-default.png' : $_SESSION["picture_name"]).'">
                            </div>
                            <div class="profile-information" style="display: flex; flex-flow: column nowrap; justify-content: center;">
                                <h1 style="font-size: 3.2rem; font-weight: 750;">'.$record["f_name"].' '.$record["l_name"].'</h1>
                                <p style="font-size: 2.2rem;">'.ucwords($_SESSION["type"]).'</p>
                                <form id="id-form" action="includes/process.php" method="post" enctype="multipart/form-data">
                                    <input id="file" class="inputfile" type="file" name="image" oninput="id-form.submit()" accept=".png, .jpg, .jpeg">
                                    <label for="file">Upload a profile picture...</label>
                                    <input name="id" value="'.$_SESSION["username"].'" hidden>
                                    <input name="to_be_deleted" value="../../profile_picture_uploads/'.$_SESSION["picture_name"].'" hidden>
                                </form>
                            </div>
                        </div>
                        ';
                    } else {
                        echo'
                        <div class="ms home studenthome">
                            <div class="profile-picture">
                                <img src="../profile_picture_uploads/'.(($_SESSION["picture_status"] == 0) ? 'profile-default.png' : $_SESSION["picture_name"]).'">
                            </div>
                            <div class="profile-information" style="display: flex; flex-flow: column nowrap; justify-content: center;">
                                <h1 style="font-size: 3.2rem; font-weight: 750;">'.$record["f_name"].' '.$record["l_name"].'</h1>
                                <p style="font-size: 2.2rem;">ID Number: '.$record["id"].'</p>
                                <form id="id-form" action="includes/process.php" method="post" enctype="multipart/form-data">
                                    <input id="file" class="inputfile" type="file" name="image" oninput="id-form.submit()" accept=".png, .jpg, .jpeg">
                                    <label for="file">Upload a profile picture...</label>
                                    <input name="id" value="'.$_SESSION["username"].'" hidden>
                                    <input name="to_be_deleted" value="../../profile_picture_uploads/'.$_SESSION["picture_name"].'" hidden>
                                </form>
                            </div>
                        </div>
                        <div class="ms home studenthome">
                            <div style="width: 70%; overflow: auto;">
                                <table style="white-space: nowrap; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Courses ('.mysqli_num_rows($student_home_report).')</th>
                                            <th>GWA</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ';
                                        if (mysqli_num_rows($student_home_report) != 0) {
                                            foreach($student_home_report as $shr) {
                                                echo '
                                                    <tr>
                                                        <td>'.$shr["course_code"].' - '.$shr["course_name"].'</td>
                                                        <td>'.gwa_convert($shr["grade"]).'</td>
                                                    </tr>
                                                ';
                                            }
                                        } else {
                                            echo '
                                                <tr>
                                                    <td>No Subjects!</td>
                                                </tr>
                                            ';
                                        }
                                        echo'
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        ';
                    }
                    if (isset($_GET["file_error"]) && $_GET["file_error"] == 'big') {
                        ?>
                        <script>
                            alert("Your file is too big!")
                            window.location.href = "home.php?";
                        </script>
                        <?php
                    } else if (isset($_GET["file_error"]) && $_GET["file_error"] == 'error') {
                        ?>
                        <script>
                            if (!alert("There was an error uploading the file!")) {
                                window.location.href = "home.php?";
                            }
                        </script>
                        <?php
                    }  else if (isset($_GET["file_error"]) && $_GET["file_error"] == 'file') {
                        ?>
                        <script>
                            alert("Please select a .png, .jpg, or .jpeg file!")
                            window.location.href = "home.php?";
                        </script>
                        <?php
                    }
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
                                    if ($_SESSION["role"] == "student" && $_SESSION["status"] == "present") {
                                        echo '
                                        <button type="submit" name="submit" value="randomize">Randomize</button>
                                        ';
                                    }
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
                                            if ($_SESSION["role"] == "student") {
                                                $displayAttendanceSql = "SELECT `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                                $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                                if (isset($_POST["submit"]) && $_POST["submit"] == "randomize") {
                                                    $displayAttendanceSql = "SELECT `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'"))." ORDER BY RAND();";
                                                    $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                                }
                                            }
                                        } else if ($_SESSION["type"] == "teacher") {
                                            if ($_SESSION["role"] == "student") {
                                                $displayAttendanceSql = "SELECT `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'")).";";
                                                $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                                if (isset($_POST["submit"]) && $_POST["submit"] == "randomize") {
                                                    $displayAttendanceSql = "SELECT `attendance`.`id` `attendance_id`, `attendance`.`date` `date`, `".$_SESSION["role"]."`.`f_name` `f_name`, `".$_SESSION["role"]."`.`l_name`, `l_name`, `attendance`.`status` `status` FROM `attendance` INNER JOIN `".$_SESSION["role"]."` ON `attendance`.`attendee_id` = `".$_SESSION["role"]."`.`id` WHERE YEAR(`attendance`.`date`) = '".$_SESSION["year"]."' AND MONTH(`attendance`.`date`) = '".$_SESSION["month"]."' AND DAY(`attendance`.`date`) = '".$_SESSION["day"]."' AND `attendance`.`status` ".(($_SESSION["status"] == "NULL") ? ("IS ".$_SESSION["status"]) : ("= '".$_SESSION["status"]."'"))." ORDER BY RAND();";
                                                    $displayAttendanceResults = mysqli_query($conn, $displayAttendanceSql);
                                                }
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
                    $capstoneSchedSql = "SELECT `capstone_sched`.`id` `id`, YEAR(`capstone_sched`.`date`) `year`, MONTH(`capstone_sched`.`date`) `month`, DAY(`capstone_sched`.`date`) `day`, `capstone_sched`.`time` `time`, `capstone_sched`.`file_status` `file_status`, `capstone_sched`.`file_name`, `program`.`abbr` `program_abbr`, `course`.`code` `course_code`, `class`.`year` `class_year`, `class`.`section` `class_section` FROM `capstone_sched` INNER JOIN `course` ON `capstone_sched`.`course_id` = `course`.`id` INNER JOIN `class` ON `capstone_sched`.`class_id` = `class`.`id` INNER JOIN `program` ON `program`.`id` = `program_id`;";
                    $capstoneSchedResults = mysqli_query($conn, $capstoneSchedSql);
                    echo '
                    <div class="ms capstoneschedule">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>DATE & TIME</th>
                                        <th>PROGRAM</th>
                                        <th>CLASS</th>
                                        <th>COURSE</th>
                                        <th>FILE</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    ';

                                    foreach($capstoneSchedResults as $CSR) {
                                        echo '
                                        <tr>
                                            <td>'.$CSR["id"].'</td>
                                            <td>'.$CSR["year"]." ".month_interpreter($CSR["month"], 0, 2)." ".$CSR["day"]." ".to_standard_time($CSR["time"]).'</td>
                                            <td>'.$CSR["program_abbr"].'</td>
                                            <td>YEAR '.$CSR["class_year"].' - CLASS '.$CSR["class_section"].'</td>
                                            <td>'.$CSR["course_code"].'</td>
                                            <td>
                                            ';
                                            if ($CSR["file_status"] == 0) {
                                                echo '
                                                    <form id="id-form" action="includes/process.php" method="post" enctype="multipart/form-data">
                                                        <input id="file" class="inputfile" type="file" name="file" oninput="id-form.submit()" accept=".pdf">
                                                        <label for="file">Choose a .pdf file...</label> 
                                                        <input name="id" value="'.$CSR["id"].'" hidden>
                                                        <input name="distinction" value="'.$CSR["program_abbr"].$CSR["class_year"]."-".$CSR["class_section"]." - ".$CSR["course_code"].'" hidden>
                                                    </form>
                                                    <div class="err">
                                                    ';
                                                    
                                            } else {
                                                echo '
                                                <a class="a-viewimage" href="../capstone_uploads/'.$CSR["file_name"].'" target="_blank">View File</a>
                                                <form id="id-form" action="includes/process.php" method="post" enctype="multipart/form-data">
                                                    <input id="file" class="inputfile" type="file" name="file" oninput="id-form.submit()" accept=".pdf">
                                                    <label for="file">Replace .pdf file...</label> 
                                                    <input name="id" value="'.$CSR["id"].'" hidden>
                                                    <input name="distinction" value="'.$CSR["program_abbr"].$CSR["class_year"]."-".$CSR["class_section"]." - ".$CSR["course_code"].'" hidden>
                                                    <input name="to_be_deleted" value="'.'../../capstone_uploads/'.$CSR["file_name"].'" hidden>
                                                </form>
                                                <div class="err">
                                                ';
                                            }
                                            echo'
                                            </td>
                                        </tr>';
                                    }
                                    if (isset($_GET["file_error"]) && $_GET["file_error"] == 'big') {
                                        ?>
                                        <script>
                                            alert("Your file is too big!")
                                            window.location.href = "home.php?";
                                        </script>
                                        <?php
                                    } else if (isset($_GET["file_error"]) && $_GET["file_error"] == 'error') {
                                        ?>
                                        <script>
                                            if (!alert("There was an error uploading the file!")) {
                                                window.location.href = "home.php?";
                                            }
                                        </script>
                                        <?php
                                    }  else if (isset($_GET["file_error"]) && $_GET["file_error"] == 'pdf') {
                                        ?>
                                        <script>
                                            alert("Please select a .pdf file!")
                                            window.location.href = "home.php?";
                                        </script>
                                        <?php
                                    }
                                    echo'
                                </tbody>
                            </table>
                        </div>
                        ';
                        if ($_SESSION["type"] != "student") {
                            echo'
                        <form class="capstoneschedule-form" method="post" action="includes/process.php">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="capstoneschedule-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select name="id">
                                        <option disabled selected hidden value="">Choose ID:</option>
                                        ';
                                    foreach($capstones as $capstone) {
                                        echo '
                                        <option value="'.$capstone["id"].'">
                                        '.$capstone["id"].'
                                        </option>
                                        ';
                                    }
                                    echo'
                                    </select>
                                </div>
                                <div class="err">
                                ';
                                if (isset($_GET["edit_error"]) && $_GET["edit_error"] == 'id_required') {
                                    echo '
                                    <p>EDIT: Please choose an ID</p>
                                    ';
                                }
                                echo'
                                </div>
                                <div class="il">
                                    <label for="date">DATE</label>
                                    <input name="date" type="date" min="'.$date_plus_one->format("Y-m-d").'" required>
                                </div>

                                <div class="il">
                                    <label for="time">TIME</label>
                                    <select name="time" required>
                                        <option disabled selected hidden value="">Choose Time:</option>
                                    ';
                                    $startTime = 7; 
                                    $endTime = 18; 

                                    for ($i = $startTime; $i <= $endTime; $i++) {
                                        $displayHour = ($i % 12 === 0) ? 12 : ($i % 12);
                                        $timeDisplay = $displayHour . ":00 " . (($i >= 12 && $i !== 24) ? "PM" : "AM");
                                        echo '<option value="'.$i.'">'.$timeDisplay.'</option>';
                                    }

                                    echo '
                                    </select>
                                </div>
                                <div class="il">
                                    <label for="program">PROGRAM</label>
                                    <select name="program" required>
                                        <option disabled selected hidden value="">Choose Program:</option>
                                    ';        
                                    foreach($programs as $program) {
                                        echo '
                                        <option value="'.$program["id"].'">
                                        '.$program["abbr"].'
                                        </option>
                                        ';
                                    }
                                    echo'
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="class">CLASS</label>
                                    <select name="class" required>
                                        <option disabled selected hidden value="">Choose Class:</option>
                                    ';                                 
                                    foreach($classes as $class) {
                                        echo '
                                        <option value="'.$class["id"].'">
                                        YEAR '.$class["year"].' - CLASS '.$class["section"].'
                                        </option>
                                        ';
                                    }
                                    echo'
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="course">COURSE</label>
                                    <select name="course" required>
                                        <option disabled selected hidden value="">Choose Course:</option>
                                    ';
                                    foreach($capstone_courses as $course) {
                                        echo '
                                        <option value="'.$course["id"].'">
                                        '.$course["code"].'
                                        </option>
                                        ';
                                    }
                                    echo'
                                    </select>
                                </div>

                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button type="submit" name="capstone" value="add">ADD</button>
                                    <button type="submit" name="capstone" value="edit">EDIT</button>
                                    <button type="submit" name="capstone" value="cancel">CANCEL</button>
                                </div>
                            </div>
                        </form>';
                        }
                    echo'
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
                                        <th>PROGRAM</th>
                                        <th>CLASS</th>
                                        <th>COURSE CODE</th>
                                        <th>COURSE NAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                ';
                                foreach($courses as $course) {
                                    echo '
                                    <tr>
                                        <td>'.$course["enroll_id"].'</td>
                                        <td>'.$course["program_abbr"].'</td>
                                        <td>'.$course["class_class"].'</td>
                                        <td>'.$course["course_code"].'</td>
                                        <td>'.$course["course_name"].'</td>
                                    </tr>
                                    ';
                                }
                                echo '
                                </tbody>
                            </table>
                        </div>
                        ';
                        if ($_SESSION["type"] != "student" && $_SESSION["type"] != "teacher") {
                        echo'
                        <form class="course-form" method="post" action="includes/process.php">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="course-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select name="enroll_id">
                                        <option disabled selected hidden value="">Choose ID:</option>
                                        ';
                                        foreach($courses as $course) {
                                            echo '
                                            <option value="'.$course["enroll_id"].'">'.$course["enroll_id"].'</option>
                                            ';
                                        }
                                        echo'
                                    </select>
                                </div>
                                <input name="course_id" value="'.$course["course_id"].'" hidden>
                                <div class="err">
                                ';
                                if (isset($_GET["edit_error"]) && $_GET["edit_error"] == 'id_required') {
                                    echo '
                                    <p>EDIT: Please choose an ID</p>
                                    ';
                                }
                                echo'
                                </div>

                                <div class="il">
                                    <label for="program">PROGRAM</label>
                                    <select name="program" required>
                                        <option disabled selected hidden value="">Choose Program:</option>
                                    ';        
                                    foreach($programs as $program) {
                                        echo '
                                        <option value="'.$program["id"].'">
                                        '.$program["abbr"].'
                                        </option>
                                        ';
                                    }
                                    echo'
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="class">CLASS</label>
                                    <select name="class" required>
                                        <option disabled selected hidden value="">Choose Class:</option>
                                    ';                                 
                                    foreach($classes as $class) {
                                        echo '
                                        <option value="'.$class["id"].'">
                                        YEAR '.$class["year"].' - CLASS '.$class["section"].'
                                        </option>
                                        ';
                                    }
                                    echo'
                                    </select>
                                </div>

                                <div class="il">
                                    <label style="width: 10%" for="code">COURSE CODE</label>
                                    <input id="code" type="text" name="code" placeholder="Enter course code..." required>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%" for="name">COURSE NAME</label>
                                    <input id="name" type="text" name="name" placeholder="Enter course name..." required>
                                </div>
        
                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button type="submit" name="course" value="add">ADD</button>
                                    <button type="submit" name="course" value="edit">EDIT</button>
                                    <button type="submit" name="course" value="cancel">CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                    }
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
                                        <th>SEX</th>
                                        <th>BIRTH DATE</th>
                                        <th>REGISTER DATE</th>
                                        <th>CONTACT NUMBER</th>
                                        <td>EMAIL ADDRESS</td>
                                    </tr>
                                </thead>
                                <tbody>
                                ';
                                foreach($student_enrolls as $student_enroll) {
                                    echo '
                                    <tr>
                                        <td>'.$student_enroll["id"].'</td>
                                        <td>'.$student_enroll["program_abbr"].'</td>
                                        <td>'.$student_enroll["class_class"].'</td>
                                        <td>'.$student_enroll["full_name"].'</td>
                                        <td>'.($student_enroll["student_sex"] == "M" ? "MALE" : "FEMALE").'</td>
                                        <td>'.$student_enroll["student_dob"].'</td>
                                        <td>'.$student_enroll["student_register"].'</td>
                                        <td>'.$student_enroll["student_contact"].'</td>
                                        <td>'.$student_enroll["student_email"].'</td>
                                    </tr>
                                    ';
                                }
                                echo'
                                </tbody>
                            </table>
                        </div>';
                        if ($_SESSION["type"] == "admin") {
                            echo'
                            <form class="student-form" method="post" action="includes/process.php">
                                <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                                <div class="student-input">
                                    <div class="il">
                                        <label for="id">ID</label>
                                        <select name="id">
                                            <option disabled selected hidden value="">Choose ID:</option>
                                            ';
                                            foreach($student_enrolls as $student_enroll) {
                                                echo '
                                                <option value="'.$student_enroll["id"].'">'.$student_enroll["id"].'</option>
                                                ';
                                            }
                                            echo'
                                        </select>
                                    </div>
                                    <div class="err">
                                    ';
                                    if (isset($_GET["edit_error"]) && $_GET["edit_error"] == 'id_required') {
                                        echo '
                                        <p>EDIT: Please choose an ID</p>
                                        ';
                                    }
                                    echo'
                                    </div>
            
                                    <div class="il">
                                        <label for="program">PROGRAM</label>
                                        <select name="program" required>
                                            <option disabled selected hidden value="">Choose program:</option>
                                            ';
                                            foreach($programs as $program) {
                                                echo '
                                                <option value="'.$program["id"].'">'.$program["description"].' ('.$program["abbr"].')</option>
                                                ';
                                            }
                                            echo'
                                        </select>
                                    </div>

                                    <div class="il">
                                        <label for="class">CLASS</label>
                                        <select name="class" required>
                                            <option disabled selected hidden value="">Choose class:</option>
                                            ';
                                            foreach($classes as $class) {
                                                echo '
                                                <option value="'.$class["id"].'">YEAR '.$class["year"].' - CLASS '.$class["section"].'</option>
                                                ';
                                            }
                                            echo'
                                        </select>
                                    </div>
            
                                    <div class="il">
                                        <label style="width: 10%" for="firstname">FIRST NAME</label>
                                        <input id="firstname" type="text" name="firstname" placeholder="Enter first name..." required>
                                    </div>

                                    <div class="il">
                                        <label style="width: 10%" for="lastname">LAST NAME</label>
                                        <input id="lastname" type="text" name="lastname" placeholder="Enter last name..." required>
                                    </div>

                                    <div class="il">
                                        <label for="sex">SEX</label>
                                        <select name="sex" required>
                                            <option disabled selected hidden value="">Select sex:</option>
                                            <option value="M">MALE</option>
                                            <option value="F">FEMALE</option>
                                        </select>
                                    </div>

                                    <div class="il">
                                        <label for="birthdate">BIRTH DATE</label>
                                        <input type="date" name="dob" required>
                                    </div>

                                    <div class="il">
                                        <label for="admissiondate">REGISTER DATE</label>
                                        <input type="date" name="register_date" required>
                                    </div>

                                    <div class="il">
                                        <label style="width: 10%" for="contactnumber">CONTACT NUMBER</label>
                                        <input id="contactnumber" type="text" name="contactnumber" placeholder="+639" required>
                                    </div>

                                    <div class="il">
                                        <label style="width: 10%" for="emailaddress">EMAIL ADDRESS</label>
                                        <input id="emailaddress" type="email" name="emailaddress" placeholder="@urs.edu.ph" required>
                                    </div>
            
                                    <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                        <button type="submit" name="student" value="add">ADD</button>
                                        <button type="submit" name="student" value="edit">EDIT</button>
                                        <button type="submit" name="student" value="edit">CANCEL</button>
                                    </div>
                                </div>
                            </form>';
                        }
                    echo'
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "teacher") {
                    echo '
                    <div class="ms teacher">
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>PROGRAM</th>
                                        <th>CLASS</th>
                                        <th>FULL NAME</th>
                                        <th>SEX</th>
                                        <th>BIRTH DATE</th>
                                        <th>HIRE DATE</th>
                                        <th>CONTACT NUMBER</th>
                                        <td>EMAIL ADDRESS</td>
                                    </tr>
                                </thead>
                                <tbody>
                                ';
                                foreach($teachers as $teacher) {
                                    echo '
                                    <tr>
                                        <td>'.$teacher["id"].'</td>
                                        <td>'.$teacher["program_abbr"].'</td>
                                        <td>'.$teacher["class_class"].'</td>
                                        <td>'.$teacher["full_name"].'</td>
                                        <td>'.($teacher["teacher_sex"] == "M" ? "MALE" : "FEMALE").'</td>
                                        <td>'.$teacher["teacher_dob"].'</td>
                                        <td>'.$teacher["teacher_hire"].'</td>
                                        <td>'.$teacher["teacher_contact"].'</td>
                                        <td>'.$teacher["teacher_email"].'</td>
                                    </tr>
                                    ';
                                }
                                echo '
                                </tbody>
                            </table>
                        </div>
                        <form class="teacher-form" method="post" action="includes/process.php">
                            <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                            <div class="student-input">
                                <div class="il">
                                    <label for="id">ID</label>
                                    <select name="id">
                                        <option disabled selected hidden value="">Choose ID:</option>
                                        ';
                                        foreach($teachers as $teacher) {
                                            echo '
                                            <option value="'.$teacher["id"].'">'.$teacher["id"].'</option>
                                            ';
                                        }
                                        echo'
                                    </select>
                                </div>
                                <div class="err">
                                ';
                                if (isset($_GET["edit_error"]) && $_GET["edit_error"] == 'id_required') {
                                    echo '
                                    <p>EDIT: Please choose an ID</p>
                                    ';
                                }
                                echo'
                                </div>
        
                                <div class="il">
                                    <label for="program">PROGRAM</label>
                                    <select name="program" required>
                                        <option disabled selected hidden value="">Choose program:</option>
                                        ';
                                        foreach($programs as $program) {
                                            echo '
                                            <option value="'.$program["id"].'">'.$program["description"].' ('.$program["abbr"].')</option>
                                            ';
                                        }
                                        echo'
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="class">CLASS</label>
                                    <select name="class" required>
                                        <option disabled selected hidden value="">Choose class:</option>
                                        ';
                                        foreach($classes as $class) {
                                            echo '
                                            <option value="'.$class["id"].'">YEAR '.$class["year"].' - CLASS '.$class["section"].'</option>
                                            ';
                                        }
                                        echo'
                                    </select>
                                </div>
        
                                <div class="il">
                                    <label style="width: 10%" for="firstname">FIRST NAME</label>
                                    <input id="firstname" type="text" name="firstname" placeholder="Enter first name..." required>
                                </div>

                                <div class="il">
                                    <label style="width: 10%" for="lastname">LAST NAME</label>
                                    <input id="lastname" type="text" name="lastname" placeholder="Enter last name..." required>
                                </div>

                                <div class="il">
                                    <label for="sex">SEX</label>
                                    <select name="sex" required>
                                        <option disabled selected hidden value="">Select sex:</option>
                                        <option value="M">MALE</option>
                                        <option value="F">FEMALE</option>
                                    </select>
                                </div>

                                <div class="il">
                                    <label for="birthdate">BIRTH DATE</label>
                                    <input type="date" name="dob" required>
                                </div>

                                <div class="il">
                                    <label for="hiredate">HIRE DATE</label>
                                    <input type="date" name="hire_date" required>
                                </div>

                                <div class="il">
                                    <label style="width: 10%" for="contactnumber">CONTACT NUMBER</label>
                                    <input id="contactnumber" type="text" name="contactnumber" placeholder="+639" required>
                                </div>

                                <div class="il">
                                    <label style="width: 10%" for="emailaddress">EMAIL ADDRESS</label>
                                    <input id="emailaddress" type="email" name="emailaddress" placeholder="@urs.edu.ph" required>
                                </div>
        
                                <div style="padding: 1rem 0; display: flex; gap: 0.2rem; justify-content: flex-end;">
                                    <button type="submit" name="teacher" value="add">ADD</button>
                                    <button type="submit" name="teacher" value="edit">EDIT</button>
                                    <button type="submit" name="teacher" value="edit">CANCEL</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    ';
                } else if (isset($_SESSION["option"]) && $_SESSION["option"] == "report") {
                    echo '
                    <div class="ms report general">
                        <div style="display: flex; flex-flow: row nowrap; gap: 2rem; align-items: center;">
                            <form id="report-form" action="home.php" method="post">
                                <h1>GENERAL REPORTS</h1>
                                <select name="reports">
                                    <option disabled selected hidden value="">Choose Reports</option>
                                    <option '.(($_SESSION["reports"] == "all") ? "selected" : "").' value="all">All</option>
                                    <option '.(($_SESSION["reports"] == "courses") ? "selected" : "").' value="courses">Courses</option>
                                    <option '.(($_SESSION["reports"] == "students") ? "selected" : "").' value="students">Students</option>
                                    <option '.(($_SESSION["reports"] == "teachers") ? "selected" : "").' value="teachers">Teachers</option>
                                </select>
                                <input type="submit" name="report_submit">
                            </form>
                        </div>
                        ';
                        if ($_SESSION["reports"] == "courses" || $_SESSION["reports"] == "all") {
                            echo'
                            <div style="width: 100%; overflow: auto;">
                                
                                <table style="white-space: nowrap; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Courses ('.mysqli_num_rows($course_report_grouped_results).')</th>
                                            <th>Teachers & Classes</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    ';
                                    if (mysqli_num_rows($course_report_grouped_results) != 0) {
                                        foreach($course_report_results as $CRR) {
                                            if (!isset($previous_course)) {
                                                $previous_course = $CRR["course_code"];
                                                $teachers_classes = array($CRR["teacher_fname"]." ".$CRR["teacher_lname"]." ".$CRR["program_abbr"]." ".$CRR["class_year"]."-".$CRR["class_section"]);
                                            } else {
                                                if ($previous_course == $CRR["course_code"]) {
                                                    array_push($teachers_classes, $CRR["teacher_fname"]." ".$CRR["teacher_lname"]." ".$CRR["program_abbr"]." ".$CRR["class_year"]."-".$CRR["class_section"]);
                                                } else {
                                                    echo '
                                                    <tr>
                                                        <td>'.$previous_course.'</td>
                                                        <td>'.implode(", ", $teachers_classes).'</td>
                                                    </tr>
                                                    ';
                                                    $teachers_classes = array();
                                                    $previous_course = $CRR["course_code"];
                                                    array_push($teachers_classes, $CRR["teacher_fname"]." ".$CRR["teacher_lname"]." ".$CRR["program_abbr"]." ".$CRR["class_year"]."-".$CRR["class_section"]);
                                                }
                                            }
                                        }
                                        echo '
                                        <tr>
                                            <td>'.$previous_course.'</td>
                                            <td>'.implode(", ", $teachers_classes).'</td>
                                        </tr>
                                        ';
                                    } else {
                                        echo '
                                        <tr>
                                            <td colspan="2">No Records!</td>
                                        </tr>
                                        ';
                                    }
                                    echo'
                                    </tbody>
                                </table>
                            </div>
                            ';
                        } if ($_SESSION["reports"] == "students" || $_SESSION["reports"] == "all") {
                            echo'
                            <div style="width: 100%; overflow: auto;">
                                <table style="white-space: nowrap; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Students ('.mysqli_num_rows($student_report_results).')</th>
                                            <th>Classes</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    ';  
                                        foreach($student_report_results as $SRS) {
                                            if (isset($current_class) && $current_class == $SRS["student_class"]) {
                                                
                                            } else {
                                                $count = $student_total_report_results->fetch_assoc()["count"];
                                                $current_class = $SRS["student_class"];
                                            }
                                            
                                            echo '
                                            <tr>
                                                <td>'.$SRS["student_fname"]." ".$SRS["student_lname"].'</td>
                                                <td>'.$SRS["program_abbr"].' '.$SRS["class_year"].'-'.$SRS["class_section"].' ('.$count.')</td>
                                            </tr>
                                            ';  
                                        }
                                    echo '
                                    </tbody>
                                </table>
                            </div>
                            ';
                        } if ($_SESSION["reports"] == "teachers" || $_SESSION["reports"] == "all"){
                            echo'
                            <div style="width: 100%; overflow: auto;">
                                <table style="white-space: nowrap; width: 100%;">
                                    <thead>
                                        <tr>
                                            <th>Teachers (10)</th>
                                            <th>Courses & Classes</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Jane Joe D. Doe</td>
                                            <td>GNED 01 BSCS 3-1, GNED 01 BSCS 3-2, GNED 02 BSCS 3-3</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            ';
                        }
                    echo '
                    </div>
                    <div class="ms report grading">
                        <div style="display: flex; flex-flow: row nowrap; gap: 2rem; align-items: center;">
                            <form class="grading-ul" action="home.php" method="post">
                                <h1>GRADE REPORTS</h1>
                                <select name="class" required>
                                    <option disabled selected hidden value="">Class</option>
                                    <option>BSCS 3-1</option>
                                    <option>BSCS 3-2</option>
                                    <option>BSCS 3-3</option>
                                </select>
                                <select name="course" required>
                                    <option disabled selected hidden value="">Course</option>
                                    <option>GNED 01</option>
                                    <option>GNED 02</option>
                                    <option>GNED 03</option>
                                </select>
                            </form>
                        </div>
                        <div style="width: 100%; overflow: auto;">
                            <table style="white-space: nowrap; width: 100%;">
                                <thead>
                                    <tr>
                                        <th>STUDENT ID</th>
                                        <th>NAME</th>
                                        <th>GWA</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>121201211</td>
                                        <td>Jane Joe D. Doe</td>
                                        <td>1.00</td>
                                    </tr>
                                    <tr>
                                        <td>121201212</td>
                                        <td>Joo Joey D. Doe</td>
                                        <td>1.00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    ';
                }
            ?>
        </section>
    </main>
</body>
</html>
