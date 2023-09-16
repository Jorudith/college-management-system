<?php
include_once('../../service/mysqlcon.php');
$check=$_SESSION['login_id'];
$session= "SELECT name  FROM admin WHERE id='$check' ";
$result = $link->query($session);
$row = $result->fetch_assoc();
$login_session = $loged_user_name = $row['name'];
if(!isset($login_session)){
    header("Location:../../");
}
?>
<html>
    <head>
		    <link rel="stylesheet" type="text/css" href="../../source/CSS/style.css">
				<script src = "JS/login_logout.js"></script>
		</head>
    <body>
	<div class="header"><h1>College Management System</h1></div>
			  <div class="divtopcorner">
			  <img src="../../source/URS-Logo.jpg" height="150" width="150" alt="School Management System"/>
				</div>
			<br/><br/>
				<ul>
				    <li class="manulist">
						    <a class ="menulista" href="index.php">Home</a>
                <a class ="menulista" href="addStudent.php">New Student</a>
                <a class ="menulista" href="viewStudent.php">View Student</a>
                <a class ="menulista" href="updateStudent.php">Update Student</a>
                <a class ="menulista" href="deleteStudent.php">Delete Student</a>
								<div align="center">
								<h4>Hi!admin <?php echo $check." ";?></h4>
								<a class ="menulista" href="logout.php" onmouseover="changemouseover(this);" onmouseout="changemouseout(this,'<?php echo ucfirst($loged_user_name);?>');"><?php echo "Logout";?></a>
						</div>
						</li>
				</ul>
			  <hr/>
		</body>
</html>
