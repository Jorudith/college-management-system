<?php  
include_once('main.php');
$password=$_REQUEST['password'];
$mod = "UPDATE students, users SET students.password='$password',users.password = '$password' WHERE students.id = users.userid AND students.id ='$check'";
// $resmon = mysql_query($mod);
$resmon = $link->query($mod);
echo '<script>alert("Successfully Change Password")</script>';
header('location:modify.php');
?>
