<?php
include_once('main.php');
include_once('../../service/mysqlcon.php');
$searchKey = $_GET['key'];
$string = "<option>SELECT AN OPTION</option>";
// $sql="SELECT * FROM teachers WHERE id = (SELECT teacherid FROM takencoursebyteacher WHERE courseid = '$searchKey')";
$sql="SELECT * FROM teachers";
// $res = mysql_query($sql);
$res = $link->query($sql);
while($row = $res->fetch_assoc()){
    echo $row['id'].'<br/>';
    $string .= "<option value='".$row['id']."'>".$row['name']."</option>";
}
echo $string;
?>
