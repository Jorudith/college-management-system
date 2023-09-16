<?php  
include_once('main.php');
$attendmon = "SELECT DISTINCT (date) FROM attendance WHERE  MONTH( DATE ) = MONTH( CURRENT_DATE ) and YEAR( DATE )=YEAR( CURRENT_DATE )  and date not in (select DISTINCT(date) from attendance where attendedid='$check' and MONTH( DATE ) = MONTH( CURRENT_DATE ) and YEAR( DATE )=YEAR( CURRENT_DATE ))";
// $resmon = mysql_query($attendmon);
$resmon = $link->query($attendmon);
echo "<tr> <<th>Absent Date:</th></tr>";
while($r=$resmon->fetch_assoc())
{
 echo "<tr><td>",$r['date'],"</td></tr>";

}
?>
