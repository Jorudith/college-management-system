<?php
include('main.php');


?>
        <html>
		
			<head>
              
		    <link rel="stylesheet" type="text/css" href="../../source/CSS/style.css">
			<script type="text/javascript" src="jquery-1.12.3.js"></script>
			<script type="text/javascript" src="studentClassCourse.js"></script>
			<script src = "JS/login_logout.js"></script>
			
				</head>
				<div class="header"><h1>College Management System</h1></div>
			  <div class="divtopcorner">
			  <img src="../../source/URS-Logo.jpg" height="150" width="150" alt="School Management System"/>
				</div>
			<br/><br/>
				<ul>
				    <li class="manulista" align="center">
						    <a class ="menulista" href="index.php">Home</a>
								<a class ="menulista" href="updateAttendence.php">Update Attendence</a>
								<a class ="menulista" href="deleteatt.php">Delete Attendende</a>
								
								<div align="center">
								<h4>Hi! <?php echo $check." ";?></h4>
								    <a class ="menulista" href="logout.php" onmouseover="changemouseover(this);" onmouseout="changemouseout(this,'<?php echo ucfirst($loged_user_name);?>');"><?php echo "Logout";?></a>
						    </div>
						</li>
				</ul>
			  <hr/>
		</html>
<center> <h1>Students Attendance</h1></center>
<?php
include('main.php');
$cid=$_REQUEST['mycourse'];
$clid=$_REQUEST['myclass'];
echo '<form  action="makeattendance.php" method="post">';
// $conn= new mysqli('localhost','root','');
// if(!$conn){
//    die('error connecting ');
//    }
//    mysql_select_db('schoolmanagementsystemdb',$conn);
   
  $sql="SELECT studentid FROM course where classid='$clid' and id='$cid' and teacherid='$check'";
//   $res=mysql_query($sql);
  $res = $link->query($sql);
  


 while($rn = $res->fetch_assoc())
{
	// echo $rn['studentid'];

	
	
	echo "<center>";
	// echo $rn['0'];
	echo "<span>".$rn['studentid']."</span>";
    echo "<input type='checkbox' checked='checked' name='attendance[]' value=".$rn['studentid']." /> <br /><br />";
   
   
     }
	 
   echo "<input class='menulista' type='submit' value='Make Attendance' />";
  echo " </form> </html>";
  echo "</center>";

?>
