<?php

function getTable($connection, $table, $in_course_page=false, $simple=false) {
    if ($table == "course" && !$in_course_page) {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    } else if ($table == "course" && $in_course_page) {
        $sql = "SELECT `course`.`id` `course_id`, `enroll`.`id` `enroll_id`, `course`.`code` `course_code`, `course`.`name` `course_name`, `program`.`abbr` `program_abbr`, CONCAT('YEAR ', `class`.`year`, ' - CLASS ', `class`.`section`) `class_class` FROM `enroll` INNER JOIN `course` ON `course`.`id` = `enroll`.`course_id` INNER JOIN `program` ON `program`.`id` = `enroll`.`program_id` INNER JOIN `class` ON `class`.`id` = `enroll`.`class_id`;";
        return mysqli_query($connection, $sql);
    } else if ($table == "student" && $simple) {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    } else if ($table == "student") {
        $sql = "SELECT `student`.`id` `id`, `program`.`abbr` `program_abbr`, CONCAT('YEAR ', `class`.`year`, ' - CLASS ', `class`.`section`) `class_class`, CONCAT(`student`.`f_name`, ' ',`student`.`l_name`) `full_name`, `student`.`sex` `student_sex`, `student`.`dob` `student_dob`, `student`.`phone_no` `student_contact`, `student`.`email` `student_email`, `student`.`register_date` `student_register` FROM `student` INNER JOIN `program` ON `program`.`id` = `student`.`program_id` INNER JOIN `class` ON `class`.`id` = `student`.`class_id` GROUP BY `id` ORDER BY `id`;";
        return mysqli_query($connection, $sql);
    } else if ($table == "teacher" && $simple) {
        $sql = "SELECT * FROM $table;";
        return mysqli_query($connection, $sql);
    } else if ($table == "teacher") {
        $sql = "SELECT `teacher`.`id` `id`, `program`.`abbr` `program_abbr`, CONCAT('YEAR ', `class`.`year`, ' - CLASS ', `class`.`section`) `class_class`, CONCAT(`teacher`.`f_name`, ' ',`teacher`.`l_name`) `full_name`, `teacher`.`sex` `teacher_sex`, `teacher`.`dob` `teacher_dob`, `teacher`.`phone_no` `teacher_contact`, `teacher`.`email` `teacher_email`, `teacher`.`hire_date` `teacher_hire` FROM `teacher` INNER JOIN `program` ON `program`.`id` = `teacher`.`program_id` INNER JOIN `class` ON `class`.`id` = `teacher`.`class_id` GROUP BY `id` ORDER BY `id`;";
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