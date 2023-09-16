<?php
include_once('main.php');
include_once('../../service/mysqlcon.php');
if($_POST['submit']){
    $id = $_POST['id'];
    $sql = "DELETE FROM teachers WHERE id = '$id';";
    $success = $link->query($sql);
    $sql = "DELETE FROM users WHERE userid = '$id';";
    $success = $link->query($sql);
    if(!$success) {
        die('Could not Delete data: '.mysql_error());
    }
    unlink('../images/'.$id.'.jpg');
    echo '<script>alert("Deleted data successfully")</script>';
    echo '<script>window.location.href="deleteTeacher.php"</script>';
}
?>
