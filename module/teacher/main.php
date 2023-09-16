<?php
include_once('../../service/mysqlcon.php');
$check=$_SESSION['login_id'];
$session="SELECT name  FROM teachers WHERE id='$check' ";
$result = $link->query($session);
$row = $result->fetch_assoc();
$login_session = $loged_user_name = $row['name'];
if(!isset($login_session))
{
header("Location:../../");
}

?>
