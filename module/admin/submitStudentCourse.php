<?php
include_once('main.php');
include_once('../../service/mysqlcon.php');
echo 'a';
if(!empty($_GET)){
    $courseid = $_GET['courseid'];
    $classid = $_GET['classid'];
    $teacherid = $_GET['teacherid'];
    $studentid = $_GET['studentid'];
    $courseName = $_GET['coursename'];
    $sql = "SELECT id from students where classid='$classid'";
    $res = $link->query($sql);
    // $res = mysql_query($sql,$link);
    $row_cnt = $res->num_rows;
    echo $row_cnt;
    while($row_cnt && $row = $res->fetch_assoc()){
        print_r($row);
        // echo $studentid = $row['id'];
        
        if(!$success) {
            die('Could not enter data: ');
        }
        // echo "Entered data successfully\n";
        
        // $row_cnt = $row_cnt - 1;
    }

    $sql = "INSERT INTO course VALUES('$courseid','$courseName','$teacherid','$studentid','$classid')";
    $success = $link->query($sql);
    // if(!$success) {
    //     die('Could not enter data: ');
    // }
    echo '<script>Entered data successfully</script>';
    echo '<script>window.location.href="course.php"</script>';
}
?>
