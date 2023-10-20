<?php

function getTable($connection, $table, $in_course_page=false, $simple=false) {
    if ($table == "course" && !$in_course_page) {
        $sql = "SELECT * FROM $table ORDER BY `code`;";
        return mysqli_query($connection, $sql);
    } else if ($table == "student" && $simple) {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    } else if ($table == "student") {
        $sql = "SELECT `student`.`id` `id`, `program`.`abbr` `program_abbr`, CONCAT('YEAR ', `class`.`year`, ' - CLASS ', `class`.`section`) `class_class`, CONCAT(`student`.`f_name`, ' ',`student`.`l_name`) `full_name`, `student`.`sex` `student_sex`, `student`.`dob` `student_dob`, `student`.`phone_no` `student_contact`, `student`.`email` `student_email`, `student`.`register_date` `student_register` FROM `student_enroll` INNER JOIN `student` ON `student_enroll`.`student_id` = `student`.`id` INNER JOIN `enroll` ON `enroll`.`id` = `student_enroll`.`enroll_id` INNER JOIN `program` ON `program`.`id` = `enroll`.`program_id` INNER JOIN `class` ON `class`.`id` = `enroll`.`class_id` GROUP BY `id` ORDER BY `id`;";
        return mysqli_query($connection, $sql);
    } else if ($table == "teacher" && $simple) {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    } else if ($table == "teacher") {
        $sql = "SELECT `teacher`.`id` `id`, `class`.`year` `class_year`, `class`.`section` `class_section`, `teacher`.`f_name` `teacher_fname`, `teacher`.`l_name` `teacher_lname`, `teacher`.`dob` `teacher_dob`, `teacher`.`hire_date` `teacher_hire`, `teacher`.`sex` `teacher_sex`, `teacher`.`phone_no` `teacher_contact`, `teacher`.`email` `teacher_email`, `program`.`abbr` `program_abbr` FROM `teacher` INNER JOIN `teacher_teaches` ON `teacher`.`id` = `teacher_teaches`.`teacher_id` INNER JOIN `enroll` ON `enroll`.`id` = `teacher_teaches`.`enroll_id` INNER JOIN `class` ON `enroll`.`class_id` = `class`.`id` INNER JOIN `program` ON `program`.`id` = `enroll`.`program_id` GROUP BY `id`;";
        return mysqli_query($connection, $sql);
    } else if ($simple) {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    } else {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    }
}

function getRecord($connection, $table, $id) {
    $sql = "SELECT * FROM $table WHERE `id` = '$id';";
    $record = mysqli_query($connection, $sql);
    return $record->fetch_assoc();
}

?>