<?php  
include_once('main.php');
 $em = $_REQUEST['id'];


$courseinfo = "SELECT * FROM grade WHERE courseid='$em' and studentid='$check'";
$resc = $link->query($courseinfo);

echo "<tr> <th>Grade</th> </tr>";
while($r = $resc->fetch_assoc())
{
 echo "<tr> <td>",$r['grade'],"<td></tr>";

}


?>
