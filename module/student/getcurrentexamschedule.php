<?php  
include_once('main.php');
 $em = $_REQUEST['curid'];


$courseincurr = "SELECT * FROM examschedule WHERE courseid='$em' ";
$resc = $link->query($courseincurr);

echo "<tr> <th>Exam Date:</th><th>Exam Time:</th></tr>";
// while($r=mysql_fetch_array($resc))
while($r = $resc->fetch_assoc())
{
 echo "<tr><td>",$r['examdate'],"</td><td>",$r['time'],"</td></tr>";

}


?>
