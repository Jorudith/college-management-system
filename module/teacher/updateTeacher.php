<?php
include_once('main.php');
?>
<html>
    <head>
		    <link rel="stylesheet" type="text/css" href="../../source/CSS/style.css">
				<script src = "JS/login_logout.js"></script>
               <script src = "JS/searchForUpdateTeacher.js"></script>
		</head>
    <body>
			 <?php include('index.php'); ?>
						</li>
				</ul>
			  <hr/>

        </center>
        <br/>
        <center>
          <h2>Update your profile!!!.</h2>
            <form action="#" method="post" onsubmit="return newTeacherValidation();">
                <table border="1" cellpadding="6" id='updateTeacherData'>
				<?php include ('searchForUpdateTeacher.php'); ?>
                </table>
            </form>
        </center>
		</body>
</html>
<?php
include_once('../../service/mysqlcon.php');
if(!empty($_POST['submit'])){
    $teaId = $_POST['id'];
    $teaName = $_POST['name'];
    $teaPassword = $_POST['password'];
    $teaPhone = $_POST['phone'];
    $teaEmail = $_POST['email'];
    $teagender = $_POST['gender'];
    $teaDOB = $_POST['dob'];
    $teaAddress = $_POST['address'];
    $sql = "UPDATE teachers SET id='$teaId', name='$teaName', password='$teaPassword', phone='$teaPhone', email='$teaEmail', sex='$teagender', dob='$teaDOB',address='$teaAddress' WHERE id='$teaId'";
	$sql1="UPDATE users SET password='$teaPassword' where userid='$teaId'";
	
    // $success = mysql_query( $sql,$link );
    $success = $link->query($sql);
	// $success1=mysql_query( $sql1,$link );
    $success1 = $link->query($sql1);
    if(!$success||!$success1) {
        die('Could not Update data: '.mysql_error());
    }
    echo '<script>alert("Update data successfully")</script>';
    echo '<script>window.location.href="updateTeacher.php"</script>';
    // echo "Update data successfully\n";
	
}
?>
