<?php
session_start();
$host="localhost";
$username="root";
$password="";
$db_name="schoolmsdb";
$link= new mysqli("$host", "$username", "$password",$db_name)or die("Cannot Connect");
// mysql_select_db("$db_name")or die("Cannot Select DB");
?>
