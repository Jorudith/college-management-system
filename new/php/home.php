<?php
    include "includes/dbh.php";
    session_start();

    $year = $_POST["year"] ?? "";
    $month = $_POST["month"] ?? "";
    $status = $_POST["status"] ?? "";
    $role = $_POST["role"] ?? "";

    // $year_sql = "SELECT DISTINCT YEAR(`date`) `year` FROM `attendance`;";
    // $year_results = mysqli_query($conn, $year_sql);
    
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" charset="UTF-8" type="text/css" href="../css/style.css">

    <link rel="icon" href="">
    <title>College Management System</title>
</head>
<body>
    <header>
        <div class="header-logo">
            <img src="../img/URS-Logo.jpg" alt="University of Rizal System Logo">
        </div>
        <div style="display: flex; flex-flow: column nowrap; gap: 1rem;">
            <h1 style="font-size: 2rem; font-weight: 800;">Welcome, 
                <?php
                    $substr = substr($_SESSION["username"], 0, 2);
                    if ($substr === "ad") {
                        echo "Admin!";
                    } else if ($substr === "te") {
                        echo "Teacher!";
                    } else if ($substr === "st") {
                        echo "Student!";
                    }
                ?>
            </h1>
            <div style="display: flex; gap: 0 1em; align-items: flex-end;">
                <ul class="navigation-ul">
                    <li>Home</li>
                    <li>Attendance</li>
                    <li>Capstone Schedules</li>
                    <li>Courses</li>
                    <li>Students</li>
                    <li>Teachers</li>
                    <li>Reports</li>
                </ul>
                <h3 style="font-size: 1.4rem; font-weight: 650;"><a href="../index.php">LOGOUT</a></h3>
            </div>
        </div>
    </header>
    <main>
        <section>
            <div class="attendance">
                <div style="display: flex; flex-flow: row nowrap; gap: 2rem; align-items: center;">
                    <form style="display: flex; gap: 2rem;">
                        <select style="text-align: center; font-weight: 600;" name="year" required>
                            <option disabled selected hidden value="">Year</option>
                            <?php
                                foreach($year_results as $year_result) {
                                    $curr_year = $year_result["year"];
                                    echo "<option ".($year == $curr_year ? "selected" : "").">$curr_year</option>";
                                }
                            ?>
                        </select>
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
                        <select style="text-align: center; font-weight: 600;" name="status" required>
                            <option disabled selected hidden value="">Status</option>
                            <option <?php echo $status == "present" ? "selected" : ""; ?> value="present">Present</option>
                            <option <?php echo $status == "absent" ? "selected" : ""; ?> value="absent">Absent</option>
                        </select>
                        <select style="text-align: center; font-weight: 600;" name="role" required>
                            <option disabled selected hidden value="">Role</option>
                            <option <?php echo $role == "admin" ? "selected" : ""; ?> value="admin">Admin</option>
                            <option <?php echo $role == "teacher" ? "selected" : ""; ?> value="teacher">Teacher</option>
                            <option <?php echo $role == "student" ? "selected" : ""; ?> value="student">Student</option>
                        </select>
                        <button type="submit" name="submit" value="submit">SEE ATTENDANCE</button>
                    </form>
                </div>
                <div>
                    <table class="attendance-tb">
                        <tr>
                            <th style="font-weight: 650;">DATE</th>
                            <th style="width: 15%; font-weight: 650;">STATUS</th>
                            <th style="width: 60%; font-weight: 650;">NAME</th>
                        </tr>
                        <tr>
                            <td>2023 September 30</td>
                            <td>Present</td>
                            <td>John Doe</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="capstoneschedule">
                <div style="width: 100%;">
                    <table class="capstoneschedule-tb">
                        <tr>
                            <th style="font-weight: 650;">ID</th>
                            <th style="font-weight: 650;">DATE & TIME</th>
                            <th style="font-weight: 650;">CLASS</th>
                            <th style="font-weight: 650;">COURSE</th>
                        </tr>
                        <tr>
                            <td>00001</td>
                            <td>2080 September 30 20:20AM</td>
                            <td>BSCS 3-3</td>
                            <td>COSC 880</td>
                        </tr>
                    </table>
                </div>
                <form class="capstoneschedule-form">
                    <h1 style="font-size: 5rem; font-weight: 800;">FORM</h1>

                    <div class="capstoneschedule-input">
                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="id">ID</label>
                            <select style="width: 60%;">
                                <option value="0">Choose ID:</option>
                                <option value="1">00001</option>
                            </select>
                        </div>

                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="date">DATE</label>
                            <input style="width: 60%;" type="date">
                        </div>

                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="class">CLASS</label>
                            <input style="width: 60%; font-size: 1.4rem;" id="class" type="text" name="class" placeholder="Enter class..." required>
                        </div>

                        <div style="display: flex; flex-flow: row nowrap; justify-content: space-between; gap: 2rem;">
                            <label style="font-weight: 650;" for="course">COURSE</label>
                            <input style="width: 60%; font-size: 1.4rem;" id="course" type="text" name="course" placeholder="Enter course..." required>
                        </div>
                    </div>
                </form>
            </div>
        </section>
    </main>
</body>
</html>