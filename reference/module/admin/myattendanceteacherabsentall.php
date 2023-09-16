<?php  
include_once('main.php');
$sid=$_REQUEST['id'];
$attendmon = "SELECT DISTINCT (date) FROM attendance WHERE  date not in (select DISTINCT(date) from attendance where attendedid='$sid' )";
$resmon = $link->query($attendmon);
echo "<tr> <th>Absent All Dates:</th></tr>";
while($r = $resmon->fetch_assoc())
{
 echo "<tr><<td>",$r['date'],"</td></tr>";

}
?>
