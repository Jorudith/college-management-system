<?php  
include_once('main.php');
 $emn = $_REQUEST['classname'];


$courses = "SELECT DISTINCT id,name FROM course WHERE classid in (select id from class where  name='$emn') and studentid='$check'";
// $rescourse = mysql_query($courses);
$rescourse = $link->query($courses);


while($r = $rescourse->fetch_assoc())
{
 echo '<option value="',$r['id'],'" >',$r['name'],'</option>';

}


?>
