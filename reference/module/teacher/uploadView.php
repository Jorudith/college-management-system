<?php
include_once('main.php');
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
								<a class ="menulista" href="updateTeacher.php">Update Profile</a>
								<a class ="menulista" href="viewProfile.php">View Profile</a>
								<a class ="menulista" href="course.php">Students Grade</a>
								<a class ="menulista" href="courses.php">Courses</a>
								<a class ="menulista" href="attendance.php">Attendance</a>
								<a class ="menulista" href="exam.php">Capstone Schedule</a>
                                <a class ="menulista" href="uploadView.php">Upload Files</a>
								<!-- <a class ="menulista" href="salary.php">Salary</a> -->
								<a class ="menulista" href="report.php">Report</a>
								<!-- <a class ="menulista" href="searchStudent.php">Search Portal</a> -->
								<div align="center">
								<h4>Hi! <?php echo $check." ";?></h4>
								    <a class ="menulista" href="logout.php" onmouseover="changemouseover(this);" onmouseout="changemouseout(this,'<?php echo ucfirst($loged_user_name);?>');"><?php echo "Logout";?></a>
						    </div>
						</li>
				</ul>
			  <hr/>
			
			  <center>
			  <a href="uploadAdd.php" style="text-decoration: none; margin-bottom: 10px; display: inline-block; padding: 8px 12px; background-color: black; color: white;">Upload Files</a>
			  <table border="1" cellpadding="6">
				<thead>
					<!-- <th>Uploader</th> -->
					<th>Title</th>
					<th>Category</th>
					<th>Description</th>
					<th>Files</th>
					<th>Date Uploaded</th>
				</thead>
				<?php 
				
				$sql = "SELECT * FROM files";
				$result = $link->query($sql);
				
				?>
				<tbody>
					<?php if($result->num_rows > 0){?>
						<?php while($row = $result->fetch_assoc()){?>
							<tr>
								<!-- <td><?php echo $row[''];?></td> -->
								<td><?php echo $row['title'];?></td>
								<td><?php echo $row['category'];?></td>
								<td><?php echo $row['description'];?></td>
								<td>
									<a href="<?php echo $row['image_dir'];?>"><?php echo $row['image_dir'];?></a>
								</td>
								<td><?php echo $row['date'];?></td>
							</tr>
						<?php } ?>
					<?php } ?>
				</tbody>
			  </table>
			  </center>
		</body>
</html>
