<?php  
include_once('main.php');
 $em = $_REQUEST['id'];


$courseinfo = "SELECT * FROM students WHERE id in (select DISTINCT studentid from course  where id='$em' and teacherid='$check')";
// $resc = mysql_query($courseinfo);

$resc = $link->query($courseinfo);


while($r = $resc->fetch_assoc())
{
 echo '<option value="',$r['id'],'" >',$r['name'],'</option>';

}


?>
