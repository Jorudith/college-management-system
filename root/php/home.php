<?php
    include "includes/dbh.php";
    session_start();

    $year = $_POST["year"] ?? "";
    $month = $_POST["month"] ?? "";
    $status = $_POST["status"] ?? "";
    $role = $_POST["role"] ?? "";

    $year_sql = "SELECT DISTINCT YEAR(`date`) `year` FROM `attendance`;";
    $year_results = mysqli_query($conn, $year_sql);
    
?>

<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="icon" href="">
    <title>College Management System</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" charset="UTF-8" type="text/css" href="../css/style.css">
</head>
<body>
    <main>
        <section>
            <div class="fxbx">
                <h1 style="display: inline;">Welcome, 
                    <?php
                        $substr = substr($_SESSION["username"], 0, 2);
                        if ($substr === "ad") {
                            echo "Admin";
                        } else if ($substr === "te") {
                            echo "Teacher";
                        } else if ($substr === "st") {
                            echo "Student";
                        }
                    ?>
                </h1>
                <p style="position: relative; left: 2rem; display: inline;"><a href="../index.php">LOG OUT</a></p>
                <div class="fxbx mnct" style="margin-top: 2rem;">
                    <div class="mnbx">
                        <p style="text-align: center; font-weight: 600;">Attendance</p>
                    </div>
                    <div class="mnbx">
                        <p style="text-align: center; font-weight: 600;">Capstone Schedules</p>
                    </div>
                    <div class="mnbx">
                        <p style="text-align: center; font-weight: 600;">Reports</p>
                    </div>
                    <div class="mnbx">
                        <p style="text-align: center; font-weight: 600;">Courses</p>
                    </div>
                    <div class="mnbx">
                        <p style="text-align: center; font-weight: 600;">Students</p>
                    </div>
                    <div class="mnbx">
                        <p style="text-align: center; font-weight: 600;">Teachers</p>
                    </div>
                </div>
                <div class="att">
                    <form class="fxbx mnct form" style="margin: 2rem 0;" action="home.php" method="post">
                        <div class="mnbx">
                            <select style="text-align: center; font-weight: 600;" name="year" required>
                                <option disabled selected hidden value="">Year</option>
                                <?php
                                    foreach($year_results as $year_result) {
                                        $curr_year = $year_result["year"];
                                        echo "<option ".($year == $curr_year ? "selected" : "").">$curr_year</option>";
                                    }
                                ?>
                            </select>
                        </div>  
                        <div class="mnbx">
                            <select style="text-align: center; font-weight: 600;" name="month" required>
                                <option disabled <?php echo empty($month) ? "selected" : ""; ?> hidden value="">Month</option>
                                <option <?php echo $month == "all" ? "selected" : ""; ?> value="all">All months</option>
                                <option <?php echo $month == "1" ? "selected" : ""; ?> value="1">January</option>
                                <option <?php echo $month == "2" ? "selected" : ""; ?> value="2">February</option>
                                <option <?php echo $month == "3" ? "selected" : ""; ?> value="3">March</option>
                                <option <?php echo $month == "4" ? "selected" : ""; ?> value="4">April</option>
                                <option <?php echo $month == "5" ? "selected" : ""; ?> value="5">May</option>
                                <option <?php echo $month == "6" ? "selected" : ""; ?> value="6">June</option>
                                <option <?php echo $month == "7" ? "selected" : ""; ?> value="7">July</option>
                                <option <?php echo $month == "8" ? "selected" : ""; ?> value="8">August</option>
                                <option <?php echo $month == "9" ? "selected" : ""; ?> value="9">September</option>
                                <option <?php echo $month == "10" ? "selected" : ""; ?> value="10">October</option>
                                <option <?php echo $month == "11" ? "selected" : ""; ?> value="11">November</option>
                                <option <?php echo $month == "12" ? "selected" : ""; ?> value="12">December</option>
                            </select>
                        </div>
                        <div class="mnbx">
                            <select style="text-align: center; font-weight: 600;" name="status" required>
                                <option disabled selected hidden value="">Status</option>
                                <option <?php echo $status == "present" ? "selected" : ""; ?> value="present">Present</option>
                                <option <?php echo $status == "absent" ? "selected" : ""; ?> value="absent">Absent</option>
                            </select>
                        </div>
                        <div class="mnbx">
                            <select style="text-align: center; font-weight: 600;" name="role" required>
                                <option disabled selected hidden value="">Role</option>
                                <option <?php echo $role == "admin" ? "selected" : ""; ?> value="admin">Admin</option>
                                <option <?php echo $role == "teacher" ? "selected" : ""; ?> value="teacher">Teacher</option>
                                <option <?php echo $role == "student" ? "selected" : ""; ?> value="student">Student</option>
                            </select>   
                        </div>
                        <div class="mnbx">
                            <button type="submit" name="submit" value="submit" style="text-align: center; font-weight: 600;">Submit</button>
                        </div>
                    </form>
                </div>
                <div>
                    <div style="display: inline">
                        <?php
                            // if (isset($_POST["submit"]) && $_POST == "submit") {
                            //     $attendance_sql = "SELECT * FROM `attendance` ORDER BY `date` ASC;";
                            //     $attendance_results = mysqli_query($conn, $attendance_sql);

                            //     echo "
                            //     <table>
                            //         <tr>
                            //             <th class='date' style='font-weight: 600;'>Date</th>
                            //             <th class='status' style='font-weight: 600;'>Status</th>
                            //             <th class='name' style='font-weight: 600;'>Name</th>
                            //         </tr> 
                            //     ";
                            //     foreach($attendance_results as $attendance_result) {
                            //         echo "
                            //         <tr>
                            //             <td>$year</td>
                            //             <td>$status</td>
                            //             <td>".$attendance_result[""]."
                            //         </tr>
                            //         ";
                            //     }
                            //     echo "
                            //     </table>
                            //     ";
                            // }
                        ?>
                        <table>
                        <tr>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Name</th>
                        </tr>
                        <tr>
                            <td>2023 September 1</td>
                            <td>Present</td>
                            <td>John Doe
                            </td>
                        </tr>
                        </table>
                        <!-- </table> -->
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
</html>