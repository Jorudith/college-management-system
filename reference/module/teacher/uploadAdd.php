<?php
include_once('main.php');

function reArrayFiles(&$file_post){
    $file_ary = array();
    $file_count = count($file_post['name']);
    $file_keys = array_keys($file_post);

    for($i = 0; $i<$file_count; $i++){
        foreach($file_keys as $key){
            $file_ary[$i][$key] = $file_post[$key][$i];
        }
    }

    return $file_ary;
}


function pre_r($array){
    echo '<pre>';
    print_r($array);
    echo '</pre>';
}


if(isset($_POST['submit'])){

    $title = $_POST['title'];
    $category = $_POST['category'];
    $description = $_POST['description'];
    $date = date('Y-m-d');

        $phpFileUploadErrors = array(
            0 => 'There is no error, the file uploaded with success',
            1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
            2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML Form',
            3 => 'The uploaded file was only partially uploaded',
            4 => 'No file was uploaded',
            6 => 'Missing a temporary folder',
            7 => 'Failed to write file to disk',
            8 => 'A PHP extension stopped the file upload.',
        );

        if(isset($_FILES['userfile'])){

            

            $file_array = reArrayFiles($_FILES['userfile']);

            for($i = 0; $i<count($file_array); $i++){
                if($file_array[$i]['error']){
                    ?> <div class="alert alert-danger">
                    <?php echo $file_array[$i]['name'].' - '.$phpFileUploadErrors[$file_array[$i]['error']];
                    ?> </div> <?php
                }

                else{
                    $extensions = array('jpg', 'png', 'gif', 'jpeg', 'pdf');

                    $file_ext = explode('.', $file_array[$i]['name']);

                    // pre_r($file_ext);
                    // die; 
                    // $file_ext = end($file_ext);

                    $name = $file_ext[0];
                    $name = preg_replace("!-!", " ", $name);
                    $name = ucwords($name);
                    

                    $file_ext = end($file_ext);

                    if(!in_array($file_ext, $extensions)){
                        ?> <div class="alert alert-danger">
                        <?php echo "{$file_array[$i]['name']} - Invalid File Extension!";
                        ?> </div> <?php
                    }

                    else {

                        $img_dir = '../../source/'.$file_array[$i]['name'];

                        move_uploaded_file($file_array[$i]['tmp_name'], $img_dir);

                        $sql = "INSERT IGNORE INTO files (title, category, description, name, image_dir, date) VALUES ('$title', '$category', '$description', '$name', '$img_dir', '$date')";
                        $success = $link->query($sql);
                        // $mysqli->query($sql) or die ($mysqli->error);

                        ?> <div class="alert alert-success">
                        </div> <?php

                        echo '<script>alert("Successfully Uploaded File")</script>';
                        echo '<script>window.location.href = "uploadView.php"</script>';
                    }


                }

            }
        }

        
        



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
			  
              <div>
                <form action="" method="POST" enctype="multipart/form-data">
                    <div>
                        <label for="">Title:</label>
                        <input type="text" name="title" id="title" class="title" required>
                    </div>

                    <div>
                        <label for="">Category:</label>
                        <select name="category" id="category">
                            <option value=""></option>
                            <option value="Certificate">Certificate File</option>
                            <option value="Capstone">Capstone File</option>
                            <option value="Other">Other File</option>
                        </select>
                        
                    </div>

                    <div>
                        <label for="">Description:</label>
                        <input type="text" name="description" id="description" class="description" required>
                    </div>

                    <div>
                        <label for="">File:</label>
                        <input type="file" name="userfile[]" id="userfile" class="" required>
                    </div>

                    <div>
                        
                        <input type="submit" name="submit" id="" class="" >
                    </div>
                </form>
              </div>
			  
			  </center>
		</body>
</html>
