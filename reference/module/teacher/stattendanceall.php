<?php  
include_once('../../service/mysqlcon.php');
$check=$_REQUEST['classid'];
$attendmon = "SELECT DISTINCT(date) FROM attendance WHERE attendedid='$check'";
// $resmon = mysql_query($attendmon);
$resmon = $link->query($attendmon);
echo "<tr> <th>Attend All Dates:</th></tr>";
while($r=$resmon->fetch_assoc())
{
 echo "<tr><<td>",$r['date'],"</td></tr>";

}
?>
