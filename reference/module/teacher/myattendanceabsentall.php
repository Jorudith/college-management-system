<?php  
include_once('main.php');
$attendmon = "SELECT DISTINCT (date) FROM attendance WHERE  date not in (select DISTINCT(date) from attendance where attendedid='$check' )";
// $resmon = mysql_query($attendmon);
$resmon = $link->query($attendmon);
echo "<tr> <th>Absent All Dates:</th></tr>";
while($r=$resmon->fetch_assoc())
{
 echo "<tr><<td>",$r['date'],"</td></tr>";

}
?>
