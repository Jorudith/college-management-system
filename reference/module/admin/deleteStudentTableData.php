<?php
include_once('main.php');
include_once('../../service/mysqlcon.php');
if($_POST['submit']){
    $id = $_POST['id'];
    $sql = "DELETE FROM students WHERE id = '$id';";
    $success = $link->query($sql);
    // $success = mysql_query( $sql,$link );
    $sql = "DELETE FROM users WHERE userid = '$id';";
    $success = $link->query($sql);
    if(!$success) {
        die('Could not Delete data: '.mysql_error());
    }
    unlink('../images/'.$id.'.jpg');
    // echo "Delete data successfully\n";
    
    echo '<script>alert("Deleted data successfully")</script>';
    echo '<script>window.location.href="deleteStudent.php"</script>';
}
?>
