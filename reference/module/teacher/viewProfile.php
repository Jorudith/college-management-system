<?php
include_once('main.php');
include_once('../../service/mysqlcon.php');
include_once('index.php');
?>
<html>
<body>
<div align="center">
<img src="../images/<?php echo $check ?>.jpg" alt="<?php echo $check ?>"/>
</div>


<div class ="header">
<?php
$sql = "SELECT * FROM teachers WHERE id='$check';";
$res = $link->query($sql);

while($row = $res->fetch_assoc()){
   echo "<center>";
   echo "ID: ".$row['id']."<br />";
   echo "Name: ".$row['name']."<br />";
   echo "Phone: ".$row['phone']."<br />";
   echo "Date of Birth: ".$row['dob']."<br />";
   echo "Phone ".$row['phone']."<br />";
   echo "Email Address: ".$row['email']."<br />";
   echo "Sex: ".$row['sex']."<br />";
   echo "Hire DAte: ".$row['hiredate']."<br />";
   
   echo "</center>";
   
}
?>
</div>
</body>
</html>